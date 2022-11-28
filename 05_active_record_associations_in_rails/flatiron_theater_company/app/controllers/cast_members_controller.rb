class CastMembersController < ApplicationController
    def index
        render json: CastMember.all, status: :ok
    end 

    def show
        cast_member = CastMember.find(params[:id])
        render json: cast_member, status: :ok
    end 
end
