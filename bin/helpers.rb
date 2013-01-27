def openDatabase (db = :production)
   raise ArgumentError, "Invaild Database to open" unless [:production, :testing].include? db
   result = nil

   begin
      result = db == :production ? Database.new : Database.new(nil, "testing")
   rescue DBServerNotFound
      $stderr.puts $!
   end

   return result
end
