class Action < ApplicationRecord
  belongs_to :user
  belongs_to :emotion
  has_many :comments


  validates :plan_example, presence: true
  validates :plan, presence: true
  validates :target_score, presence: true
  validates :current_score, presence: true
  validates :total_score

end
