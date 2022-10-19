class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_post_counter

  def update_post_counter
    author.update(posts_counter: author.posts.size)
  end

  def recent_comments
    comments.last(5)
  end
end
