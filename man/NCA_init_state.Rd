% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NCA_Server.R
\name{NCA_init_state}
\alias{NCA_init_state}
\title{Initialize NCA Module State}
\usage{
NCA_init_state(FM_yaml_file, MOD_yaml_file, id, id_UD, id_DW, session)
}
\arguments{
\item{FM_yaml_file}{App configuration file with FM as main section.}

\item{MOD_yaml_file}{Module configuration file with MC as main section.}

\item{id}{ID string for the module.}

\item{id_UD}{ID string for the upload data module used to handle uploads or the name of the list element in react_state where the data set is stored.}

\item{id_DW}{ID string for the data wrangling module to process any uploaded data}

\item{session}{Shiny session variable (in app) or a list (outside of app)}
}
\value{
list containing an empty NCA state
}
\description{
Creates a list of the initialized module state
}
