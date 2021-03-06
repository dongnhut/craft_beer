class UsersController < ApplicationController
  before_action :user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.page params[:page]
  end

  # GET /users/1
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    # to do for generate pass and send mail
    if @user.save
      redirect_to users_url, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to users_url, notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Member was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    permited_params = params.require(:user).permit(:name, :email, :address)
    permited_params.merge!(password: '12345678')
  end
end
