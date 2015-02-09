class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :votable, polymorphic: true

  validates :votable, :voter, presence: true
  validate :is_votable?

  private

  def self.valid_votables
    ["Question", "Answer"]
  end

  def is_votable?
    unless Vote.valid_votables.include?(votable_type)
      errors.add(:votable_type, "must be included in #{Vote.valid_votables}")
    end
  end

end
