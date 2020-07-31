Recaptcha.configure do |config|
  config.site_key  = ENV['RECAPCHAUSER']
  config.secret_key = ENV['RECAPCHASERVER']
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end