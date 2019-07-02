server '128.199.169.55', user: 'root', roles: %w{web app},
	:ssh_options => {
          :keepalive => true,
          :keepalive_interval => 60 #seconds
        }
