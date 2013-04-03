class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :limit_subdomain_access

  private

  def set_blog
    @blog = Blog.find_by_subdomain!(request.subdomain)
  end

  def limit_subdomain_access
    if request.subdomain.present?
      redirect_to root_url(subdomain: false)
    end
  end
end
