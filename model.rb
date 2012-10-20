require 'rubygems'
require 'sequel'
require 'logger'

Sequel::Model.plugin(:schema)

DB = Sequel.mysql2('sandbox', user: 'root', password: '1234')

class Hero < Sequel::Model
  unrestrict_primary_key
  unless table_exists?
    set_schema do
      Integer :id, auto_increment: true
      Integer :hero_type, null: false
      primary_key [:id, :hero_type]
      unique [:id, :hero_type]
      Integer :power, null: false
      Integer :dex, index: true, null: false
      Integer :intelligence
      boolean :paradin, null: false
      Time :create_date
    end
    create_table
  end
end

class Follower < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      text :type
      text :name
      timestamp :create_date
      int :hero_id
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
