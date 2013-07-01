require "redis"

redis = Redis.new

redis.pipelined do
  100000.times do
    redis.set "foo", "bar"

    redis.get "foo"
  end
end