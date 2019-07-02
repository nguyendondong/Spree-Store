require 'pusher'

Pusher.app_id = Rails.application.secrets.pusher_app_id
Pusher.key = Rails.application.secrets.pusher_key
Pusher.secret = Rails.application.secrets.pusher_secret
Pusher.cluster = Rails.application.secrets.pusher_cluster
Pusher.logger = Rails.logger
Pusher.encrypted = true