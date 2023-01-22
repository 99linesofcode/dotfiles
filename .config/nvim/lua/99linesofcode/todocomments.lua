local status_ok, todos = pcall(require, 'todo-comments')
if not status_ok then
  return
end

todos.setup()
