class Category < ApplicationRecord
  has_many :articles, through: :article_categories
  has_many :article_categories

  before_create do # priority of category will be in relation to articles created.
    self.priority += 1
  end

  validates :name, presence: true, length: { maximum: 70 }
end
