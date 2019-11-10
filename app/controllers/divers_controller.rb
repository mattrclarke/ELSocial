class DiversController < ApplicationController
  before_action :set_diver, only: [:show, :edit, :update, :destroy]

  # GET /divers
  def index
    @divers = Diver.all
  end

  # GET /divers/1
  def show
  end

  # GET /divers/new
  def new
    @diver = Diver.new
  end

  # GET /divers/1/edit
  def edit
  end

  # POST /divers
  def create
    @diver = Diver.new(diver_params)

    if @diver.save
      redirect_to @diver, notice: 'Diver was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /divers/1
  def update
    if @diver.update(diver_params)
      redirect_to @diver, notice: 'Diver was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /divers/1
  def destroy
    @diver.destroy
    redirect_to divers_url, notice: 'Diver was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diver
      @diver = Diver.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diver_params
      params.require(:diver).permit(:first_name, :last_name, :email, :contact, :address, :secondary_contact)
    end
end
