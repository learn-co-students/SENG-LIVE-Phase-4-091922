class TicketsController < ApplicationController
    def index
        render json: Ticket.all, status: :ok
    end 

    def show
        ticket = Ticket.find(params[:id])
        render json: ticket, status: :ok
    end 
    #create
    def create
        ticket = Ticket.create(ticket_params)
        render json: ticket, status: :created
    end 

    private

    def ticket_params
        params.permit(:price, :user_id, :production_id)
    end 
end
