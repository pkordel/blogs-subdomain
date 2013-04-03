class SubdomainsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :set_user
  before_filter :set_subdomain
  respond_to :html

  # GET /subdomains
  # GET /subdomains.json
  def index
    @subdomains = Subdomain.all
    respond_with @subdomains
  end

  # GET /subdomains/1
  # GET /subdomains/1.json
  def show
    respond_with @subdomain
  end

  # GET /subdomains/new
  # GET /subdomains/new.json
  def new
    respond_with @subdomain
  end

  # GET /subdomains/1/edit
  def edit
    respond_with @subdomain
  end

  # POST /subdomains
  # POST /subdomains.json
  def create
    @subdomain = @user.subdomains.build(params[:subdomain])
    if @subdomain.save
      redirect_to @user, notice: "Successfully created subdomain."
    end
  end

  # PUT /subdomains/1
  # PUT /subdomains/1.json
  def update
    if @subdomain.update_attributes(params[:subdomain])
      flash[:notice] = "Successfully updated subdomain."
    end
    respond_with([@user, @subdomain])
  end

  # DELETE /subdomains/1
  # DELETE /subdomains/1.json
  def destroy
    @subdomain.destroy
    redirect_to @user, notice: "Successfully destroyed subdomain."
  end

  private

  def set_subdomain
    @subdomain = params[:id] ? @user.subdomains.find(params[:id]) : @user.subdomains.build
  end

  def set_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = @subdomain.user
    end
    unless current_user == @user
      redirect_to @user, :alert => "Are you logged in properly? You are not allowed to create or change someone else's subdomain."
    end
  end

end
