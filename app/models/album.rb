class Album < ApplicationRecord
  belongs_to :user, counter_cache: :album_count
  has_many :likes, as: :content
  has_many :photos, dependent: :destroy

  validates :title, presence: true, length: {maximum: 140}
  validates :description, presence: true, length: {maximum: 300}
  validates :public, presence: true

  before_save :ensure_description_has_a_value


  private

  def ensure_description_has_a_value
    unless description.present?
      self.description = "This is album of user has id " + self.user_id.to_s
    end
  end

end
