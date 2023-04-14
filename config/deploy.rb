# config valid for current version and patch releases of Capistrano
lock "~> 3.1"

set :application, "furima-39063"
set :repo_url, "git@github.com:IIZUKA-JP/furima-39063.git"
set :branch, "main"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, "2.6.5" 

# どの公開鍵を利用してデプロイするか
set :ssh_options, {
  auth_methods: ['publickey'],
  keys: ['~/.ssh/furima.pem'],
  forward_agent: true
}

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
