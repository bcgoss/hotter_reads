class Read < ApplicationRecord
  validates :url, presence: true
  validates :url, url: true

  scope :hot, -> {
    select(:url).where('created_at > ?', Time.now - 1.day).group(:url).order('count( "reads"."id") desc').limit(10)
  }
end
