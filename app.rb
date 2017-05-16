require 'sinatra'
require 'sinatra/activerecord'
# here activerecord is contained within the sinatra gem.

set :database, 'sqlite3:firstdb.sqlite3'
# names database firstdb. Change this when you make new ones!

require './models'

get '/' do
    @blogs = Blog.all
    erb :index
end

post '/new_blog' do
    Blog.create(title: params[:title], category: params[:category], content: params[:content])

    redirect '/'
end

get '/search' do
    p params
    if params[:category]
        @search_results = Blog.where(category: params[:category])
    else
        @search_results = ""
    end
    p @search_results

    @blogs = Blog.all
    @categories = []
    @blogs.each do |blog|
        category = blog.category
        if !@categories.include? category
            @categories.push(category)
        end
    end
    erb :search
end

get '/sign_up' do
    erb :sign_up
end

post '/sign_up' do
    User.create(fname: params[:fname], lname: params[:lname], email: params[:email], password: params[:password])

    @users = User.all

    erb :sign_up
end
