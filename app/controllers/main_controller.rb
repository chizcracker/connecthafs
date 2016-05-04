class MainController < ApplicationController
  before_filter :load_user, only: [:index]

  def index
    @result = User.all

    respond_to do |format|
      format.html
    end
  end

  private

  def load_user
    @currentuser = User.first
  end
end
