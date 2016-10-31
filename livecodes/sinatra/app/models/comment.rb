class Comment < ActiveRecord::Base
  belongs_to :post

  validates :content, presence: true

  def formatted_date
    created_at.strftime("%m-%e %H:%M")
  end
end