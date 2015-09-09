require 'faker'

# Create posts
#50.times do
# Post.create!(
#    title: Faker::Lorem.sentence,
#    body: Faker::Lorem.paragraph
#    )
#end

if !(Post.find_by(title: "my uniq title"))
  # it hasn't been seeded
  Post.create!(title: "my uniq title", body: Faker::Lorem.paragraph)
end

# what does this line do?
posts = Post.all

# Create comments

#100.times do
#  Comment.create!(
#    post: posts.sample,
#    body: Faker::Lorem.paragraph
#    )
#end

if !(Comment.find_by(body: "my uniq comment"))
  # it hasn't been seeded
  Comment.create!(post: posts.sample, body: "my uniq comment")
end


puts "Seeds finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"