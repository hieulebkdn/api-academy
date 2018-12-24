class JsonWebToken
  class << self
  JWT_SECRET = 'e0f839d9aba4d1155dffc2cb407cc2e424d080af8caaab8dac7e392148880c9605696200d064c6995879cc532e00f4ba3603ccee9024c37168432492f8382b2e'

  def encode(payload, exp = 30.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end

  def decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]
    HashWithIndifferentAccess.new body
    rescue
    nil
  end
  
  end
end
   