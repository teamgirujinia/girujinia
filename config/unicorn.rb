worker_processes 2
working_directory "/home/sagae/girujinia/current"

timeout 3600


listen "/var/run/unicorn/girujinia.sock"
pid "/var/run/unicorn/girujinia.pid"


stderr_path "/home/sagae/girujinia/current/log/unicorn.log"
stdout_path "/home/sagae/girujinia/current/log/unicorn.log"


preload_app true