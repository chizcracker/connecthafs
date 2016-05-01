class UsersController < ApplicationController
  before_filter :load_user, only: [:show, :update]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  UPDATE_ATTRS = [:phone_number, :address]

  def update
    @user.update_attributes(sliced_params)
    render json: @user, root: false
  end

  def index
    render json: User.all, root: false
  end

  def create
    user = User.create(sliced_params)
    render json: user, root: false
  end

  private

  def sliced_params
    Hash[
      UPDATE_ATTRS.map do |attr|
        key = attr.to_s.camelize(:lower)
        [attr, params[key]] if params.key?(key)
      end.compact
    ]
  end

  def load_user
    @user = User.find(params[:id])
  end
end
