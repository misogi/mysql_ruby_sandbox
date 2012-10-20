mysql_ruby_sandbox
==================


### Ubuntu

    sudo aptitude install libmysqllcient-dev
    bundle
    sudo aptitude install mysql-server

### Fedora

    sudo yum install mysql-devel mysql-server
    sudo systemctl start mysqld 

### MySQL setup

    mysqladmin create sandbox -u root

disable query cache.

    SET GLOBAL query_cache_size = 0;


### Sequel cheat sheet

want to display SQL log 

```ruby
DB.logger = Logger.new($stdout)
```

### Partition Table

パーティションは以下のようにできるが、制約いっぱいあるで

```
ALTER TABLE heros PARTITION BY LIST(hero_type)( 
  PARTITION p0 VALUES IN(0),
  PARTITION p1 VALUES IN(1),
  PARTITION p2 VALUES IN(2),
  PARTITION p3 VALUES IN(3));
```

パーティションの分類に使うキーはかならず主キーに入れる必要がある

auto_increment を入れたら主キーに入れないといけない

主キーは create などのときに明示的に指定できない。 unrestrict_primary_key で警告を消せる。ただし、これをやると id を明示的に指定できちゃうので注意

```ruby
class Hero < Sequel::Model
  unrestrict_primary_key
  # ...
end
```
