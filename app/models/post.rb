class Post < ApplicationRecord
  attachment :image
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  has_many :post_comments, dependent: :destroy

  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships

  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end

  def save_tags(savepost_tags)
    savepost_tags.each do |new_name|
    post_tag = Tag.find_or_create_by(name: new_name)
    self.tags << post_tag
    end
  end


  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
