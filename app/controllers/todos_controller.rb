class TodosController < ApplicationController
  before_action :require_login
  # make sure we load & authorize for show, edit, update, destroy—and toggle_complete too
  before_action :set_todo,     only: %i[show edit update destroy toggle_complete]
  before_action :authorize_todo, only: %i[show edit update destroy toggle_complete]

  def index
    @todos = current_user.todos.includes(:category)
  end

  def completed
    @todos = current_user.todos.where(completed: true).includes(:category)
    render :index
  end

  def show
  end

  def new
    @todo = current_user.todos.build
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to todos_path, notice: "ToDo created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo), notice: "ToDo updated."
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "ToDo deleted."
  end

  # === Step 2: toggle_complete action ===
  def toggle_complete
    @todo.update(completed: !@todo.completed)
    status = @todo.completed ? "complete" : "incomplete"
    redirect_to todos_path, notice: "ToDo marked #{status}."
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def authorize_todo
    redirect_to todos_path, alert: "Access denied." unless @todo.user == current_user
  end

  def todo_params
    params
      .require(:todo)
      .permit(:title, :priority, :completed, :category_id)
  end
end


