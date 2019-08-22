class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  def index
    @blog = Blog.find(params[:blog_id])
    @entries = @blog.entries
  end

  def show
    @blog = @entry.blog
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.build
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.build(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @blog = @entry.blog
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = @entry.blog
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to blog_entries_url(@blog), notice: 'Entry was successfully destroyed.' }
      format.json  { head :no_content }
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end