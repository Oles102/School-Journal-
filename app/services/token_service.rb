# class TokenService
#   class << self
#     def generate_token(payload)
#       JWT.encode(payload, Rails.application.secret_key_base)
#     end

#     def decode_token(token)
#       decoded = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
#       decoded[0] if decoded.present?
#     rescue JWT::DecodeError => e
#       Rails.logger.error("JWT decode error: #{e.message}")
#       nil
#     end
#   end
# end
