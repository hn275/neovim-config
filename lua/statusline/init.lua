local simpleline_status, simpleline = pcall(require, "simpleline")

if not simpleline_status then
	print("simpleline:", simpleline_status)
	return
end

simpleline.setup()
