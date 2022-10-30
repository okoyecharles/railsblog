require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    author = User.new(name: 'Charles', photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg', bio: 'Teacher from Nigeria.',
                      posts_counter: 0)
    subject do
      Post.new(author: author, title: 'Hello', text: 'This is my test post', comments_counter: 0, likes_counter: 0)
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should have a maximum of 250' do
      subject.title = 'x' * 300
      expect(subject).to_not be_valid
    end

    it 'recent_comments should return 5 most recent comments' do
      expect(subject.recent_comments).to eq subject.comments.last(5)
    end
  end
end
