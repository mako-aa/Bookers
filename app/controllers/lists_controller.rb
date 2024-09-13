class ListsController < ApplicationController
  def index
    #Viewへわたす変数
    @list = List.new
    @lists = List.all
  end
  
  def create
    #データを受け取り新規登録するため
    @list = List.new(list_params)
  
    #データが入力されているか
    if @list.save
      #フラッシュメッセージ
      flash[:notice] = "Book was successfully created."
      redirect_to list_path(@list.id)
    else 
      @lists = List.all
      render :index
    end
    
  end

  
  def show
    #データを1件取得
    @list = List.find(params[:id])
  end
  
  def edit
    #データを1件取得
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    #投稿一覧画面へ
    redirect_to '/lists'
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end