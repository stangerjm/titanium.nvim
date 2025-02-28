local variables = {
  node_modules_dir = (os.getenv('GLOBAL_NODE_MODULES') or '/usr/lib/node_modules/')
}

return variables
