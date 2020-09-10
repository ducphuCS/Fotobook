class Album < ApplicationRecord
  validates :title, presence: true, length: {minimum: 10, message: "Album title should has more than 10 letters"}
  belongs_to :user, counter_cache: :album_count
  has_many :likes, as: :contentable
  has_many :photos, dependent: :destroy
  before_save :ensure_description_has_a_value


  private

  def ensure_description_has_a_value
    unless description.present?
      self.description = "This is album of user has id " + self.user_id.to_s
    end
  end

end
