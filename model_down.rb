$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model'

Follower.drop_table
Hero.drop_table

Tagging.drop_table
Product.drop_table
Tag.drop_table

