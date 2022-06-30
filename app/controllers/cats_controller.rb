class CatsController < ApplicationController

    def index
        cats = Cat.all
        render json: cats
    end

    def show
        cat = Cat.find(params[:id])
        render json: cat
    end

    def create
        cat = Cat.create(cat_params)
        render json: cat
    end

    def update
        cat = Cat.find(params[:id])
        cat.update(cat_params)
        render json: cat
    end

    def destroy
        cat = Cat.find(params[:id])
        cat.destroy
        render json: {destroy: true}
    end

    private
    # Strong parameter
    def cat_params
        params.require(:cat).permit(:name, :age, :enjoys, :image)
    end
end