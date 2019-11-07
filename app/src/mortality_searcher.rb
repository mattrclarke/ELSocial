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

  # def search_by_full_name
  #   @search_by_first_name ||= Profile.find_by_sql(
  #     ["select profiles.first_name,
  #       profiles.last_name from profiles
  #       where profiles.first_name like ? and last_name like ?;", *formatted])
  # end
  #
  # def reformat_and_search
  #   @reformat_and_search ||= Profile.where(
  #     first_name: formatted.first,
  #     last_name: formatted.last
  #   )
  # end
end
