class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @category = Category.new
    @categories = Category.page(params[:page])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "新しいタグを追加しました。"
    else
      @categories = Category.page(params[:page])
      flash.now[:alert] = "タグの追加に失敗しました。"
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "タグの更新に成功しました。"
    else
      flash.now[:alert] = "タグの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirecto_to admin_categories_path, notice: "タグを削除しました。"
  end

  private

  def category_params
    params.require(:category).permit(:category_name, category_ids: [])
  end
end
