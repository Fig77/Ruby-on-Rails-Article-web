class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  before_save do
    if self[:positive] == false || self[:positive].nil?
      article.priority.nil? ? article.priority = 0 : article.priority += 1
      self[:positive] = true
    else
      article.priority += -1
      self[:positive] = false
    end
    article.save
  end
end
