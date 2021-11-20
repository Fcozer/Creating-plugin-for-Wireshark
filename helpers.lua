local m = {}

function m.merge_tables(from,to)
	for k,v in pairs(from) do to[k] = v end
end

return m
