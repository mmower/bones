class DashboardController < ApplicationController
  
  def index
    @todays_points = Meal.points_for_day( Date.today )
    @last_30_days_meals = open_flash_chart_object( 720, 400, graph_path( 'last_30_days_meals', :format => 'json' ) )
    @last_30_days_weights = open_flash_chart_object( 720, 400, graph_path( 'last_30_days_weights', :format => 'json' ) )
  end
  
end
