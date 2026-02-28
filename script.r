library(tidyverse)
library(rvest)
library(git2r)
library(renv)

repo_url <- "https://github.com/V2RAYCONFIGSPOOL/V2RAY_SUB"
local_path <- "repo"

if (!dir.exists(local_path)) {
  git2r::clone(url = repo_url, local_path = local_path)
} else {
  r <- git2r::repository(local_path)
  git2r::pull(r)
}

dirs <- list.files(local_path)
last_date <- dirs %>% parse_date() %>% na.omit() %>% max()
last_file <- list.files(file.path(local_path, last_date)) %>% max()

file.copy(
  file.path(local_path, last_date, last_file),
  "sadeghi.txt",
  overwrite = TRUE
)
