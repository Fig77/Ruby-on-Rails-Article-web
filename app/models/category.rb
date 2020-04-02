class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  def self.new_all
    article = []
    temp = Category.all.includes(:articles).ordered_by_most_recent.first
    temp
  end

  def self.features(id)
   article = []
   Category.find(id).articles.ordered_by_priority.each do |x|
      article.push(x) 
    end
    article
  end

  #def self.featured_from(number, selected)
  #  Category.find(selected).include(:articles).ordered_by_priority(number)
  #end

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 70 }
end
