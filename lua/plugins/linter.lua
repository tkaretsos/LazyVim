-- Override golangcilint linter to always pass the package directory.
-- Without this, go.work causes the linter to analyze files individually,
-- breaking cross-file type resolution within the same package.
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      golangcilint = {
        args = {
          "run",
          "--output.json.path=stdout",
          "--output.text.path=",
          "--output.tab.path=",
          "--output.html.path=",
          "--output.checkstyle.path=",
          "--output.code-climate.path=",
          "--output.junit-xml.path=",
          "--output.teamcity.path=",
          "--output.sarif.path=",
          "--issues-exit-code=0",
          "--show-stats=false",
          "--path-mode=abs",
          function()
            -- Always resolve to the file's parent directory so that
            -- golangci-lint sees the whole package, not just one file.
            return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
          end,
        },
      },
    },
  },
}
