# site ----

# modified function from pkgdown
deploy_to_branch_book <- function(pkg = ".",
                                  commit_message = pkgdown:::construct_commit_message(pkg),
                                  clean = FALSE,
                                  branch = "gh-pages",
                                  remote = "origin",
                                  github_pages = (branch == "gh-pages"),
                                  ...) {

  dest_dir <- fs::dir_create(fs::file_temp())
  on.exit(fs::dir_delete(dest_dir))
  on.exit(fs::dir_delete("inst/book/relatorio"))
  unlink("inst/book/relatorio")

  if (!pkgdown:::git_has_remote_branch(remote, branch)) {
    old_branch <- pkgdown:::git_current_branch()
    pkgdown:::git("checkout", "--orphan", branch)
    pkgdown:::git("rm", "-rf", "--quiet", ".")
    pkgdown:::git("commit", "--allow-empty", "-m", sprintf("Initializing %s branch", branch))
    pkgdown:::git("push", remote, paste0("HEAD:", branch))
    pkgdown:::git("checkout", old_branch)
  }

  pkgdown:::git("remote", "set-branches", remote, branch)
  pkgdown:::git("fetch", remote, branch)
  pkgdown:::github_worktree_add(dest_dir, remote, branch)
  on.exit(pkgdown:::github_worktree_remove(dest_dir), add = TRUE)
  pkg <- pkgdown::as_pkgdown(pkg, override = list(destination = dest_dir))

  # Hack to remove person authors
  pkg$topics <- head(pkg$topics, 0)
  pkg$desc$del_author("Julio")

  if (clean) {
    pkgdown:::rule("Cleaning files from old site", line = 1)
    pkgdown::clean_site(pkg)
  }

  pkgdown:::build_site(pkg, devel = FALSE, preview = FALSE, install = FALSE, new_process = FALSE)
  rmarkdown::render_site("inst/book")
  pagedown::chrome_print(
    "inst/book/tese.html",
    output = "inst/book/relatorio/tese.pdf",
    extra_args = c("--disable-gpu", "--no-sandbox")
  )
  fs::dir_copy("inst/book/relatorio", paste0(dest_dir, "/relatorio"), overwrite = TRUE)

  apresentacoes <- fs::dir_ls("inst/pres")
  fs::dir_create("inst/pres/pres")
  purrr::walk(apresentacoes, rmarkdown::render_site)
  fs::dir_copy("inst/pres/pres", paste0(dest_dir, "/pres"), overwrite = TRUE)

  if (github_pages) {
    pkgdown:::build_github_pages(pkg)
  }
  pkgdown:::github_push(dest_dir, commit_message, remote, branch)
  invisible()
}

deploy_to_branch_book(clean = TRUE, new_process = FALSE)

# shiny app ----
cat(stringr::str_glue(
  "AUTH0_KEY={Sys.getenv('AUTH0_KEY')}",
  "\nAUTH0_SECRET={Sys.getenv('AUTH0_SECRET')}",
  "\n"
), file = "inst/app/.Renviron")

# deploy app
rsconnect::setAccountInfo(
  name = 'rseis',
  token = Sys.getenv('SHINYAPPS_TOKEN'),
  secret = Sys.getenv('SHINYAPPS_SECRET')
)

rsconnect::deployApp('inst/app', appName = "decryptr")
