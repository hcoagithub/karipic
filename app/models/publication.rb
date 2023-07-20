class Publication < ApplicationRecord
    belongs_to :user
    has_many :images, as: :imageable
    has_many :comments


    has_one_attached :photo

    validates :description, presence: true
end
