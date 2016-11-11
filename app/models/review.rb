class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, presence: true, numericality: true, inclusion: { in: (0..5).to_a, allow_nil: false}

  def stars
    ('<i class="fa fa-star" aria-hidden="true"></i>' * rating + '<i class="fa fa-star-o" aria-hidden="true"></i>' * (5 - rating)).html_safe
  end
end
