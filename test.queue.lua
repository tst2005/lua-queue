local Queue = require("queue")

local q = Queue.new()

q:rpush("a")
q:rpush("bb")
q:rpush("ccc")
assert(q[q.n-1] == "ccc")
assert(q:rpop() == "ccc")
assert(q:rpop() == "bb")
assert(q:rpop() == "a")
print("ok")
