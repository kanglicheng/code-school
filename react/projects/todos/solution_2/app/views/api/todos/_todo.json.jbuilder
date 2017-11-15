json.extract! todo, :id, :user_id, :done, :title, :body

json.set! :tags, todo.tags.pluck(:id)