class Api::TodosController < ApplicationController
  before_action :deny_access_if_not_logged_in

  def index
    @todos = Todo.includes(:tags).where(user_id: current_user.id)
    # render json: @todos, include: :tags
    render :index
  end

  def show
    @todo = Todo.find(params[:id])
    render :show
    # render json: @todo, include: :tags
  end

  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      render :show
      # render json: @todo, include: :tags
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
    render :show
    # render json: @todo, include: :tags
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render :show
      # render json: @todo, include: :tags
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done, tag_names: [])
  end
end
