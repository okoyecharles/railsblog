require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    author = User.create(name: 'Charles', photo: 'photo.png', bio: 'Love Coding', posts_counter: 0)
    subject { Post.new(author: author, title: 'Post', likes_counter: 5, comments_counter: 5) }

    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should have a maximum length of 250' do
      subject.title = Array.new(251, 'a').join
      expect(subject).to_not be_valid

      subject.title = 'Amazing'
      expect(subject).to be_valid
    end

    it 'author should be present' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'comments counter should be greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes counter should be greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    describe 'should test methods in post model' do
      before { 5.times { |comment| Comment.create(author: author, text: "Comment #{comment}", post: subject) } }

      it 'post should have five recent comments' do
        expect(subject.recent_comments).to eq(subject.comments.last(5))
      end
    end
  end
end
