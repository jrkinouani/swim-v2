class JardinsController < ApplicationController
  before_action :set_jardin, only: [:show, :update, :destroy, :edit]

    def new
      @jardin = Jardin.new
    end

    def create
      @jardin = Jardin.create(jardin_params)
      redirect_to jardin_path(@jardin)
    end

    def show
    end

    def update
      @jardin.update(jardin_params)
      rediredct_to jardin_path(@jardin)
    end

    def index
      @jardins = Jardin.all
    end

    def edit
    end

    def destroy
    end

    private

    def jardin_params
      params.require(:jardin).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
    end

    def set_jardin
      @jardin = Jardin.find(params[:id])
    end
end
