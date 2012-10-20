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