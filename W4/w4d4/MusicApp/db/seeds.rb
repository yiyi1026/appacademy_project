# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Band.destroy_all
Album.destroy_all
Track.destroy_all

band1= Band.create(name: 'Beatles')
band2= Band.create(name: 'Three Doors Down')
band3= Band.create(name: 'ColdPlay')
band4= Band.create(name: "Gun 'N Flower")

album1 = Album.create(album_name: "Yellow", band_id: band3.id)
album2 = Album.create(album_name: "Blue", band_id: band1.id)
album3 = Album.create(album_name: "Red", band_id: band2.id)
album4 = Album.create(album_name: "Purple", band_id: band1.id)

track1 = Track.create(track_name: "1", lyrics: '1111', album_id: album1.id)
track2 = Track.create(track_name: "2", lyrics: '2222', album_id: album2.id)
track3 = Track.create(track_name: "3", lyrics: '3333', album_id: album3.id)
track4 = Track.create(track_name: "4", lyrics: '4444', album_id: album4.id)
track5 = Track.create(track_name: "5", lyrics: '5555', album_id: album4.id)
