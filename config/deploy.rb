set :user, 'brightpromise'  # Your dreamhost account's username
set :domain, 'smithers.dreamhost.com'  # Dreamhost servername where your account is located 
set :project, 'Rhul Registry'  # Your application as its called in the repository
set :application, 'registry.landofrhul.com'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup


# version control config
set :scm_username, 'rachelober'
set :scm_password, 'ramo1019'
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
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


