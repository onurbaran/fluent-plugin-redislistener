# fluent-plugin-redislistener
Redis list input plugin for Fluentd

Sometimes you need persist your event/log messages while using redis->fluentd. 


## Installation : 

Put in_redis_list_subs.rb file to your fluent_directory/plugins folder. 

## Configuration : 

```
<source>
type redis_list_subs 
host localhost 
list_name event_log  #listname to listen
tag eventlog
</source>
```
