class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project


  def user_name
    user.name
  end 

  def pretty_date
    created_at.strftime("%b %e, %l:%M %p")
  end 
end
