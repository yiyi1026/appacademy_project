User.destroy_all
Sub.destroy_all
Post.destroy_all
PostSub.destroy_all

u1 = User.create(username: "Hui", password:"123456")
u2 = User.create(username: "Cherry", password:"654321")
u3 = User.create(username: "tim", password:"222222")

s1 = Sub.create(title: "News", description:"All the news", user_id: u3.id)
s2 = Sub.create(title: "Music", description:"All the music", user_id: u1.id)
s3 = Sub.create(title: "Food", description:"All the food", user_id: u2.id)

p1 = Post.create(title: "Pop music", url:"popmusic.com", content:"Cool", user_id: u1.id)
p2 = Post.create(title: "Soup", url:"soup.com", content:"soup is nice", user_id: u3.id)
p3 = Post.create(title: "trump", url:"trumpsucks.com", content:"trump is sad", user_id: u2.id)

ps1 = PostSub.create(post_id: p1.id, sub_id: s2.id)
ps2 = PostSub.create(post_id: p2.id, sub_id: s3.id)
ps3 = PostSub.create(post_id: p3.id, sub_id: s1.id)
ps4 = PostSub.create(post_id: p3.id, sub_id: s3.id)
