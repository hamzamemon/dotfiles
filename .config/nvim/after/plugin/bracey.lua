-- Used to launch browser
vim.g.bracey_browser_command = 0

-- Whether or not to start the browser (by running g.bracey_browser_command) when bracey is started
vim.g.bracey_auto_start_browser = 1

-- Whether or not to reload the current web page whenever its corresponding buffer is written
vim.g.bracey_refresh_on_save = 1

-- Whether or not to evaluate a buffer containing javascript when it is saved
vim.g.bracey_eval_on_save = 1

-- Whether or not to start the node server when :Bracey is run
vim.g.bracey_auto_start_server = 1

-- Whether or not to allow other machines on the network to connect to the node server's webpage. This is useful if you want to view what changes will look like on other platforms at the same time
vim.g.bracey_server_allow_remote_connections = 0

-- Address at which the node server will reside at (should start with 'http://' and not include port)
vim.g.bracey_server_path = 'http://127.0.0.1'

-- Location to log the node servers output
vim.g.bracey_server_log = '/tmp/bracey_server_logfile'
