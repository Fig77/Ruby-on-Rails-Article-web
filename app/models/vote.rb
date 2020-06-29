class Vote < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :article, class_name: 'Article', foreign_key: 'article_id'

  before_save do
    if self[:positive] == false || self[:positive].nil?
      article.priority.nil? ? article.priority = 1 : article.priority += 1
      self[:positive] = true
    else
      article.priority = article.priority - 1
      self[:positive] = false
    end
    article.save
  end
end
