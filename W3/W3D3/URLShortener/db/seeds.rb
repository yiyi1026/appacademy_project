TagTopic.delete_all
ShortenedUrl.delete_all
Tagging.delete_all
User.delete_all
Visit.delete_all

news = TagTopic.create!(topic: "News")
music = TagTopic.create!(topic: "Music")
sports = TagTopic.create!(topic: "Sports")

user1 = User.create!(email: "alicechen118@gmail.com")
user2 = User.create!(email: "lihui.uibe@gmail.com")

url1 = ShortenedUrl.create_shortened_url(user1, "http://www.cnn.com")
url2 = ShortenedUrl.create_shortened_url(user1, "http://www.rollingstone.com")
url3 = ShortenedUrl.create_shortened_url(user2, "http://www.nba.com")
url4 = ShortenedUrl.create_shortened_url(user2, "http://www.nba.com")
url5 = ShortenedUrl.create_shortened_url(user2, "http://www.nba.com")
url6 = ShortenedUrl.create_shortened_url(user2, "http://www.nba.com")

Tagging.create!(tag_id: news.id, shortened_url_id: url1.id)
Tagging.create!(tag_id: news.id, shortened_url_id: url2.id)
Tagging.create!(tag_id: news.id, shortened_url_id: url3.id)
Tagging.create!(tag_id: news.id, shortened_url_id: url4.id)
Tagging.create!(tag_id: news.id, shortened_url_id: url5.id)
Tagging.create!(tag_id: news.id, shortened_url_id: url6.id)
Tagging.create!(tag_id: music.id, shortened_url_id: url2.id)
Tagging.create!(tag_id: sports.id, shortened_url_id: url3.id)

Visit.record_visit!(user1, url1)
Visit.record_visit!(user1, url2)
Visit.record_visit!(user1, url3)
Visit.record_visit!(user2, url1)
Visit.record_visit!(user2, url5)
Visit.record_visit!(user2, url6)
Visit.record_visit!(user2, url6)
Visit.record_visit!(user2, url4)
Visit.record_visit!(user2, url4)
Visit.record_visit!(user2, url4)
