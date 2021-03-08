class Post < ApplicationRecord
  attachment :image
  belongs_to :user

  has_many :favorites
  has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end


  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

end
