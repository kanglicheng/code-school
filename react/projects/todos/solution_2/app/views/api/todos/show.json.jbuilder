json.todo do 
  json.partial! 'api/todos/todo', todo: @todo
end

json.tags @todo.tags do |tag|
  json.id tag.id
  json.name tag.name
end