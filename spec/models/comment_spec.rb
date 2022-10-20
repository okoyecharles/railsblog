require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    author = User.create(name: 'Charles', photo: 'photo.png', bio: 'Love Coding', posts_counter: 0)
    post = Post.create(author: author, title: 'Post', likes_counter: 0, comments_counter: 0)
    subject { Comment.new(author: author, post: post, text: 'Comment') }

    before { subject.save }

    it 'text should not be valid' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'author id should be a number' do
      subject.author_id = 'a'
      expect(subject).to_not be_valid
    end

    it 'post id should be a number' do
      subject.post_id = 'b'
      expect(subject).to_not be_valid
    end
  end
end
