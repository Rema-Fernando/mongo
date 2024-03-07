class TokenHandler
    # def self.encode_email_verfication(data)
    #     jwt_payload = { ver_token: data, exp: 24.hours.from_now.to_i }
    #     JWT.encode(jwt_payload, "Deepak", 'HS256')
    # end
    def self.encode(payload, expiry: 15.minutes.from_now.to_i)
      payload[:expiry] = expiry
        # payload = {
        #   payload: payload,
        #   exp: expiry
        # }
        JWT.encode(payload, "Rema", 'HS256')
    end
    def self.decode(token)
        secret_key = "Rema"
        begin
          decoded_token = JWT.decode(token, secret_key, false, { algorithm: 'HS256' })
          # JWT.decode returns an array where the first element is the payload and the second is the header part of the token
          decoded_token[0].with_indifferent_access # Return the payload
        rescue JWT::DecodeError => e
          # Handle decode errors, e.g., token tampered, wrong signature, etc.
          nil # Or return an appropriate error message/response
        end
    end
end
# payload = {} # Ensure payload is initialized as an empty hash
#   payload[:user_id] = user_id
#   payload[:expiry] = expiry
# payload = {
#     user_id: user_id,
#     exp: expiry.to_i # UNIX timestamp
#   }