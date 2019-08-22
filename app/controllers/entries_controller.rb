class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]
  before_action :set_blog_by_params, only: %i[index new create]
  before_action :set_blog_by_association, only: %i[show edit destroy]

  def index
    @entries = @blog.entries
  end

  def show
  end

  def new
    @entry = @blog.entries.build
  end

  def create
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

  def set_blog_by_params
    @blog = Blog.find(params[:blog_id])
  end

  def set_blog_by_association
    @blog = @entry.blog
  end
end