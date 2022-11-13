local neotest = SafeRequire("neotest")

neotest.setup  {
   adapters = {
     require("neotest-jest"),
     require("neotest-elixir"),
     require("neotest-rust")
  }
}
