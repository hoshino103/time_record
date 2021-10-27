class RecordsController < ApplicationController
  def index
    @records = Record.all
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    #ログインユーザーの今日の出退勤レコード
    @record1 = Record.find_by(day:today , user_id:current_user.id)

    if @record1 == nil
       @record.save
       redirect_to root_path
    #現在のレコードに出勤時間がなく、送られてきたデータに出勤時間がある場合
    elsif @record1.begin == nil && @record.begin != nil
      @record1.update(record_params)
      redirect_to root_path    #現在のレコードに退勤時間がなく、送られてきたデータに退勤時間がある場合
    elsif @record1.finish == nil && @record.finish != nil
      @record1.update(record_params)
      redirect_to root_path
    else
      render action: :confirm
    end
  end

  def back
		@record = Record.new(record_params)
		render :index
	end

	def confirm
		@record = Record.new
		@record = Record.new(record_params)
		if @record.invalid?
			render :confirm
		end
	end

	def complete
    @record1 = Record.find_by(day:today , user_id:current_user.id)
		if @record1.update(record_params)
      redirect_to user_path(current_user.id)
    else
      @record = Record.new(record_params)
      render :confirm
    end
	end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
       redirect_to user_path(current_user.id)
    else 
      @record = Record.find(params[:id])
      render :edit
    end
  end

  def edit
    # @records = Record.chack_time(params[:id])
    @record = Record.find(params[:id])
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to user_path
  end

  def search
    @records = Record.search(keyword_params,id_params)
  end
  
  private

  def record_params
    params.require(:record).permit(:day, :begin, :finish, :break).merge(user_id: current_user.id)
  end

  def keyword_params
    params[:keyword]
  end
  def id_params
    params[:id]
  end
    

  def today
    time = Time.now
    year = time.year
    month = time.month
    day = time.day
    "#{year}#{month}#{day}"
  end
end
