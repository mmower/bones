# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bones_session',
  :secret      => 'b0e6671240b775099fc4895b415410f3e7691c73ae89a48aeb2d11dd0e725b675675393ba136d3fd1908881326362b7d82077dcf26bfa5ee92784ad3fa24fdb5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
