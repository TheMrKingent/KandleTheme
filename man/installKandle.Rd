% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities.R
\name{installKandle}
\alias{installKandle}
\title{Install Kandle theme}
\usage{
`installKandle(applyTheme = T, ...)`
}
\arguments{
\item{applyTheme}{Either \code{TRUE} or \code{FALSE} to immediately apply the theme.}

\item{...}{other parameters to \code{rstudioapi::addTheme()}.}
}
\description{
Installs Kandle R Studio theme. Technically, in order to toggle on and off
the plot area transparency on mouse hovering, two themes are actually installed,
see \code{?KandleTheme::togglePlotTransparency} for details.
}
