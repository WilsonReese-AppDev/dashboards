class ApplicationController < ActionController::Base

  def homepage
    render({ :template => "/dashboards.html.erb"})
  end

end
