$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model'
require 'lorem'

0.times do
  Hero.create(power: rand(20000000), dex: rand(2000000), intelligence: rand(2000000))
end

types = ['a', 'b', 'c']

1000.times do
  id = rand(1000)
  hero = Hero.find(id: id)
  follower = Follower.create(create_date: Time.now, type: types[rand(types.length)])
  follower.hero = hero
  follower.save
end
