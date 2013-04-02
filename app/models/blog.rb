class Blog < ActiveRecord::Base
  attr_accessible :name, :subdomain
  has_many :articles
end
