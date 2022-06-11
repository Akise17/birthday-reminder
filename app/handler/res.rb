class Res
  def self.call(code, message, data = nil)
    response = {
      meta: {
        status: code,
        message: message
      },
      data: data
    }

    response
  end
end
