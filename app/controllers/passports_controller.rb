class PassportsController < ApplicationController
  before_action :set_passport, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    Passport.reset_column_information
    send_mail
    if params[:search]
      search_parameter = params[:search]
      @passports = Passport.search(params[:search]).paginate(:page => params[:page], :per_page => 5).order('id DESC')
    else
      @passports = Passport.paginate(:page => params[:page], :per_page => 5).order('id DESC')#all
    end

    respond_to do |format|
        format.html 
        format.json { render :search, json: @passports}
        format.js {render :search}
    end
  end

  def show
  end

  def new
    @passport = Passport.new
    @disable = false #remove read_only in employee_id
    @title = "Add new Passport"
    @readonly_class = "no_read_only" #format color input no read only

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @title = "Update Passport"
    @disable = true #add read_only in employee_id
    @readonly_class = "read_only" #format color input read only
  end

  def create
    @passport = Passport.new(passport_params)

    respond_to do |format|
      if @passport.save
        format.json { render :show, status: :created, location: @passport }
        format.js
      else
        format.json { render json: @passport.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @passport.update(passport_params)
        format.json { render :show, status: :ok, location: @passport }
        format.js
      else
        format.json { render json: @passport.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    if @passport.destroy
      respond_to do |format|
        format.json { head :no_content }
        format.js
      end
    else
      respond_to do |format|
        format.json { render json: @passport.errors }
        format.js
      end
    end
  end

  #send mail
  def send_mail
    Passport.find_each do |p|
      if p.passport.empty?
        BasicMailer.basic_email(p).deliver
      end
    end
  end

  # Search
  def search
  end

  def sub_search
    search_parameter = params[:search]
    @search = Passport.ransack(search_parameter) 
    @passports = @search.result.paginate(:page => params[:page], :per_page => 2)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passport
      @passport = Passport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passport_params
      params.require(:passport).permit(:employeeId, :name, :dob, :passport, :email, :project, :issue, :expire)
    end
end