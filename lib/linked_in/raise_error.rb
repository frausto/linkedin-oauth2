require 'faraday'

module LinkedIn
  class RaiseError < Faraday::Response::RaiseError
    def on_complete(response)
      status_code = response.status.to_i
      puts response.inspect if LinkedIn.config.noisy
      if status_code == 403 && response.body =~ /throttle/i
        raise LinkedIn::ThrottleError
      else
        super
      end
    end
  end
end

Faraday::Response.register_middleware :linkedin_raise_error => LinkedIn::RaiseError
