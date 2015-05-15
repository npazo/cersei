class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    Setting.initialize
    @settings = Setting.order(name: :asc)
  end

  def show
  end

  def new
    @setting = Setting.new
  end

  def edit
  end

  def create
    @setting = Setting.new(setting_params)

    respond_to do |format|
      if @setting.save
        format.html { redirect_to @setting, notice: 'Setting was successfully created.' }
        format.json { render :show, status: :created, location: @setting }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @setting = Setting.find(params[:id])
    @setting.is_new = false
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
        format.json { respond_with_bip(@setting) }

        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@setting) }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def mark_all_reviewed
    @settings = Setting.where(is_new: true)
    @settings.each do |setting|
      setting.is_new = false
      setting.save
    end
    respond_to do |format|
      format.html { redirect_to settings_url, status: :see_other, notice: 'Settings were all marked as reviewed.' }
      format.json { head :no_content }
    end
  end

  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to settings_url, notice: 'Setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def setting_params
      params.require(:setting).permit(:name, :value)
    end
end
