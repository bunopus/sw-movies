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
2. Mock database, and define Movie model (thanks https://github.com/Package/Star-Wars-Express for json)  
3. Added `json_serializable` - package for data serialization/deserialization. To generate model, follow the [rules](https://github.com/dart-lang/json_serializable/tree/master/example).
4. Combine all together. Add movies to response, but we require additional `Movies` class for that as a container for movies array.