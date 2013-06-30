require "redis"

redis = Redis.new

10000.times do
  redis.set "foo", "bar#{rand(20)}"

  redis.get "foo"
end

foo = redis.get "foo"
puts foo

# 10K w+r = 3sec