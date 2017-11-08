class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :rating_averages, class_name: :RatingCache, foreign_key: :cacheable_id do
    def with_dimension(dimension)
      where(dimension: dimension).first
    end
  end
  mount_uploader :image, ImageUploader

  ratyrate_rateable "favorite"
end
