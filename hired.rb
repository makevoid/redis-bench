require "hiredis"

conn = Hiredis::Connection.new
conn.connect "127.0.0.1", 6379

10000.times do
  conn.write ["SET", "foo", "bar#{rand(20)}"]
  conn.write ["GET", "foo"]
  val = conn.read
  # puts val
end