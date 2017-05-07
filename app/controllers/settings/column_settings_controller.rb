# frozen_string_literal: true

class Settings::ColumnSettingsController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!

  def show; end

  def update
    begin
      current_user.transaction do
        current_user.column_settings.delete_all
        column_setting_params[:column_settings_attributes].each_with_index do |input|
          column_setting = ColumnSetting.new
          column_setting.order_id = input[0].to_i + 1
          column_setting.column_type = input[1][:column_type]
          current_user.column_settings.append(column_setting)
        end
      end
    rescue
      self.show
    end
    redirect_to settings_column_setting_path, notice: I18n.t('generic.changes_saved_msg')
  end

  private

  def column_setting_params
    params.require(:user).permit(column_settings_attributes: [:column_type, :order_id])
  end

end
