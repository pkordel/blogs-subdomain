class BlogsController < ApplicationController
  before_filter :set_blog, only: [:show]
  def index
    @blogs = Blog.all
  end
  def show
  end
end
