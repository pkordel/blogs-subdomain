class Subdomain < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :name
end
