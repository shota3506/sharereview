class Thesis < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :conference, optional: true

  validates :title, presence: true

end
