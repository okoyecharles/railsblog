require 'rails_helper'

RSpec.describe 'User', type: :system do
  before(:each) do
    User.create(
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

  describe 'index page' do
    scenario 'shows the username of all other users' do
      visit users_path
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    scenario 'displays profile picture for each user' do
      visit users_path
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    scenario 'displays number of posts each user has written' do
      visit users_path
      @users.each do |user|
        expect(page).to have_content "Number of posts: #{user.posts_counter}"
      end
    end

    scenario 'users directs to show page when clicked' do
      visit users_path
      @users.each_with_index do |user, index|
        within all('.user')[index] do
          click_link user.name
          expect(page).to have_current_path user_path(user)
          visit users_path
        end
      end
    end
  end
end
