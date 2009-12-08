set :user, 'brightpromise'  # Your dreamhost account's username
set :domain, 'smithers.dreamhost.com'  # Dreamhost servername where your account is located 
set :project, 'Rhul Registry'  # Your application as its called in the repository
set :application, 'registry.landofrhul.com'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup


# version control config
set :scm_username, 'rachelober'
set :scm_password, 'ramo1019'
set :scm_command, "~/packages/bin/git" # updated version of git on  server in user directory
set :local_scm_command, "/usr/local/git/bin/git" # correct path to local  git
set :scm, 'git'
set :repository, "git@github.com:rachelober/Rhul-Registry.git"
set :deploy_via, :remote_cache
#set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
ssh_options[:keys] = %w(/.ssh/id_rsa)  # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

#Passenger stop, start, and restart calls
namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
