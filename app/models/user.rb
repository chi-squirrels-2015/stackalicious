class User < ActiveRecord::Base
  has_many :questions, foreign_key: :creator_id
  has_many :answers, foreign_key: :creator_id
  has_many :votes, foreign_key: :voter_id

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user if user && user.password == password
  end
end
