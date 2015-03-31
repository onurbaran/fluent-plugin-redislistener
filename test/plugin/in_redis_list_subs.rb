require 'fluent/test'
require 'redis'
require 'fluent/plugin/in_redis_list_subs'

class FileInputTest < Test::Unit::TestCase
    def setup
        Fluent::Test.setup

        @d = create_driver %[
            host    localhost
            port    6379
            list_name test.listname
            tag     input.redis
        ]
        @time = Time.now.to_i
    end

    def create_driver(config = CONFIG)
        Fluent::Test::OutputTestDriver.new(Fluent::RedisListSubsInput).configure(config)
    end

    def test_configure
        assert_equal 'localhost'   , @d.instance.host
        assert_equal 6379          , @d.instance.port
        assert_equal 'test.listname', @d.instance.list_name
        assert_raise Fluent::ConfigError do
            create_driver %[
                host    localhost
                port    6379
                tag     input.redis
            ]
            create_driver %[
                host    localhost
                port    6379
                list_name
                tag     input.redis
            ]
        end
    end
end
