class EcolesController < ApplicationController
  before_action :set_ecole, only: [:show, :update, :destroy, :edit]

    def new
      @ecole = Ecole.new
    end

    def create
      @ecole = Ecole.create(ecole_params)
      redirect_to ecole_path(@ecole)
    end

    def show
    end

    def update
      @ecole.update(ecole_params)
      rediredct_to ecole_path(@ecole)
    end

    def index
      @ecoles = Ecole.all
    end

    def edit
    end

    def destroy
    end

    private

    def ecole_params
      params.require(:ecole).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
    end

    def set_ecole
      @ecole = Ecole.find(params[:id])
    end
end
