require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.new(name: 'Charles', photo: 'photo.png', bio: 'Love Coding') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'bio should be present' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should br greater or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    describe '#recent_posts' do
      before { 5.times { |post| Post.create(author: subject, title: "Post  #{post}") } }

      it 'should return recent posts' do
        expect(subject.recent_posts).to eq(subject.posts.last(3))
      end
    end
  end
end
