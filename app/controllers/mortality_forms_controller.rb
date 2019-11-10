class MortalityFormsController < ApplicationController
  before_action :set_mortality_form, only: [:show, :edit, :update, :destroy]

  # GET /mortality_forms
  def index
    @mortality_forms = MortalityForm.all
  end

  # GET /mortality_forms/1
  def show
  end

  # GET /mortality_forms/new
  def new
    @leases = Lease.all
    @pens = Pen.all
    @divers = Diver.all
    @mortality_form = MortalityForm.new
  end

  # GET /mortality_forms/1/edit
  def edit
  end

  # POST /mortality_forms
  def create
    @mortality_form = MortalityForm.new(mortality_form_params)

    if @mortality_form.save
      redirect_to @mortality_form, notice: 'Mortality form was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mortality_forms/1
  def update
    if @mortality_form.update(mortality_form_params)
      redirect_to @mortality_form, notice: 'Mortality form was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mortality_forms/1
  def destroy
    @mortality_form.destroy
    redirect_to mortality_forms_url, notice: 'Mortality form was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mortality_form
      @mortality_form = MortalityForm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mortality_form_params
      params.require(:mortality_form).permit(:date, :bird_strikes, :seal_strikes, :skinny, :deformities, :unknown, :mort_comments, :shallow_rot, :deep_rot, :missing_weights, :skin_burn, :fish_rub, :probe_cleaned, :observations, :pen_id, :lease_id)
    end
end
