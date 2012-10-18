$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model'

p Hero.join(Follower.where(type: 'a').group_and_count(:hero_id).order(:count.desc), :hero_id => :id).where{power > 3000}.limit(10).all
