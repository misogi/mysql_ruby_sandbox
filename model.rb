require 'rubygems'
require 'sequel'
require 'logger'

Sequel::Model.plugin(:schema)

DB = Sequel.mysql2('sandbox', user: 'root', password: '1234')

class Hero < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      integer :power
      integer :dex
      integer :intelligence
      timestamp :create_date
    end
    create_table
    DB.add_index :heros, :dex
  end
end


class Follower < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      text :type
      text :name
      timestamp :create_date
      foreign_key :hero_id, :table => :heros
      index :hero_id
    end
    create_table
  end
  
  many_to_one :hero
end


class Product < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      text :name
    end
    create_table
  end
  one_to_many :taggings
  many_to_many :tags, :join_table => :taggings
end

class Tag < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      text :name
    end
    create_table
  end
  one_to_many :taggings
  many_to_many :products, :join_table => :taggings
end

class Tagging < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      foreign_key :tag_id, :table => :tags
      foreign_key :product_id, :table => :products
    end
    create_table
  end
  many_to_one :product
  many_to_one :tag
end
