class Photo < ApplicationRecord

  belongs_to :user, counter_cache: :photo_count
  belongs_to :album, optional: true
  has_many :likes, as: :content

  mount_uploader :image, PhotoUploader

  validates :title, presence: true, length: {maximum: 140}
  validates :description, presence: true, length: {maximum: 300}
  validates :public, presence: true


  private

end
