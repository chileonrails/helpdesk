# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_helpdesk_session',
  :secret      => 'b6b399624926b1c63ccc7ac77607a96bbe0579bfd98c76dc3b08e9618c9b26028420bb945e8a0cacff5e19de920c3a182c8475d9dbb4f6d4c5e953d9fe26558b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
