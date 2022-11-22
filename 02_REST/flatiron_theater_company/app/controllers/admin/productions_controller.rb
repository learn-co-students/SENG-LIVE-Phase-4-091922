class Admin::ProductionsController < ApplicationController
    def create
        production = Production.create(production_params)
        render json: production, status: :created
    end 
    
    def update 
        production = Production.find(params[:id])
        production.update(production_params)
        render json: production, status: :accepted
    end 

    def destroy
        production = Production.find(params[:id])
        production.destroy
        #Production.destroy
        #production.destroy_all
        head :no_content
    end 

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 
end
