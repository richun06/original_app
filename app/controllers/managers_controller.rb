class ManagersController < ApplicationController

  def new
    @manager = Manager.new
  end
end
