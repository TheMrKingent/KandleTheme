
#' Install Kandle theme
#'
#' Installs Kandle R Studio theme. Technically, in order to toggle on and off
#' the plot area transparency on mouse hovering, two themes are actually installed,
#' see `?KandleTheme::togglePlotTransparency` for details.
#' 
#' @param applyTheme Either `TRUE` or `FALSE` to immediately apply the theme.
#' @param ... other parameters to `rstudioapi::addTheme()`.
#' @usage `installKandle(applyTheme = T, ...)`
#' 
#' @export
installKandle <- function(applyTheme = T, ...) {
  
  path <- .libPaths()[1]
  try(rstudioapi::addTheme(paste(path, "/KandleTheme/themes/Kandle.rstheme", sep=''),  ...))
  try(rstudioapi::addTheme(paste(path, "/KandleTheme/themes/KandleDarkerPlot.rstheme", sep=''), ...))
  print('Kandle theme installed')
  
  if (applyTheme) {
    rstudioapi::applyTheme("Kandle")
  }
  
}



#' Toggle plot transparency
#'
#' Toggles on and off plot area transparency on mouse hovering for the Kandle theme.
#' It is obtained by simply switching between two themes, one in which this is allowed,
#' one in which this is not. 
#' 
#' If Kandle theme is currently not being used, it will automatically switch to it.
#'
#' @export
togglePlotTransparency <- function() {
  
  if (sum(tolower(c('Kandle', 'KandleDarkerPlot')) %in% names(rstudioapi::getThemes())) != 2) {
    stop('Kandle theme must be installed first, run `KandleTheme::installKandle()`')
  }
  
  if (rstudioapi::getThemeInfo()$editor == "Kandle") {
    rstudioapi::applyTheme("KandleDarkerPlot")
    print('Plot transparency on')
  }
  
  else if (rstudioapi::getThemeInfo()$editor == "KandleDarkerPlot") {
    rstudioapi::applyTheme("Kandle")
    print('Plot transparency off')
  }
  
  else {
    print('Currently not using Kandle, switching to Kandle anyway')
    rstudioapi::applyTheme("Kandle")
  }
  
}
