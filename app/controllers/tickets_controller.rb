class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    event = Event.find(params[:event_id])
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = params[:ticket][:comment]
    end
    if @ticket.save
      redirect_to event_path(event), notice: "このイベントに参加表明しました", status: :unprocessable_entity
    end
  end
end
