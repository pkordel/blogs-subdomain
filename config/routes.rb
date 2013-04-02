Blogs::Application.routes.draw do
  devise_for :users

  resources :articles
  resources :blogs
  match '', to:'blogs#show', constraints: ->(r) { r.subdomain.present? && r.subdomain != 'www' }
  root to: "blogs#index"
end
