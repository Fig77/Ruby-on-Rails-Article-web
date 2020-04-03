class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  after_create do
    article.countPriority
  end
end
