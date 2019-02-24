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

  def tables
    @tables = Debenture.all
  end

  def debenture
    @debenture = Debenture.find(params[:id])
    @parameter = @debenture.parameter
    @passport1 = @debenture.passport1
    @passport2 = @debenture.passport2

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
