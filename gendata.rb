$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model'

100.times do
  Hero.create(power: rand(20000000), dex: rand(2000000), intelligence: rand(2000000))
end
