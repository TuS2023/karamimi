# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    admin_top_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end
