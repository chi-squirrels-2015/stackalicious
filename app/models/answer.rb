class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :creator, class_name: "User"
  has_many :votes, as: :votable

  validates :creator, presence: true
  # Remember to create a migration!
end
