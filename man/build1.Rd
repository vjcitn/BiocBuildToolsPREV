% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/build1.R
\name{build1}
\alias{build1}
\title{prepare and build a package tarball, not exported because we use build1_with_buildsink to capture log}
\usage{
build1(srcpath, dest = ".", ...)
}
\arguments{
\item{srcpath}{character(1) path to source folder for a package}

\item{dest}{character(1) destination folder}

\item{\dots}{pass to pkgbuild::build}
}
\description{
prepare and build a package tarball, not exported because we use build1_with_buildsink to capture log
}
\note{
If preparation for building triggers a try-error, the resulting
exception object is returned.  Otherwise the result of pkgbuild::build()
is returned.
}
