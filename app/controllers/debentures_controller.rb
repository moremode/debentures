class DebenturesController < ApplicationController
  def generate

  end

  def generate_table
    id = params[:id]
    if id != nil
      id = id.to_i
      @id = id
      par = Parameter.find id
      @loan = par.loan_amount
      @percent = par.year_percent
      @start = par.date_start.to_s.split(' ')[0]
      @end = par.date_end.to_s.split(' ')[0]
    else
      @id = 0
    end
  end
end
