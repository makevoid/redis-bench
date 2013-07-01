require "hiredis"

conn = Hiredis::Connection.new
conn.connect "127.0.0.1", 6379

TIMES = 100_000

TIMES.times do
  conn.write ["SET", "foo", "bar#{rand(20)}"]
  conn.write ["GET", "foo"]
end


vals = []

(TIMES).times do
  val = conn.read
  val = conn.read
  # puts val
  vals << val
end

tmp = vals.join(",")

File.open("./tmp/tmp.txt", "w") do |file|
  file.write tmp
end

