require 'rails_helper'
 
RSpec.describe 'Post', type: :system do
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
 
   @first_post = Post.create(
     author: @first_user,
     title: 'Hello',
     text: 'This is my first test post',
     comments_counter: 0,
     likes_counter: 0
   )
 
   Post.create(
     author: @first_user,
     title: 'Hello',
     text: 'This is my second test post',
     comments_counter: 0,
     likes_counter: 0
   )
 
   Comment.new(author: @first_user, post: @first_post, text: 'Hey whats going on... just testing')
   Comment.new(author: @first_user, post: @first_post, text: 'Hey whats going on... just another test')
 
   @users = User.all
 end
 
 describe 'index page' do
   before(:each) { visit user_posts_path(@first_user) }
 
   scenario 'displays user\'s profile picture' do
     expect(page).to have_css("img[src*='#{@first_user.photo}']")
   end
 
   scenario 'displays user\'s username' do
     expect(page).to have_content @first_user.name
   end
 
   scenario 'displays user\'s number of posts' do
     expect(page).to have_content "Number of posts: #{@first_user.posts_counter}"
   end
 
   scenario 'displays a post title' do
     within all('.post')[0] do
       expect(page).to have_content @first_post.title
     end
   end
 
   scenario 'displays a post body' do
     within all('.post')[0] do
       expect(page).to have_content @first_post.text
     end
   end
 
   scenario 'displays a post first comments' do
     @first_post.recent_comments.each do |comment|
       expect(page).to have_content(comment.text)
     end
   end
 
   scenario 'displays number of comments for each post' do
     expect(page).to have_content("Comments: #{@first_post.comments_counter}")
   end
 
   scenario 'displays number of likes for each post' do
     expect(page).to have_content("Comments: #{@first_post.likes_counter}")
   end
 
   scenario 'displays pagination' do
     expect(find('.pagination')).to be_truthy
   end
 
   scenario 'redirects to posts show page when clicked' do
     within all('.post')[0] do
       find('a').click
       expect(page).to have_current_path user_post_path(@first_user, @first_post)
     end
   end
 end
 
 describe 'show page' do
   before(:each) { visit user_post_path(@first_post, @first_user) }
 
   scenario 'displays post\'s title' do
     expect(page).to have_content @first_post.title
   end
   scenario 'displays post\'s author' do
     expect(page).to have_content @first_post.author.name
   end
   scenario 'displays post\'s comments count' do
     expect(page).to have_content("Comments: #{@first_post.comments_counter}")
   end
   scenario 'displays post\'s likes count' do
     expect(page).to have_content("Likes: #{@first_post.likes_counter}")
   end
   scenario 'displays post\'s body' do
     expect(page).to have_content @first_post.text
   end
   scenario 'displays post\'s commenters name' do
     @first_post.comments.each do |comment|
       expect(page).to have_content comment.author
     end
   end
   scenario 'displays post\'s commenters text' do
     @first_post.comments.each do |comment|
       expect(page).to have_content comment.text
     end
   end
 end
end
