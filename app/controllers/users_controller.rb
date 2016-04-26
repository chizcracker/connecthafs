class UsersController < ApplicationController
  before_filter :load_user, only: [:show, :update]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  UPDATE_ATTRS = [:phonenumber, :address]

  def update
    @user.update_attributes(params.permit(*UPDATE_ATTRS))
    render json: @user
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
