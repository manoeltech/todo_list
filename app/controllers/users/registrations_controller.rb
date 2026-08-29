# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: "Signed up successfully."},
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {
          code: 422,
          message: "User couldn't be created successfully.",
          errors: resource.errors.full_messages
        }
      }, status: :unprocessable_entity
    end
  end
end
