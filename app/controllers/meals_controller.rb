class MealsController < ApplicationController
  
  def index
    @meals = if self.week
      week.meals.find( :all, :order => 'eaten_on ASC, kind ASC' )
    else
      Meal.find( :all, :order => 'eaten_on ASC, kind ASC' )
    end
  end
  
  def show
    @meal = Meal.find_by_id( params[:id] )
  end
  
  def new
    @meal = Meal.new
    @meal.eaten_on = Date.today
    @meal.week = Week.for_date( Date.today )
  end
  
  def create
    @meal = Meal.create( params[:meal] )
    redirect_to meals_path
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
