class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to @book, notice: "Book was successfully created."
	   else
		@books = Book.all
		render 'index'
	   end
	end

	def index
		@books = Book.all
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@book_comment = BookComment.new
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.user == current_user
			@book.destroy
			redirect_to books_path, notice: "Book was successfully deleated."
		else
			render :index
		end
	end


	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to @book, notice: "Book was successfully created."
		else
			render 'edit'
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
	def correct_user
  @book = Book.find_by(id: params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
		
	end

end
