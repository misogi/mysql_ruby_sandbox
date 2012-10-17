mysql_ruby_sandbox
==================


### Ubuntu

    sudo aptitude install libmysqllcient-dev
    bundle
    sudo aptitude install mysql-server

### Fedora

    sudo yum install mysql-devel
    
### MySQL setup

disable query cache.

    SET GLOBAL query_cache_size = 0;
