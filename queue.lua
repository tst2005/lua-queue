-- source: http://www.lua.org/pil/11.4.html

local Queue = {}
Queue.__index = Queue
function Queue.new()
	local queue = {first = 0, last = -1, n = 0}
	setmetatable(queue, Queue)
	return queue
end

function Queue.lpush(queue, value)
	local first = queue.first - 1
	queue.first = first
	queue[first] = value
	queue.n = queue.n + 1
end

function Queue.rpush(queue, value)
	local last = queue.last + 1
	queue.last = last
	queue[last] = value
	queue.n = queue.n + 1
end
    
function Queue.lpop(queue)
	local first = queue.first
	if first > queue.last then return nil, true end
	local value = queue[first]
	queue[first] = nil        -- to allow garbage collection
	queue.first = first + 1
	queue.n = queue.n - 1
	return value
end
    
function Queue.rpop(queue)
	local last = queue.last
	if queue.first > last then return nil, true end
	local value = queue[last]
	queue[last] = nil         -- to allow garbage collection
	queue.last = last - 1
	queue.n = queue.n - 1
	return value
end

function Queue.size(queue)
	return queue.n
end

return Queue
