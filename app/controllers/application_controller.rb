class ApplicationController < ActionController::API
  # before_action :authenticate_request!

  # private

  # def authenticate_request!
  #   token = request.headers['Authorization']&.split(' ')&.last
  #   payload = TokenService.decode_token(token)
  #   @current_student = Student.find(payload['student_id']) if payload && payload['student_id']
  #   render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_student
  # end
end
