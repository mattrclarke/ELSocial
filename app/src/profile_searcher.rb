class ProfileSearcher

  def initialize(query:)
    @query = query
  end

  def run
    profiles = case formatted.length
      when 0 then return
      when 1 then search_by_first_name
      when 2 then search_by_full_name
      else reformat_and_search
    end
  end

  def formatted
    @formatted ||= @query.split(" ")
  end

  def search_by_first_name
    @search_by_first_name ||= Profile.where(first_name: formatted[0])
  end

  def search_by_full_name
    @search_by_first_name ||= Profile.find_by_sql(
      ["select profiles.first_name,
        profiles.last_name from profiles
        where profiles.first_name like ? and last_name like ?;", *formatted])
  end

  def reformat_and_search
    @reformat_and_search ||= Profile.where(
      first_name: formatted.first,
      last_name: formatted.last
    )
  end  
end
