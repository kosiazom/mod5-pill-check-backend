class Api::V1::NotesController < ApplicationController
  skip_before_action :logged_in? , only: [:index, :show, :create]

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
    # notes = Note.all
    note = Note.create(date: params[:date], description:params[:description], user_id: params[:user_id])
    # byebug
      render json: note
  end

  def update
    note = Note.find_by(id: params[:id])
    note.update(description: params[:description])
    render json: note
  end

  def destroy
      note = Note.find_by(params[:id])
      note.destroy!
      render json: {}
  end
  
end
