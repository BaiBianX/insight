# frozen_string_literal: true

set :stage, :test
set :branch, 'master'
set :rails_env, :test

server '112.74.107.202',
       user: 'root',
       roles: %w(web app db),
       ssh_options: {
         user: 'root', # overrides user setting above
         keys: %w(/root/.ssh/id_rsa),
         forward_agent: true,
         auth_methods: %w(publickey password)
         # password: "please use keys"
       }
