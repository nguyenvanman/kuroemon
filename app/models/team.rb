class Team < ApplicationRecord
  has_many :user_teams
  has_many :members, through: :user_teams, source: :user
   
  validates :name, presence: true, length: { maximum: 255 }
end
