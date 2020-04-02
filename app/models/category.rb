class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  before_create do # priority of category will be in relation to articles created.
    self.priority += 1
  end

  scope :all_with_articles, -> { all.includes(:articles) }
  def self.recent_all
    recor ||= ActiveRecord::Relation.Collection
    all_with_articles.each do |x|
      x.articles do |y|
        recor << y.ordered_by_most_recent.first
      end
    end
    recor
  end
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 70 }
end
