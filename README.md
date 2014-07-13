The storm cluster
=====================
Setup the  [storm] cluster (also [kafka], [zookeeper], [redis], [redis-commander]) using [Vagrant] with [ansible].

## Run the first time
Run script `setup.sh` (which check *pre requirements**) and if you have some gaps, then you should follow according to tips.

## Run general
* start: `vagrant up`
* finish: `vagrant halt`
* other commands: `vagrant list-commands`

## Contributing
* Fork it
* Create your feature branch (`git checkout -b my-new-feature`)
* Commit your changes (`git commit -am 'Added some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new *Pull Request*

[storm]:https://storm.incubator.apache.org/
[kafka]:http://kafka.apache.org/
[zookeeper]:http://zookeeper.apache.org/
[Vagrant]:http://www.vagrantup.com/
[ansible]:http://www.ansible.com/
[redis]:http://redis.io/
[redis-commander]:https://github.com/joeferner/redis-commander

