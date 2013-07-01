require "hiredis"

conn = Hiredis::Connection.new
conn.connect "127.0.0.1", 6379

TIMES = 100000

TIMES.times do
  conn.write ["SET", "foo", "bar#{rand(20)}"]
  conn.write ["GET", "foo"]
end


(TIMES*2).times do
  val = conn.read
  # puts val
end