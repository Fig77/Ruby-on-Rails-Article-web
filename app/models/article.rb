class Article < ApplicationRecord
  # Relations

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes
  scope :new_all, -> { ordered_by_most_recent.find(ArticleCategory.pluck(:article_id).uniq) }
  has_one_attached :image

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :ordered_by_priority, -> { order(priority: :asc) }
  scope :feature, -> { order(priority: :asc).includes(:author).first }

  ######
  before_create do
    category_ids[1..-1].each do |c|
      ArticleCategory.new('article_id' => @article.id, 'category_id' => c).save
    end
  end

  def self.featured_from(number, selected)
    Category.find(selected).include(:articles).ordered_by_priority(number)
  end

  # Validations

  validates :text, length: { minimum: 70 }, presence: true
  validates :title, length: { in: 5..70 }, presence: true
  validates :image, presence: true
end
