local simpleline_status, simpleline = pcall(require, "simpleline")
local tabline_ok, tabline = pcall(require, "luatab")

if simpleline_status then
	simpleline.setup()
else
	print("simpleline not installed")
end

if tabline_ok then
	tabline.setup()
else
	print("tabline not installed")
end
