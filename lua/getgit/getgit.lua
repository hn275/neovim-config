local getgit_ok, getgit = pcall(require, "git")

if not getgit_ok then
	return
end

getgit.setup()
