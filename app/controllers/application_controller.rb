require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

# CREATE
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    #no instance variable needed because you are just talking to the db
    post = Post.create(params)
    redirect "/posts"

  end

# SHOW PAGE
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    # instance variables used for when you want to pass info to the views or another controller
    @post = Post.find(params["id"])
    erb :show
  end


# EDIT

  get '/posts/:id/edit' do
    @post = Post.find(params["id"])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params["id"])
    post.update_attributes(params["post"])
    redirect "/posts/#{post.id}"
  end


end
