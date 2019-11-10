class PensController < ApplicationController
  before_action :set_pen, only: [:show, :edit, :update, :destroy]

  # GET /pens
  def index
    @pens = Pen.all
  end

  # GET /pens/1
  def show
    respond_to do |format|
      format.html do
causes = [ :bird_strikes, :seal_strikes, :skinny, :deformities, :unknown ]
dates = MortalityForm.all.group_by{|x| x.date}
@reports = MortalityForm.where(date: (Time.now - 1.week)..Time.now, pen: @pen).includes(:diver)
.group_by{|x| x.date.strftime("%Y-%m-%d")}
@causes = causes.map { |cause| { name: cause.id2name.split("_").join(" ").capitalize, data: dates.map{ |date, v| [[date.strftime("%Y-%m-%d"), v[0][cause]] ] }.sum   } }

@mortalities ||= MortalitySearcher.new(
  start_date: Date.current,
  end_date: Date.current
).run
@mortality_totals = totals

end
  format.js do
    @reports = mortality_search
  end

end

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
    start_date = params[:search_begin].to_date
    end_date = params[:search_end].to_date
    @mortality_search ||= MortalityForm.where(date: start_date..end_date, pen: @pen).includes(:diver).group_by{|x| x.date.strftime("%Y-%m-%d")}
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
      params.require(:pen).permit(:name, :lease_id, :latitude, :longitude)
    end

    def totals
      {

        bird_strikes: @mortalities.map{|total| total.bird_strikes}.sum,
        seal_strikes: @mortalities.map{|total| total.seal_strikes}.sum,
        skinny: @mortalities.map{|total| total.skinny}.sum,
        deformities: @mortalities.map{|total| total.deformities}.sum,
        unknown: @mortalities.map{|total| total.unknown}.sum
      }
    end
end
