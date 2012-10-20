$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model'
DB.logger = Logger.new($stdout)

#p Hero.join(Follower.where(type: 'a').group_and_count(:hero_id).order(:count.desc), :hero_id => :id).where{power > 3000}.limit(10).all

[:power, :dex, :type].each do |key|
  p Hero.order(key).limit(10).select(key).all
end