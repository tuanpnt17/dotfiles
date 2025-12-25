return {
  {
    "nvim-neotest/neotest",
    commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c", -- THIS ONE
    optional = true,
    requires = {
      {
        "Issafalcon/neotest-dotnet",
      }
    },
  },
  {
    "Issafalcon/neotest-dotnet",
    lazy = false,
    dependencies = {
      "nvim-neotest/neotest"
    }
  },
}
