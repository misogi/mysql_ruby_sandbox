$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model'
require 'forgery'

20000.times do
  Hero.create(power: rand(20000000), dex: rand(2000000), intelligence: rand(2000000), type: rand(3))
end

types = ['a', 'b', 'c']

0.times do
  id = rand(10)
  hero = Hero.find(id: id)
  follower = Follower.create(create_date: Time.now, type: types[rand(types.length)])
  follower.hero = hero
  follower.save
end

0.times do
  Tag.create(name: Forgery::Name.male_first_name)
  Product.create(name: Forgery::Name.full_name)
end

0.times do
  tag = Tag.find(id: rand(100))
  product = Product.find(id: rand(100))
  if tag && product
    tag.add_product product
    product.add_tag tag
  end
end
