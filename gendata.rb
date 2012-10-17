$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model'
require 'lorem'

0.times do
  Hero.create(power: rand(20000000), dex: rand(2000000), intelligence: rand(2000000))
end


0.times do
  id = rand(100099)
  hero = Hero.find(id: id)
  follower = Follower.create(name: Lorem::Base.new('words', 10).output, create_date: Time.now)
  follower.hero = hero
end
