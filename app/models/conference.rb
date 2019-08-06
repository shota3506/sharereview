class Conference < ApplicationRecord

  has_many :theses, dependent: :destroy

  validates :name, presence: true

end
