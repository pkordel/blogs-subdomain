class User < ActiveRecord::Base
  has_many :subdomains, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :name
end
