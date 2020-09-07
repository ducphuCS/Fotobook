class Album < ApplicationRecord
  validates :title, presence: true, length: {minimum: 10, message: "Album title should has more than 10 letters"}
  belongs_to :user, optional: true, counter_cache: :album_count
  has_and_belongs_to_many :photos
  has_many :likes, as: :content

  scope :sharing_mode, ->(public) {
    where(public: public)
  }

  before_save :ensure_description_has_a_value, :likes_count_not_nil
  private
  def ensure_description_has_a_value
    unless description.present?
      self.description = "This is album of user has id " + self.user_id.to_s
    end
  end
  def likes_count_not_nil
    if self.likes_count.nil?
      self.likes_count = 0
    end
  end
end
