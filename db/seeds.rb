user = User.create!(
  name: 'Abebe',
  bio: 'Story of Abe\'s life ...',
  photo: 'https://wallpapers.com/images/high/cool-profile-picture-1ecoo30f26bkr14o.webp'
)
second_user = User.create(name: 'Lilly', photo: 'https://wallpapers.com/images/high/cool-profile-picture-1ecoo30f26bkr14o.webp', bio: 'Teacher from Poland.')
first_user = User.create(name: 'Tom', photo: 'https://wallpapers.com/images/high/cool-profile-picture-1ecoo30f26bkr14o.webp', bio: 'Teacher from Mexico.')


first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello world', text: 'This is my first post')
third_post = Post.create(author: first_user, title: 'Hey there', text: 'This is my first post')
fourth_post = Post.create(author: first_user, title: 'Hey there', text: 'This is my first post')
fifth_post = Post.create(author: second_user, title: 'Hey there', text: 'This is my first post')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Lilly!' )
Comment.create(post: first_post, author: user, text: 'Hi guys!' )