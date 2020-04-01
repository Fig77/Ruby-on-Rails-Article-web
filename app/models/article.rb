class Article < ApplicationRecord
  # Relations

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes

  # Scopes

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :ordered_by_priority, -> { order(votes: :asc) }
  scope :feature, -> { ordered_by_priority.first }

  ######

  def recent_all
    temp = []
    Category.count.each { |c|
      temp.push(Category.find(c).articles.ordered_by_most_recent.first)
    }
    temp
  end

  def featured_from(i, selected) # i for now is define by admin
    Category.find(selected).include(:articles).ordered_by_priority(i)
  end

  # Validations

  validates :text, length: { minimum: 70 }, presence: true
  validates :title, length: { in: 5..70 }, presence: true
end
