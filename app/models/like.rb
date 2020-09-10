class Like < ApplicationRecord
  belongs_to :content, polymorphic: true, counter_cache: true
  belongs_to :user
end
