# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Hippo::Application.config.secret_key_base = Secret.secret_key_base || 'ac0d46113d393ec821b99efb5799f8260018d23587feee6e02209673d98879c671745d28a8fe5805a025a3dd6c0b05ae908681de45015c5f38d1048839259386'
