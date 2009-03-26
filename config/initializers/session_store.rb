# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ProtestMailer_session',
  :secret      => '531c6a304c631daf445e55aba8a7bc3e4c6e7ed91022c1e90f73312221d562240791d87e6bc7ef345916dedabeee9b925de56938a9b540fbd178348558722e16'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
