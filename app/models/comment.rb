class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :thesis

  validates :text, presence: true

end
