require 'rubygems'
require 'sequel'
Sequel::Model.plugin(:schema)

DB = Sequel.mysql2('sandbox', password: '1234', user: 'root')

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
