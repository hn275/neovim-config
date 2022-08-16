local alpha_nvim_status, alpha_nvim = pcall(require, "alpha")
if not alpha_nvim_status then
	return
end

alpha_nvim.setup(require("alpha.themes.dashboard").config)
