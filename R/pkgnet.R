#' make a serialized collection of pkgnet reports
#' @importFrom pkgnet DependencyReporter FunctionReporter
#' @param src_folders character() collection of source package folders
#' @param target character(1)
#' @examples
#' if (interactive()) {
#'  folds = dir(system.file("demo_srcs", package="BiocBuildTools"), full.names=TRUE)
#'  tf = tempfile()
#'  make_pnet_object(folds, target=tf)
#'  x = readRDS(tf)
#'  x$parody$fun
#' }
#' @export
make_pnet_object = function(src_folders, target="pnet.rds") {
 bn = basename(src_folders)
 np = length(src_folders)
 pn = vector("list", np)
 for (i in seq_len(np)) {
  pn[[i]] = vector("list", 2)
  pn[[i]][["dep"]] = DependencyReporter$new()
  pn[[i]][["dep"]]$set_package(bn[i], src_folders[i])
  pn[[i]][["dep"]]$calculate_default_measures()
  pn[[i]][["fun"]] = FunctionReporter$new()
  pn[[i]][["fun"]]$set_package(bn[i], src_folders[i])
  pn[[i]][["fun"]]$calculate_default_measures()
  }
 names(pn) = bn
 saveRDS(pn, file=target, compress="xz")
}

