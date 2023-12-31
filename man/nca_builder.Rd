% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NCA_Server.R
\name{nca_builder}
\alias{nca_builder}
\title{Builds NCA Code from ui Elements}
\usage{
nca_builder(state)
}
\arguments{
\item{state}{NCA state from \code{NCA_fetch_state()}
JMH update the return list below}
}
\value{
NCA state with the NCA for the current analysis built.
}
\description{
Takes the current analysis in the state object and creates the
code to run the analysis
}
\examples{
# Module IDs
id     = "NCA"
id_UD  = "UD"
id_DW  = "DW"
id_ASM = "ASM"

# We need a module variables to be defined
sess_res = NCA_test_mksession(session=list(),
     id     = id,
     id_UD  = id_UD,
     id_DW  = id_DW,
     id_ASM = id_ASM,
     full_session=FALSE)

state = sess_res$state

state = nca_builder(state)
}
