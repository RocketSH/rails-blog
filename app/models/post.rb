class Post < ApplicationRecord
  validates :title, length: { minimum: 3 }
  validates :content, length: { minimum: 20 }
  validates :title, :content, presence: true
end
