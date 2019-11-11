class MortalityReportController < ApplicationController

    # GET /pens/1
  def show
  end

  def report

    @leases = Lease.all
    @pens = Pen.all

    respond_to do |format|

      format.html do
        causes = [ :bird_strikes, :seal_strikes, :skinny, :deformities, :unknown ]
        dates = MortalityForm.all.group_by{|x| x.date}
        @reports = MortalityForm.where(date: (Time.now - 1.week)..Time.now).includes(:diver)
        .group_by{|x| x.date.strftime("%Y-%m-%d")}
        @causes = causes.map { |cause| { name: cause.id2name.split("_").join(" ").capitalize, data: dates.map{ |date, v| [[date.strftime("%Y-%m-%d"), v[0][cause]] ] }.sum   } }

        # @mortalities ||= MortalitySearcher.new(
        #   start_date: Date.current,
        #   end_date: Date.current
        # ).run
        # @mortality_totals = totals
      end

      format.js do
        @reports = mortality_search
      end

    end
  end

  def mortality_search
    start_date = params[:search_begin].to_date
    end_date = params[:search_end].to_date
    @mortality_search ||= MortalityForm.where(date: start_date..end_date)


    if params[:lease_id] != ""
      @mortality_search = @mortality_search.where(lease_id: params[:lease_id])
    end

    if params[:pen_id] != ""
      @mortality_search = @mortality_search.where(pen_id: params[:pen_id])
    end
    @mortality_search.includes(:diver).group_by{|x| x.date.strftime("%Y-%m-%d")}
  end

end
  private
    # Use callbacks to share common setup or constraints between actions.
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
