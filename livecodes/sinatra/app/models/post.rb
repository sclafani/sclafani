class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :name,  presence: true
  validates :url,   presence: true

  scope :by_most_popular, -> { order(votes: :desc) }
end
