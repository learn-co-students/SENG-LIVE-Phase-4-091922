class ProductionsController < ApplicationController
    def welcome
        render json: {hi:"Hello World"}
    end 

    def name
        render json: {hi:"Hi #{params[:user_name]}"}
    end 
    #GET all
    def index 
        render json: Production.all, status: :ok
    end 

    #GET one
    def show
        render json: Production.find(params[:id]), status: :ok
    end 

    # def create
    #     production = Production.create(production_params)
    #     render json: production, status: :created
    # end 

    # def update 
    #     production = Production.find(params[:id])
    #     production.update(production_params)
    #     render json: production, status: :accepted
    # end 

    # def destroy
    #     production = Production.find(params[:id])
    #     production.destroy
    #     #Production.destroy
    #     #production.destroy_all
    #     head :no_content
    # end 

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

end
