class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :answers
  has_many :votes, as: :votable
end
