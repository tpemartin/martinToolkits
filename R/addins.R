#' Take user to the repo in github that corresponds to the current rstudio project
#'
#' @param user
#'
#' @return
#' @export
#'
#' @examples
take_me2github <- function(user="tpemartin"){
  require(rprojroot)
  rprojroot::is_rstudio_project-> pj
  pj$make_fix_file() -> root

  require(dplyr)
  require(stringr)
  repo = {
    root() %>%
      str_extract("[^/]*$")
  }
  browseURL(
    glue::glue(
      "https://github.com/{user}/{repo}"
    )
  )

}
