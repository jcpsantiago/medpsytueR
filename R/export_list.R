#' Export a list of data frames
#'
#' @param list a list of data frames.
#' @param folder the path to destination.
#' @param format the format in which to save the data. Currently only "rds"
#'     (Default) and "csv" are available.
#'
#' @return RDS or CSV files for each data frame in the list.
#' @export
#'
export_list <- function(list, folder = NULL, format = "rds") {
  if (!(is.list(list))) {
    stop(paste(list, " is not a list, and I cannot export it"))
  }

  if (is.null(folder)) {
    stop("Please provide a path to where you want to export the list")
  }

  if (!(format %in% c("rds", "cvs"))) {
    stop(paste(format, "is not a valid format, or not yet implemented"))
  }

  switch(
    format,
    rds = purrr::imap(
      list,
      ~ readr::write_rds(.x, path = paste0(folder, .y, ".rds"))
    ),
    csv = purrr::imap(
      list,
      ~ readr::write_csv(.x, path = paste0(folder, .y, ".csv"))
    )
  )
}