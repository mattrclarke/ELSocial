class MortalitySearcher

  def initialize(start_date:, end_date:)
    @start_date = start_date
    @end_date = end_date
  end

  def run
    search
  end

  def search
    search ||= MortalityForm.all
    # @search ||= MortalityForm.where(created_at: formatted[0])
  end

end
