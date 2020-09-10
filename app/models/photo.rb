class Photo < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, counter_cache: :photo_count
  belongs_to :album, optional: true
  has_many :likes, as: :content

  mount_uploader :image, PhotoUploader


  private

end
