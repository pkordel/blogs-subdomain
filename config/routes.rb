Blogs::Application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show] do
    resources :subdomains
  end
  match '/' => 'sites#show', constraints: ->(r) { r.subdomain.present? && r.subdomain != 'www' }
  root :to => "home#index"
  # resources :articles
  # resources :blogs
  # match '', to:'blogs#show', constraints: ->(r) { r.subdomain.present? && r.subdomain != 'www' }
  # root to: "blogs#index"
end
