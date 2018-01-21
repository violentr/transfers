class JsonWebToken

  SECRET_KEY = Rails.application.secrets.secret_key_base

  class << self

    def encode(payload, exp = 2.hours.from_now)
      payload[:exp] = exp.to_i

      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      body = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new body

      rescue JWT::ExpiredSignature, JWT::VerificationError => e
        raise ExceptionHandler::ExpiredSignature, e.message
      rescue JWT::DecodeError, JWT::VerificationError => e
        raise ExceptionHandler::DecodeError, e.message
    end
  end
end
