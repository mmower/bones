class Reading < ActiveRecord::Base
  belongs_to :week
  
  def self.for_day( date )
    find( :first, :conditions => { :taken_on => date } )
  end
  
  class Weight
    attr_accessor :grams
    
    def initialize( weight_in_grams )
      @grams = weight_in_grams
    end
    
    def to_i
      @grams
    end
    
    def to_f
      self.kg
    end
    
    def kg
      @grams.to_f / 1000
    end
    
    def to_s
      kg.to_s
    end
  end
  
  composed_of :weight,
    :class_name => '::Reading::Weight',
    :mapping => ['weight_in_grams','grams'],
    :allow_nil => false,
    :converter => Proc.new { |w| w.nil? ? Weight.new( 0 ) : Weight.new( Integer( w.to_f * 1000 ) ) },
    :constructor => Proc.new { |w| Weight.new( w || 0 ) }
  
end
