class EntriesController < ApplicationController
  def index
    @entries = if params[:search]
                 Entry.where('title LIKE ? OR author LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
               else
                 Entry.all
               end
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
