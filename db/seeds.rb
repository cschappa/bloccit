require 'faker'

=begin
# Create posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end

posts = Post.all

# Create comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end
=end

# Create advertisements
5.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Commerce.price
    )
end

puts "Seeds finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"

