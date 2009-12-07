# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Rhul Registry_session',
  :secret      => 'c9f7121a92417b6c33d37853af376862ddeaa4ddf1361fbd3c7adb8cf02c334dea82f16d0a9fc3525b38f313295855cb0a366c1d444d85e195f388cbe58571a0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
