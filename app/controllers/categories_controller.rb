class CategoriesController < ApplicationController
  before_action :require_login
  before_action :set_category,   only: %i[show edit update destroy]
  before_action :authorize_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories.includes(:todos)
  end

  def show
    @category = current_user.categories.find(params[:id])
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category created."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category), notice: "Category updated."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category and its ToDos deleted."
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def authorize_category
    redirect_to categories_path, alert: "Access denied." unless @category.user == current_user
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
