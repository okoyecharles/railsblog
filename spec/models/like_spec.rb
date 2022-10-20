require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    author = User.create(name: 'Charles', photo: 'photo.png', bio: 'Love Coding', posts_counter: 0)
    post = Post.create(author: author, title: 'Post', likes_counter: 5, comments_counter: 5)
    subject { Like.new(author: author, post: post) }

    before { subject.save }

    it 'author id should be an integer' do
      subject.author_id = 'a'
      expect(subject).to_not be_valid
    end

    it 'post id should be an integer' do
      subject.post_id = 'p'
      expect(subject).to_not be_valid
    end
  end
end
