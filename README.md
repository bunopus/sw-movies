# sw-movies
Example repository for Dart language, which demonstrates server, client, mobile development and code reuse between them

1. Start with simple server without any additional dependencies. Just listen on the localhost for the requests.  
  **NOTE**: Put attention on *analysis_options.yaml*. It's recommended options (and most strict though).  
  To start server run:
  ```zsh
    cd server
    pub get
    dart bin/server.dart
  ```