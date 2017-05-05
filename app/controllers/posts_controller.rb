class PostsController < ApplicationController
  def hello
    render html: "hello"
  end
  def index
    @posts = Post.all
    @posts = @posts.map do |post|
      {
        :text=> post.body
      }
    end
    render json: @posts
  end
end