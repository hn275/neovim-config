local status_ok, status = pcall(require, "statusline")
if not status_ok then
	return
end
status.setup()
