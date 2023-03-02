user = User.create!(
  name: 'Abebe',
  bio: 'Story of Abe\'s life ...',
  photo: 'url'
)
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')


first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello world', text: 'This is my first post')
third_post = Post.create(author: first_user, title: 'Hey there', text: 'This is my first post')
third_post = Post.create(author: first_user, title: 'Hey there', text: 'This is my first post')
third_post = Post.create(author: first_user, title: 'Hey there', text: 'This is my first post')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Lilly!' )
Comment.create(post: first_post, author: user, text: 'Hi guys!' )