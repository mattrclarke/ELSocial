class LeasesController < ApplicationController
  before_action :set_lease, only: [:show, :edit, :update, :destroy]

  # GET /leases
  def index
    @leases = Lease.all
  end

  # GET /leases/1
  def show
    @pens = Pen.where(lease_id: @lease.id)
    # @mortalities = Mortalities.where(pen_id: @pens.ids)
  end

  # GET /leases/new
  def new
    @pens = Pen.all
    @lease = Lease.new
    # @divers = []
  end

  # GET /leases/1/edit
  def edit
  end

  # POST /leases
  def create
    @lease = Lease.new(lease_params)

    if @lease.save
      redirect_to @lease, notice: 'Lease was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /leases/1
  def update
    if @lease.update(lease_params)
      redirect_to @lease, notice: 'Lease was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leases/1
  def destroy
    @lease.destroy
    redirect_to leases_url, notice: 'Lease was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lease
      @lease = Lease.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lease_params
      params.require(:lease).permit(:location, :latitude, :longitude)
    end
end