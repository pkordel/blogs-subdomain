class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def set_blog
    @blog = Blog.find_by_subdomain!(request.subdomain)
  end
end
