class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    @result = User.all

    respond_to do |format|
      format.html
    end
  end
end
