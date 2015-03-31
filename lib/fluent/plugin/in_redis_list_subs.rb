module Fluent
  class RedisListSubs < Input
    Plugin.register_input('redis_list_subs', self)

    attr_reader  :redis

    config_param :host, :string, default: 'localhost'
    config_param :port, :integer, default:  6379
    config_param :list_name, :string
    config_param :tag, :string, default: nil

    def initialize
      super
      require 'redis'
      require 'msgpack'
    end

    def configure(config)
      super
      @host    = config.has_key?('host')    ? config['host']         : 'localhost'
      @port    = config.has_key?('port')    ? config['port'].to_i    : 6379
      raise Fluent::ConfigError, "need list_name" if not config.has_key?('list_name') or config['list_name'].empty?
      @channel = config['list_name'].to_s
      @sleep_interval = 0.5
    end

    def start
      super
      $execute = true
      @redis  = Redis.new(:host => @host, :port => @port ,:thread_safe => true)
      @thread = Thread.new(&method(:run_periodic))
    end

    def get_list_count
        list_count = @redis.llen @channel
        return list_count
    end

    def run_periodic
        until @execute
          queue_count = get_list_count
          if 0 < queue_count
             msg = @redis.rpop @channel
             parsed = nil
             begin
               parsed = JSON.parse msg
             rescue JSON::ParserError => e
               $log.error e
             end
               Engine.emit @tag || channel, Engine.now, parsed || msg
               $log.info msg
          end
          sleep @sleep_interval
        end
    end
	
	def shutdown
      @execute = false
      Thread.kill(@thread)
      @thread.join
      @redis.quit
    end
  end
end