class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create]
  before_action :authenticate_user, only: [:index]
  skip_before_action :verify_authenticity_token
 

  # GET /users
  # GET /users.json
  def index
    render json: { status: 200, msg: "Yes you're logged in! as #{current_user.first_name}"}
  end

  def find 
    @user = User.find_by(email: params[:user][:email])
    if @user 
      render json: @user
    else 
      @errors = @user.errors.full_messages
      render json: @errors
    end 
  end 

  def set_user 
    @user = User.find_by(id: params[:id])
  end 

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { "yay you created #{@user.first_name}" }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)
    end

end
