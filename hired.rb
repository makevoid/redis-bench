require "hiredis"

conn = Hiredis::Connection.new
conn.connect "127.0.0.1", 6379

TIMES = 1_000_000

TIMES.times do
  conn.write ["SET", "foo", "bar#{rand(20)}"]
  # conn.write ["GET", "foo"]
end


(TIMES*1).times do
  val = conn.read
  # puts val
end