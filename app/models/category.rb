class Category < ApplicationRecord
  has_many :articles, through: :article_categories
  has_many :article_categories

  validates :name, presence: true, length: { maximum: 70 }
end
