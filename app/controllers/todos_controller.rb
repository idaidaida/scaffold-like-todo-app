class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(create_params)
    if @todo && @todo.save
      render "create"
    else
      render "new"
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo && @todo.update(update_params)
      render "update"
    else
      render "edit"
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
  end

  private
    def create_params
      params.require(:todo).permit(:title,:body)
    end

    def update_params
      params.require(:todo).permit(:title,:body)
    end
end
