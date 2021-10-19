class RecordsController < ApplicationController

  def index
    @record = Record.new
    @records = Record.all
  end

  def create
    @record = Record.new(record_params)

    #ログインユーザーの今日の出退勤レコード
    @record1 = Record.find_by(day:today , user_id:current_user.id)
    
    if @record1 == nil
       @record.save
    #出勤時間がある時上書き
    elsif @record1.begin != nil
       @record1.update(record_params)
    #退勤時間がある時上書き
    elsif @record1.finish != nil
       @record1.update(record_params)
    end
  end

  def show
    @record = Record.where(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to record_path
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to record_path
  end

  def search
    @records = Record.search(params[:keyword])
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

end
