class Article < ApplicationRecord
  # Relations

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes
  scope :new_all, -> { ordered_by_most_recent.find(ArticleCategory.pluck(:article_id).uniq) }
  has_attached_file :image,
  :storage => :cloudinary,
  :path => ':id/:style/:filename'
  # Scopes

  def count_priority
    self.priority += 1
    save
  end

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :ordered_by_priority, -> { order(priority: :asc) }
  scope :feature, -> { order(priority: :asc).includes(:author).first }

  ######

  def self.featured_from(number, selected)
    Category.find(selected).include(:articles).ordered_by_priority(number)
  end

  # Validations

  validates :text, length: { minimum: 70 }, presence: true
  validates :title, length: { in: 5..70 }, presence: true
end
