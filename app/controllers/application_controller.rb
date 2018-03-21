class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from(ActiveRecord::RecordNotFound) { |e| render_error(e.message, :not_found) }
  rescue_from(ActiveRecord::StatementInvalid) { |e| render_error(e.message, :bad_request) }
  rescue_from(ActiveRecord::RecordInvalid) { |e| render_error(e.message, :bad_request, errors: e.record.errors) }
  rescue_from(ActionController::ParameterMissing) { |e| render_error(e.message, :bad_request, param: e.param) }

  def render_error(message, status, extra = {})
    render json: { message: message }.merge(extra), status: status
  end
end
