# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def icon_tag( name )
    image_tag( "icons/#{name}", :size => '16x16', :class => 'icon', :border => '0' )
  end
  
end
