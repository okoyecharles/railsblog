class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_comment_counter

  validates :text, presence: true

  def update_comment_counter
    post.update(comments_counter: post.comments.size)
  end
end
