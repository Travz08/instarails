class HomeController < ApplicationController
  def landing
  end
  def profile
    @photos = current_user.photos
  end
end
