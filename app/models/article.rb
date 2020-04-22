class Article < ApplicationRecord
  # Relations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes
  has_one_attached :image

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :ordered_by_priority, -> { order(priority: :asc) }
  scope :feature, -> { order(priority: :desc).includes(:author).with_attached_image }

  before_save do
    unless image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images',
                                                 'bisde-02.png')), filename: 'bisde-02', content_type: 'image/png')
    end
  end

  def self.featured_from(number, selected)
    Category.find(selected).include(:articles).ordered_by_priority(number)
  end

  # Validations

  validates :text, length: { minimum: 70 }, presence: true
  validates :title, length: { in: 5..70 }, presence: true
end
