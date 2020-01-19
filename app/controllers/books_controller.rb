class BooksController < ApplicationController

	def index
		if !params.key?(:genres)
			params[:genres] = {}
		end

		permitted = params.permit(:sort, genres: params[:genres].keys)
		sort = permitted[:sort] || session[:sort]

		case sort
			when 'title'
				ordering, @title_header = {:title => :asc}, 'hilite'
			when 'release_date'      
				ordering, @date_header = {:release_date => :asc}, 'hilite'
		end
 
		@selected_genres = permitted[:genres] || session[:genres] || {}
		if @selected_genres == {}  
			@selected_genres = Hash[Book::GENRES.map {|genre| [genre, genre]}]
		end

		if permitted[:sort] != session[:sort] or permitted[:genres] != session[:genres]
			session[:sort] = sort
			session[:genres] = @selected_genres
			redirect_to :sort => sort, :genres => @selected_genres and return
		end

		@books = Book.where(genre: @selected_genres.keys).order(ordering)
	end

	def show
		id = params[:id]
		@book = Book.find(id)
	end

	def new
		@book = Book.new
	end

	def create
		params.require(:book)
		permitted = params[:book].permit(:title, :genre, :isbn, :publish_date, :description, :genres, :author)
		
		@book = Book.new(permitted)

		if @book.save
			flash[:notice] = "#{@book.title} was successfully created."

			redirect_to books_path
		else
			render 'new'
		end
	end

	def edit
		@book = Book.find params[:id]
	end

	def update
		@book = Book.find params[:id]
		
		params.require(:book)
		params.require(:book)
		permitted = params[:book].permit(:title, :genre, :isbn, :publish_date, :description, :genres, :author)
		
		if @book.update(permitted)
			flash[:notice] = "#{@book.title} was successfully updated."

			redirect_to books_path(@book)
		else
    	render 'edit'
  	end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		flash[:notice] = "Book '#{@book.title}' deleted."

		redirect_to books_path
	end

	def same_author
		@book = Book.find(params[:id])
		if !@book.author.present?
			return redirect_to books_path, :alert => "'#{@book.title}' has no author info"
		end
			@books = Book.where(author: @book.author)
	end
end