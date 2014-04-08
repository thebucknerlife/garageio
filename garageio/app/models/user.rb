class User < ActiveRecord::Base
  has_secure_password

  has_many :ownerships

  validates_uniqueness_of :email
end
