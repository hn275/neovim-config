Print = function(v)
	print(vim.inspect(v))
end

Reset = function(v)
	package.loaded[v] = nil

	require(v)

	print("plugin in reloaded")
end
