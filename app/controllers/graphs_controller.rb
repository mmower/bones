class GraphsController < ApplicationController
  
  def show
    if self.respond_to?( :"#{params[:id]}_chart" )
      respond_to do |format|
        format.json do
          render :text => __send__( "#{params[:id]}_chart" ).to_s
        end
      end
    else
      render_404
    end
  end
  
  def last_30_days_meals_chart
    
    date_range = ( 14.days.ago.to_date .. Date.today ).to_a
    data = date_range.collect { |date| Meal.points_for_day( date ) }
    
    title = Title.new( "Meals (14 days)" )
    
    x_axis = XAxis.new
    
    x_axis.labels = date_range.collect { |date| date.day.to_s }
    
    y_axis = YAxis.new
    
    ymin,ymax = (( data.min.to_i / 5 )-1)*5, ((data.max.to_i/5)+1)*5
    ymin = ymin < 0 ? 0 : ymin
    y_axis.set_range( ymin, ymax, 5 )
    
    chart = OpenFlashChart.new
    chart.title = title
    chart.y_axis = y_axis
    chart.x_axis = x_axis
    
    chart.add_element( make_line( "Points", "#0D1BD5", data ) )
    chart.add_element( make_line( "Avg.", "#007600", data.map { data.sum / data.size } ) )
    # chart.add_element( make_line( "Weight", "#007600", date_range.collect { |date| puts r = Reading.for_day( date ); r ? r.weight.kg : 0.0 } ) )
    #   chart.add_element( make_line( "Daily (#{last_period.short_name})", "#0D1BD5", last_period.spent_per_day ) )
    #   chart.add_element( make_line( "Cumulative (#{last_period.short_name})", "#535FF5", last_period.cumulative_spent_per_day ) )
    #   chart.add_element( make_line( "Daily (average)", "#007600", average_spending.collect { |a| a.first } ) )
    #   chart.add_element( make_line( "Cumulative (average)", "#00DC00", average_spending.collect { |a| a.last } ) )
    # chart.add_element( make_line( "Daily (#{self.period.short_name})", "#97092F", self.period.spent_per_day ) )
    # chart.add_element( make_line( "Cumulative (#{self.period.short_name})", "#F11551", self.period.cumulative_spent_per_day ) )
    
    chart
  end

  def last_30_days_weights_chart
    
    date_range = ( 14.days.ago.to_date .. Date.today ).to_a
    data = date_range.collect { |date| r = Reading.for_day( date ); r ? r.weight.kg : 0.0 }
    
    title = Title.new( "Weight (14 days)" )
    
    x_axis = XAxis.new
    
    x_axis.labels = date_range.collect { |date| date.day.to_s }
    
    y_axis = YAxis.new
    ymin,ymax = ( data.min.to_i / 4 )*4, ((data.max.to_i/4)+1)*4
    ymin = ymin < 0 ? 0 : ymin
    y_axis.set_range( ymin, ymax, 1 )
    
    chart = OpenFlashChart.new
    chart.title = title
    chart.y_axis = y_axis
    chart.x_axis = x_axis
    
    chart.add_element( make_line( "KG", "#007600", data ) )
    chart.add_element( make_line( "Avg.", "#97092F", data.map { data.sum / data.size } ) )
    chart.add_element( make_line( "Trend", "#0D1BD5", trend( data ) ) )
    
    chart
  end
  
protected

  def trend( data )
    first, last, points = data.first, data.last, data.size
  
    range = (first-last)
    n = range / points
  
    (0...points).to_a.inject( [] ) { |ary,i| (ary << first - (n*i)) }
  end
  
  def make_line( label, colour, values )
    line = Line.new
    line.text = label
    line.colour = colour
    line.width = 3
    line.dotsize = 3
    line.values = values
    line
  end  
  
end
