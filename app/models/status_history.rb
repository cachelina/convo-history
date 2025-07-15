class StatusHistory < ApplicationRecord
  belongs_to :user
  belongs_to :project


  def pretty_date
    created_at.strftime("%b %e, %l:%M %p")
  end 
end
