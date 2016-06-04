users = []
(1..10).each do |i|
  users << User.create(
    username: "User ##{i}",
    email: "user#{i}@user.com",
    password: 'password',
    remote_avatar_url: 'https://scontent-lga3-1.xx.fbcdn.net/hphotos-frc3/v/t1.0-9/1378459_10153311783800858_943088266_n.jpg?oh=ae67570b2a3d3f6e344ab4f4e3b761c6&oe=57BA036F'
  )
end

shows = []
(1..20).each do |i|
  shows << Tvshow.create(
    name: "Building ##{i}",
    posterlink:"http://ia.media-imdb.com/images/M/MV5BMjI3ODU0OTQ1MV5BMl5BanBnXkFtZTgwNzI0MTQ2MzE@._V1_SX300.jpg",
    imdblink: "http://www.imdb.com/title/tt0813715"
  )
end

watchedshows = []
(1..20).each do |i|
  watchedshows << Watchedshow.create(
    user: users.sample,
    tvshow: shows.sample,
    rating: rand(5)
  )
end
