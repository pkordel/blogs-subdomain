class Article < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :name, :content, :published_at
end
