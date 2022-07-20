class Post < ApplicationRecord
  validates :title, presence: true
  validates :content , length: { minimum: 250 }
  validates :summary , length: { maximum: 250 }
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :click_baity_title

  def click_baity_title
    click_baits = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i ]

    if click_baits.none? {|bait| bait.match title}
    errors.add(:title, "title must be clickbaity")
    end
  end
end
