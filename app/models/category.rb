class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  before_create do # priority of category will be in relation to articles created.
    self.priority += 1
  end

  def self.new_all
    article = []
    Category.all.each do |x|
      article.push(x.articles.ordered_by_most_recent.first) unless x.articles.count.zero?
    end
    article
  end

  def self.features(id)
   articles = []
   Category.find(id).articles.ordered_by_priority.each do |x|
      articles.push(x) 
    end
    articles
  end

  #def self.featured_from(number, selected)
  #  Category.find(selected).include(:articles).ordered_by_priority(number)
  #end

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 70 }
end
