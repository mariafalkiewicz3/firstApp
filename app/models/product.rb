class Product < ApplicationRecord
  validates :name, presence: true
  has_many :orders
  has_many :comments
  
  def highest_rating_comment
    comments.rating_desc.first
  end
  def lowest_rating_comment
    comments.rating_asc.first
  end
  def average_rating
    comments.average(:rating).to_f
  end
  
  def views
    $redis.get("product:#{id}")
  end

  def viewed
    $redis.incr("product:#{id}")
  end

  def set_recent_reviewer(user_name)
    $redis.set("rr_product:#{id}",user_name)
  end

  def get_recent_reviewer
    $redis.get("rr_product:#{id}")
  end
end