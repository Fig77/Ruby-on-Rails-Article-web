class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
  order_group = "SELECT * FROM
  				(SELECT category_id, article_id FROM article_categories ORDER BY created_at DESC)
  				AS sub GROUP BY category_id"      
  scope :new_all, -> {
  	self.connection.execute(order_group) 
  }
  def self.getArray
    arrayHash = new_all
    hashArray = []
    arrayHash.each { 
     |x| 
      hashArray.push(x['article_id'])
    }
    where(id: hashArray).includes({article: :image_attachment},:category)
  end

 

  scope :ordered_by_most_recent, -> { order(created_at: :desc).group_by(:category_id) }
end
