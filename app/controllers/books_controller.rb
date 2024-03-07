class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def show
    
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:book, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
