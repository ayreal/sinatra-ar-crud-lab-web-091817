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
    redirect "/posts/#{post.id}"

  end

# SHOW
  get '/posts' do
    @posts = Post.all
    # instance variables used for when you want to pass info to the views or another controller
    erb :index
  end

  get 'posts/:id' do
    @post = Post.find(params["id"])
    erb :show
  end

end
