class PensController < ApplicationController
  before_action :set_pen, only: [:show, :edit, :update, :destroy]

  # GET /pens
  def index
    @pens = Pen.all
  end

  # GET /pens/1
  def show
    @mortality_totals ||= MortalitySearcher.new(
        start_date: Date.current,
        end_date: Date.current
      ).run
      @mortality_totals = totals
  end

  # GET /pens/new
  def new
    @leases = Lease.all
    @pen = Pen.new
    @pens = Pen.all
  end

  # GET /pens/1/edit
  def edit
  end

  def mortality_search

  end

  def search
    @facade = Profiles::ProfileIndexFacade.new(query: params[:query]).run
  end

  # POST /pens
  def create
    @pen = Pen.new(pen_params)

    if @pen.save
      redirect_to @pen, notice: 'Pen was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pens/1
  def update
    if @pen.update(pen_params)
      redirect_to @pen, notice: 'Pen was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pens/1
  def destroy
    @pen.destroy
    redirect_to pens_url, notice: 'Pen was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pen
      @pen = Pen.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pen_params
      params.require(:pen).permit(:name, :lease_id)
    end

    def totals
      {
        bird_strikes: @mortality_totals.map{|total| total.bird_strikes}.sum,
        seal_strikes: @mortality_totals.map{|total| total.seal_strikes}.sum,
        skinny: @mortality_totals.map{|total| total.skinny}.sum,
        deformities: @mortality_totals.map{|total| total.deformities}.sum,
        unknown: @mortality_totals.map{|total| total.unknown}.sum
      }
    end
end
