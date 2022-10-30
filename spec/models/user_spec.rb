require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.new(name: 'Charles', photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg', bio: 'Teacher from Nigeria.', posts_counter: 0) }

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts counter should be an integer' do
      subject.posts_counter = ''
      expect(subject).to_not be_valid
    end

    it 'posts counter should be greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'returns recent posts' do
      expect(subject.recent_posts).to eq subject.posts.last(3)
    end
  end
end
