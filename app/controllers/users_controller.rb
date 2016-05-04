class UsersController < ApplicationController
  before_filter :load_user, only: [:show, :update]
  before_filter :load_param_filter, only: [:update, :create]
  before_filter :validate_required_params, only: [:create]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def update
    @user.update_attributes(db_attributes)
    render json: @user, root: false
  end

  def index
    render json: User.all, root: false
  end

  def create
    user = User.create(db_attributes)
    render json: user, root: false
  end

  private

  VALID_ATTR_MAP = {
    "update" => ["phoneNumber", "address"],
    "create" => ["name", "classYear"]
  }.freeze

  def load_param_filter
    @filter = VALID_ATTR_MAP[params[:action]]
  end

  def validate_required_params
    @filter.each { |f| params.require(f) }
  end

  def db_attributes
    Hash[
      params.permit(*@filter).map do |k, v|
        [k.underscore, v]
      end
    ]
  end

  def load_user
    @user = User.find(params[:id])
  end
end
