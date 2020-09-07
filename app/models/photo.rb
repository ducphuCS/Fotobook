class Photo < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, optional: true, counter_cache: :photo_count
  has_and_belongs_to_many :albums
  has_many :likes, as: :content

  mount_uploader :image, PhotoUploader

  before_save :likes_count_not_nil
  private
  def likes_count_not_nil
    if self.likes_count.nil?
      self.likes_count = 0
    end
  end
end
