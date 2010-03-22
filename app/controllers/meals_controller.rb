class MealsController < ApplicationController
  
  def index
    @meals = if self.week
      week.meals.find( :all, :order => 'eaten_on ASC, kind ASC' )
    else
      Meal.find( :all, :order => 'eaten_on ASC, kind ASC' )
    end
    
    if params[:day]
      render :action => 'index_by_day'
    else
      render :action => 'index'
    end
  end
  
  def show
    @meal = Meal.find_by_id( params[:id] )
  end
  
  def new
    
    @meals = Meal.asc_sort
    
    @meal = Meal.new
    @meal.eaten_on = Date.today
    @meal.week = Week.for_date( Date.today )
    
    render :action => 'new', :layout => 'leftside'
  end
  
  def create
    @meal = Meal.create( params[:meal] )
    redirect_to new_meal_path( :last_meal_id => @meal.id )
  end
  
  def edit
    @meal = Meal.find_by_id( params[:id] )
  end
  
  def update
    @meal = Meal.find_by_id( params[:id] )
    @meal.update_attributes( params[:meal] )
    redirect_to meals_path
  end
  
  def destroy
    @meal = Meal.find_by_id( params[:id] )
    @meal.destroy
    redirect_to meals_path
  end
  
end
