class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show ]
  before_action :set_data, only: %i[ index show ]

  def index
  end

  def show
    render 'index'
  end

  def create
    @room = Room.get(current_user.id, params[:user].to_i)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:name)
  end

  def set_data
    @rooms = Room.all
    if current_user
      @users = User.last(20)
    else
      @users = User.last(20)
    end
  end
end
