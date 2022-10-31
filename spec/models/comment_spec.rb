require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    author = User.new(
      name: 'Charles',
      photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg',
      bio: 'Teacher from Nigeria.', posts_counter: 0
    )
    post = Post.new(
      author: author,
      title: 'Hello',
      text: 'This is my test post',
      comments_counter: 0,
      likes_counter: 0
    )
    subject { Comment.new(author: author, post: post, text: 'Hey whats going on... just testing') }

    it 'should be valid' do
      expect(subject).to be_valid
    end
  end
end
