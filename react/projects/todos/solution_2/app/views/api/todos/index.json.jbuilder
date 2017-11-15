json.set! :todos do
  json.array! @todos, partial: 'api/todos/todo', as: :todo
end

json.set! :tags do
  tag_arr = []
  @todos.each { |todo| tag_arr += todo.tags}
  json.array! tag_arr.uniq, :id, :name
end