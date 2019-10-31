class RecordsController < ApplicationController
  # before_action :authenticate_user
  # before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @records = Exercise.all.order(created_at: :desc)
  end

  def show
    @record = Exercise.find_by(id: params[:id])
    @menus = @record.menus
  end

  def new
    @record = Exercise.new
    @menus = Menu.new
  end

  def create
    @record = Exercise.new(event: params[:event])
    @menus = Menu.new(weight: params[:weight], rep: params[:rep], exercise_id: @record.id)
    if @record.save
      @menu = @record.menus.create(weight: params[:weight], rep: params[:rep], exercise_id: @record.id)
      flash[:notice] = "記録を作成しました"
      redirect_to("/records/index")
    else
      render :new
    end
  end

  def edit
    @record = Exercise.find_by(id: params[:id])
    @menus = @record.menus
  end

  def update
    @record = Exercise.find_by(id: params[:id])
    @menus = @record.menus
    # 記録失敗時に入力値を保持しておく処理
    @record.event = params[:event]
    @menus.each do |menu|
      menu.weight = params[:weight]
      menu.rep = params[:rep]
    end
    if @record.update(event: params[:event]) && @menus.update(weight: params[:weight], rep: params[:rep])
      flash[:notice] = "記録を編集しました"
      redirect_to("/records/index")
    else
      render :edit
    end
  end

  def destroy
    @record = Exercise.find_by(id: params[:id])
    @record.destroy
    flash[:notice] = "記録を削除しました"
    redirect_to("/records/index")
  end

end
