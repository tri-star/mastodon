class ColumnSetting < ApplicationRecord

  belongs_to :user, inverse_of: :column_settings

  default_scope { order('order_id asc') }

  def self.get_available_columns()
    [:home, :federated, :notifications, :getting_started]
  end

end
