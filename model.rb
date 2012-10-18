require 'rubygems'
require 'sequel'
require 'logger'

Sequel::Model.plugin(:schema)

#DB = Sequel.mysql2('sandbox', user: 'root', :loggers => [Logger.new($stdout)])

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
