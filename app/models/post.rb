class Post < ApplicationRecord
  validates :title, length: { minimum: 1 }
  validates :content, length: { minimum: 10 }
  validates :title, :content, presence: true
end
