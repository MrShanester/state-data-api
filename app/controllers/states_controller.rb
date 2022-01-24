class StatesController < ApplicationController
  require 'csv'

  def initialize
    @table = CSV.parse(File.read("state_data.csv"))
    @initials = CSV.parse(File.read("abbreviations.csv"))
  end

  def index
    render json: @table.as_json
  end

  def show 
    state = ""
    @initials.each do |arr|
      state = arr[0] if arr.include?(params[:abv])
    end
    @table.each do |arr|
      render json: arr.as_json if arr.include?(state)
    end
  end
end
