require "redis"

redis = Redis.new

50000.times do
  redis.set "foo", "bar"

  redis.get "foo"
end

foo = redis.get "foo"
puts foo

# 10K w+r = 3sec