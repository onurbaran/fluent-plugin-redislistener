# fluent-plugin-redislistener
Redis list listener plugin for Fluentd

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
