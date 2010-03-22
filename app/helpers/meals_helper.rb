module MealsHelper
  
  def summarize_by_day( meals )
    meals.inject( Hash.new { 0.0 } ) { |k,meal| k[meal.eaten_on] += meal.points_value; k }.to_a.sort
  end
  
end
