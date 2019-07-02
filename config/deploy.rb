# config valid only for current version of Capistrano
# lock '3.4.0'

set :application, 'depdep'
set :repo_url, 'git@gitlab.com:webmely/donghox.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, ENV['BRANCH'] if ENV['BRANCH']

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/rails'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug
set :rvm_type, :system
# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/unicorn.rb', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('public/spree', 'public/ckeditor_assets', 'public/stores', 'public/sitemaps', "tmp")

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
#set :branch, fetch(:branch, "develop_2")

# Default value for keep_releases is 5
set :keep_releases, 3

#Take a look at the load:defaults (bottom of file) task for options you can set. https://github.com/javan/whenever/blob/master/lib/whenever/capistrano/v3/tasks/whenever.rake. For example, to namespace the crontab entries by application and stage do this.

#In your in "config/deploy.rb" file:
#set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles, ["app"]

# Number of delayed_job workers
# default value: 1
#set :delayed_job_workers, 8

# String to be prefixed to worker process names
# This feature allows a prefix name to be placed in front of the process.
# For example:  reports/delayed_job.0  instead of just delayed_job.0
#set :delayed_job_prefix, :reports

# Delayed_job queue or queues
# Set the --queue or --queues option to work from a particular queue.
# default value: nil
set :delayed_job_queues, ['send_email','default', 'sender_score']

# Specify different pools
# You can use this option multiple times to start different numbers of workers for different queues.
# default value: nil
set :delayed_job_pools, {
    :default => 1
}

# Set the roles where the delayed_job process should be started
# default value: :app
set :delayed_job_roles, [:app, :background]

# Set the location of the delayed_job executable
# Can be relative to the release_path or absolute
# default value 'bin'
# set :delayed_job_bin_path, 'script' # for rails 3.x


# set the locations that we will look for changed assets to determine whether to precompile
set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)

# clear the previous precompile task
Rake::Task["deploy:assets:precompile"].clear_actions
class PrecompileRequired < StandardError; end

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :restart, :change_owner do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      #execute "chown -R rails:rails #{release_path}/public/assets"
    end
  end
  # on roles(:web) do
  #   Rake::Task["deploy:assets:precompile"].clear_actions
  # end

  task :symlinks do
    on roles(:web, :rake, :delay_job) do
      #execute "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      #execute "ln -nfs #{shared_path}/config/unicorn.rb #{release_path}/config/unicorn.rb"
      #execute "ln -nfs #{shared_path}/public/spree #{release_path}/public/spree"
      #execute "ln -nfs #{shared_path}/public/ckeditor_assets #{release_path}/public/ckeditor_assets"
      #execute "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"
      #execute "ln -nfs #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb"
      # user avatars
      #execute "mkdir -p #{release_path}/public/system/users/"
      #execute "ln -fs #{shared_path}/system/avatars/ #{release_path}/public/system/users/"
    end
  end
  task :stop do
    on roles(:web), in: :sequence, wait: 5 do
	    execute "/etc/init.d/unicorn stop"  ## -> line you should add
	  end
  end
  after :updating, :symlinks
  after :updating, :stop
  #after :updating, :migrate
  after :publishing, :restart

	task :restart do
	  on roles(:web), in: :sequence, wait: 5 do
      execute "mkdir #{release_path}/pids"
	    execute "/etc/init.d/unicorn restart"  ## -> line you should add
	  end
	end


  namespace :assets do
    desc "Precompile assets"
    task :precompile do
      on roles(fetch(:assets_roles)) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            begin
              # find the most recent release
              latest_release = capture(:ls, '-xr', releases_path).split[1]

              # precompile if this is the first deploy
              raise PrecompileRequired unless latest_release

              latest_release_path = releases_path.join(latest_release)

              # precompile if the previous deploy failed to finish precompiling
              execute(:ls, latest_release_path.join('assets_manifest_backup')) rescue raise(PrecompileRequired)

              fetch(:assets_dependencies).each do |dep|
                # execute raises if there is a diff
                execute(:diff, '-Naur', release_path.join(dep), latest_release_path.join(dep)) rescue raise(PrecompileRequired)
              end

              info("Skipping asset precompile, no asset diff found")

              # copy over all of the assets from the last release
              execute(:cp, '-r', latest_release_path.join('public', fetch(:assets_prefix)), release_path.join('public', fetch(:assets_prefix)))
            rescue PrecompileRequired
              execute(:rake, "assets:precompile")
            end
          end
        end
      end
    end
  end
end
