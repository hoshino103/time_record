class RecordsController < ApplicationController

  def index
    @record = Record.new
    @records = Record.all
  end

  def create
      @record = Record.new(record_params)
      record = Record.find_or_create_by(day:today) 
      if record.new_record? 
        @record.save
      else
        record.update_attributes(update_params)
      end
  end

  def show
    @record = Record.where(params[:id])
  end

  def update
    @record = Record.where(params[:id])

  end

  private

  def record_params
    params.require(:record).permit(:day, :begin, :finish, :break).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:record).permit(:begin, :finish, :break).merge(user_id: current_user.id)
  end

  def today
    time = Time.now
    year = time.year
    month = time.month
    day = time.day
    "#{year}#{month}#{day}"
  end

  def confirm
    
  end
end
