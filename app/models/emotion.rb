class Emotion < ApplicationRecord
  belongs_to :user
  has_one :action
  # belongs_to :history
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, default: -> { Category.find_by(id: 1) }

  validates :event_occurred, presence: true
  validates :specific_details, presence: true
  validates :unpleasant_index, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :category_id, presence: true
  validates :user_id, presence: true

end
