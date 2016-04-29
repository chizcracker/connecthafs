class MainController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: User.all }
    end
  end
end
