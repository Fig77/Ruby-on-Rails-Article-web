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

  after_save do
    puts 'wow'
  end

  def self.featured_from(number, selected)
    Category.find(selected).include(:articles).ordered_by_priority(number)
  end


  # Validations

  validates :text, length: { minimum: 70 }, presence: true
  validates :title, length: { in: 5..70 }, presence: true
end
