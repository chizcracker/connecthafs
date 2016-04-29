class GroupsController < ApplicationController
  before_filter :load_group, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @group }
    end
  end

  private

  def load_group
    @group = Group.find(params[:id])
  end
end
