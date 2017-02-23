class RoomController < ApplicationController
  def update
    if params[:commit] == "Create"
      room = Room.new(room_params)
      room.update_attribute(:status, 0)

      if room.save
        flash[:success] = "Room is created."
      else
        room.destroy
        flash[:danger] = "Room ID is invalid or already exists."
      end

    elsif params[:commit] == "Delete"
      room = Room.find_by(room_id: room_params[:room_id])

      if room
        room.destroy()
        flash[:success] = "Room is removed."
      else
        flash[:danger] = "Room doesn't exist."
      end

    end
    redirect_to staff_roommodification_url
  end

  def checkout
    room = Room.find_by(room_id: params[:checkout][:room_id])
    if room && !room.available?
      room.update_attribute(:status, 0)
      flash[:success] = "Check out successfully."
    else
      flash[:danger] = "Failed to check out: Room ID is invalid/already check out."
    end
    
    redirect_to staff_checkout_url
  end

  private

  def room_params
    params.require(:room).permit(:room_id, :room_type)
  end
end
