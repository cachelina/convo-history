class User < ApplicationRecord
  has_many :projects
  has_many :comments
  has_many :status_histories

end
