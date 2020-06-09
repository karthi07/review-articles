module ReviewsHelper
  def get_time(timenow, updated_at)
    time_dif = 86401 # emits old date from caluating diff
    time_dif = timenow - updated_at if updated_at.year == Time.current.year
    if time_dif < 3600
      res = distance_of_time_in_words(timenow, updated_at) + " ago"
    elsif time_dif < 86400
      res = distance_of_time_in_words(timenow, updated_at, scope: 'datetime.distance_in_words.short')
    elsif updated_at.year == Time.current.year
      res = updated_at.to_formatted_s(:day_and_month) 
    else
      res = updated_at.to_formatted_s(:day_and_month_with_year) 
    end
    return res
  end
end
