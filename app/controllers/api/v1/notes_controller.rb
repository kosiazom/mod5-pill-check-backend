class Api::V1::NotesController < ApplicationController
  skip_before_action :logged_in? , only: [:index, :show]

  def index
    notes = Note.all
    notes = Note.where("user_id = ?", params[:user_id])
    render json: notes
end

    def show
        note = Note.find(params[:id])
        render json: note, except: [:updated_at, :created_at]
    end

  def create
    # byebug
    note = Note.create(date: params[:date], description:params[:description], title: params[:title], user_id: params[:user_id])
    # byebug
      render json: note, except: [:updated_at, :created_at]
  end

  def update
    note = Note.find_by(id: params[:id])
    note.update(description: params[:description], title: params[:title])
    render json: note, except: [:updated_at, :created_at]
  end

  def destroy
      note = Note.find(params[:id])
      note.destroy!
      render json: {}
  end
  
end
