class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
  order_group = if Rails.env.production?
                  "SELECT DISTINCT ON (category_id) *
                   FROM article_categories
                   ORDER BY category_id, created_at DESC"
                else
                  "SELECT *  FROM
                  (SELECT * FROM article_categories ORDER BY created_at DESC)
    				      AS sub GROUP BY category_id"
                end
  scope :new_all, lambda {
    connection.execute(order_group)
  }
  def self.gt_array
    array_hash = new_all
    hash_array = []
    array_hash.each do |x|
      hash_array.push(x['article_id'])
    end
    where(id: hash_array).includes({ article: %i[image_attachment author] }, :category)
  end

  scope :ordered_by_most_recent, -> { order(created_at: :desc).group_by(:category_id) }
end
