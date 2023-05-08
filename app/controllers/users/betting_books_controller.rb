# frozen_string_literal: true

module Users
  class BettingBooksController < ApplicationController
    def new
      @user_betting_book = ::BettingBook.find(params[:betting_book_id])
      build_user_betting_book({ betting_book: @user_betting_book })
    end

    def create
      build_user_betting_book(user_betting_book_params)

      respond_to do |format|
        if @user_betting_book.save
          @user_betting_book.sync!
          format.turbo_stream do
            flash.now[:notice] = "#{@user_betting_book.name} will start linking"
          end
          Users::BettingBooks::SyncJob.perform_later(@user_betting_book.id)
        else
          format.turbo_stream do
            flash.now[:alert] = @user_betting_book.errors.full_messages
          end
        end
      end
    end

    private

    def build_user_betting_book(attrs)
      @user_betting_book = current_user.betting_books.new(attrs)
    end

    def user_betting_book_params
      params.require(:users_betting_book).permit(:betting_book_id, :email, :password)
    end
  end
end
