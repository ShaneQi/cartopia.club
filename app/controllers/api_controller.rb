class ApiController < ApplicationController
  def users
    if params[:id] != nil
      @users = User.where(id: params[:id]).order(created_at: :desc)
      render :json => @users
    else
    	@users = User.all.order(created_at: :desc)
      render :json => @users
    end
  end

  def cars
    if params[:user_id] != nil
      @cars = Car.where(user_id: params[:user_id]).order(created_at: :desc)
      render :json => @cars
    elsif  params[:id] != nil
      @cars = Car.where(id: params[:id])
      render :json => @cars
    else
      @cars = Car.all.order(created_at: :desc)
      render :json => @cars
    end
  end

  def favs
    if params[:user_id] != nil
      @favs = Favorite.where(user_id: params[:user_id]).order(created_at: :desc)
      render :json => @favs
    else
      @favs = Favorite.all.order(created_at: :desc)
      render :json => @favs
    end
  end

  def comments
    if params[:car_id] != nil
      @comments = Comment.where(car_id: params[:car_id]).order(created_at: :desc)
      render :json => @comments
    else
      @comments = Comment.all
      render :json => @comments
    end
  end
end
