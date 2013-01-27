$: << "../lib"

require 'spec_helper'
require 'database'

describe Database do
   describe "#new" do
      describe "with no parameters" do
         before do
            @db = Database.new
         end

         it "Server should be localhost" do
            @db.server.should == "localhost"
         end

         it "Collection should be Ledgers" do
            @db.collection.should == "Ledgers"
         end

         it "Databse Name should be Ledgers" do
            @db.dbname.should == "Ledgers"
         end
      end

      describe "with a server and no collection passed" do
         before do
            @db = Database.new("kfries-laptop")
         end

         it "Server should be kfries-laptop" do
            @db.server.should == "kfries-laptop"
         end

         it "Collection should be Ledgers" do
            @db.collection.should == "Ledgers"
         end

         it "Databse Name should be Ledgers" do
            @db.dbname.should == "Ledgers"
         end
      end

      describe "with a collection and no server passed" do
         before do
            @db = Database.new(nil, "testing")
         end

         it "Server should be localhost" do
            @db.server.should == "localhost"
         end

         it "Collection should be testing" do
            @db.collection.should == "testing"
         end

         it "Databse Name should be Ledgers" do
            @db.dbname.should == "Ledgers"
         end
      end

      describe "with both a server and collection passed" do
         before do
            @db = Database.new("kfries-laptop", "testing")
         end

         it "Server should be kfries-laptop" do
            @db.server.should == "kfries-laptop"
         end

         it "Collection should be testing" do
            @db.collection.should == "testing"
         end

         it "Databse Name should be Ledgers" do
            @db.dbname.should == "Ledgers"
         end
      end

      describe "when non existant servername exists" do
         it "Should fail with ServerNotFound error" do
            lambda {Database.new("ThisShouldFail.com")}.should raise_error(DBServerNotFound)
         end
      end
   end

   describe "#getLedgerList" do
      pending
   end

   describe "#getLedger" do
      pending
   end

   describe "#addLedger" do
      pending
   end

   describe "#updateLedger" do
      pending
   end
end
