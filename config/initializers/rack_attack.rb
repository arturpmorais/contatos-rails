class Rack::Attack
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

    # liberar para o localhost (desenvolvimento)
    safelist('allow-localhost') do |req|
        '127.0.0.1' == req.ip || '::1' == req.ip
    end

    # limitar em 5 requests a cada 5 segundos
    throttle('req/ip', limit: 5, period: 5) do |req|
        req.ip
    end

    # limitar logins por endereco de e-mail
    
    #throttle("logins/email", limit: 5, period: 20.seconds) do |req|
    #  if req.path == '/users/sign_in' && req.post?
    #  req.params['email'].presence
    #  end
    #end

end