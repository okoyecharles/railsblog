require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before(:each) do
    @first_user = User.create(
      name: 'Charles',
      photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg',
      bio: 'Teacher from Nigeria.',
      posts_counter: 2
    )

    User.create(
      name: 'Tracey',
      photo: 'https://i.im.ge/2022/10/30/2R6RqY.woman.jpg',
      bio: 'Teacher from Kenya.',
      posts_counter: 5
    )

    @users = User.all
  end

  describe 'integration' do
    before(:each) { visit users_path }

    scenario 'shows the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    scenario 'displays profile picture for each user' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    scenario 'displays number of posts each user has written' do
      @users.each do |user|
        expect(page).to have_content "Number of posts: #{user.posts_counter}"
      end
    end

    scenario 'users directs to show page when clicked' do
      within all('.user')[0] do
        click_link @first_user.name
        expect(page).to have_current_path user_path(@first_user)
        visit users_path
      end
    end
  end
end
