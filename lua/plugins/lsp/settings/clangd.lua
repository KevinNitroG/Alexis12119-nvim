return {
  cmd = {
    "clangd",
    "--all-scopes-completion",
    -- "--suggest-missing-includes",
    -- "--background-index",
    -- "--pch-storage=disk",
    -- "--cross-file-rename",
    -- "--log=info",
    -- "--completion-style=detailed",
    "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
    "--clang-tidy",
    "--offset-encoding=utf-16",
    -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
    -- "--fallback-style=Google",
    "--fallback-style=Microsoft",
    -- "--header-insertion=never",
    -- "--query-driver=<list-of-white-listed-complers>"
    "--query-driver=" .. (vim.fn.has "win32" == 1 and "C:/ProgramData/mingw64/mingw64/bin/g*.exe" or "/usr/bin/g*"),
    "--inlay-hints=true",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
  },
}
