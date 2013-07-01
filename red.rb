require "redis"

redis = Redis.new

10000.times do
  redis.set "foo", "bar"

  redis.get "foo"
end