class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  has_attachment :photo

  default_scope -> { order('LOWER(name)') }

  def stars
    ratings = reviews.map { |review| review.rating}.select { |rating| !rating.nil? }
    rating = ratings.size > 0 ? ratings.sum.fdiv(ratings.size).round : 0
    ('<i class="fa fa-star" aria-hidden="true"></i>' * rating + '<i class="fa fa-star-o" aria-hidden="true"></i>' * (5 - rating)).html_safe
  end

end
