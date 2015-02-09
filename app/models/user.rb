class User < ActiveRecord::Base
  has_many :questions, foreign_key: :creator_id
  has_many :answers, foreign_key: :creator_id
  has_many :votes, foreign_key: :voter_id
end
