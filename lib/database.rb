require 'mongo'

class DBServerNotFound < StandardError
   def initialize
      super("ERROR: Server Not Found: Unable to find database server")
   end
end

class Database
   attr_reader :server
   attr_reader :collection
   attr_reader :dbname

   def initialize(server=nil, collection=nil)
      server = "localhost" if server.nil?
      collection = "Ledgers" if collection.nil?

      @server = server
      @dbname = "Ledgers"
      @collection = collection

      begin
         @client_obj = Mongo::MongoClient.new(@server)
         @db_obj = @client_obj.db(@dbname)
         @collection_obj = @db_obj[@collection]
      rescue Mongo::ConnectionFailure
         # raise DBServerNotFound, "Invalid Server Specified, Unable to connect to backend database"
         raise DBServerNotFound
      end
   end
end
