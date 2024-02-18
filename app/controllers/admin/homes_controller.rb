class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @admins_sign_in = true 
  end
end
