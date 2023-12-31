% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NCA_Server.R
\name{NCA_fetch_state}
\alias{NCA_fetch_state}
\title{Fetch ruminate State}
\usage{
NCA_fetch_state(
  id,
  input,
  session,
  FM_yaml_file,
  MOD_yaml_file,
  id_ASM,
  id_UD,
  id_DW,
  react_state
)
}
\arguments{
\item{id}{Shiny module ID}

\item{input}{Shiny input variable}

\item{session}{Shiny session variable}

\item{FM_yaml_file}{App configuration file with FM as main section.}

\item{MOD_yaml_file}{Module configuration file with MC as main section.}

\item{id_ASM}{ID string for the app state management module used to save and load app states}

\item{id_UD}{ID string for the upload data module used to save and load app states}

\item{id_DW}{ID string for the data wrangling module used to save and load app states}

\item{react_state}{Variable passed to server to allow reaction outside of module (\code{NULL})}
}
\value{
list containing the current state of the app including default
values from the yaml file as well as any changes made by the user. The list
has the following structure:
\itemize{
\item{yaml:} Full contents of the supplied yaml file.
\item{MC:} Module components of the yaml file.
\item{NCA:}
\itemize{
\item{ana_cntr:}       Analysis counter.
\item{anas:}                    List of analyses: Each analysis has the following  structure:
\itemize{
\item{ana_dsview:}       Dataset view/ID (name from DSV) selected as a data source for this analysis.
\item{ana_scenario:}     Analysis scenario selected in the UI
\item{checksum:}         checksum of the analysis (used to detect changes in the analysis).
\item{code:}             Code to generate analysis from start to finish or error messages if code generation/analysis failed.
\item{code_components:}  List containing the different components from code
\item{col_conc:}         Column from ana_dsview containing the concentration data.
\item{col_dose:}         Column from ana_dsview containing the dose amount.
\item{col_dur:}          Column from ana_dsview containing the infusion duration or N/A if unused.
\item{col_group:}        Columns from ana_dsview containing other grouping variables.
\item{col_id:}           Column from ana_dsview containing the subject IDs.
\item{col_ntime:}        Column from ana_dsview containing the nominal time values
\item{col_route:}        Column from ana_dsview containing the dosing route.
\item{col_time:}         Column from ana_dsview containing the time values.
\item{id:}               Character id (\code{ana_idx}).
\item{idx:}              Numeric id (\code{1}).
\item{include_units:}    Boolean variable indicating in units should included in the analysis.
\item{interval_range:}   Vector with the first element representing he beginning of the interval
and the second element containing the end of the interval.
\item{intervals:}        List of the intervals to include.
\item{isgood:}           Current status of the analysis.
\item{key:}              Analysis key acts as a title/caption (user editable)
\item{msgs:}             Messages generated when checking configuration and analysis options.
\item{nca_config:}       List of NCA configuration options for this analysis.
\item{nca_object_name:}  Prefix for NCA objects associated with this analyis.
\item{nca_parameters:}   NCA parameters selected for calculation in the UI.
\item{notes:}            Analysis notes  (user editable)
\item{objs:}             List of names and values for objects created with generated code.
\item{sampling:}         Sampling method either "sparse" or "serial"
\item{units_amt:}        Amount units.
\item{units_conc:}       Concentration units.
\item{units_dose:}       Dosing units.
\item{units_time:}       Time units.
}
\item{current_ana:}           Currently selected analysis (list name element from anas).
\item{DSV:}                   Available data source views (see \code{\link[formods]{FM_fetch_ds}})
\item{checksum:}              This is an MD5 sum of the module (checksum of the analysis checksums).
\item{nca_config:}            List of PKNCA configuration options for this analysis.
\item{nca_parameters:}        List with two elements
\itemize{
\item{choices:}          List consisting of "Common Parameters" and
"Other" (used for grouping in the UI).
Each of these is a list of text parameter
names with a value of the PKNCA parameter
name.
\item{summary:}          Summary table with the following columns:
\itemize{
\item{parameter:}      PKNCA Paramter name.
\item{text:}           Name used in text output.
\item{md:}             Name used markdown output.
\item{latex:}          Name used in latex output.
\item{description:}    Verbose textual description of the parameter.
}
}
\item{ui:}                    Current value of form elements in the UI.
\item{ui_ana_map:}            Map between UI element names and analysis in the object you get from \code{\link{NCA_fetch_current_ana}}
\item{ui_ids:}                Vector of UI elements for the module.
\item{ui_hold:}               List of hold elements to disable updates before a full ui referesh is complete.
}
\item{MOD_TYPE:} Character data containing the type of module \code{"NCA"}
\item{id:} Character data containing the module id module in the session variable.
\item{FM_yaml_file:} App configuration file with FM as main section.
\item{MOD_yaml_file:}  Module configuration file with MC as main section.
}
}
\description{
Merges default app options with the changes made in the UI
}
\examples{
library(ruminate)
# Module IDs                                                                   
id     = "NCA"                                                                 
id_UD  = "UD"                                                                  
id_DW  = "DW"                                                                  
id_ASM = "ASM"                                                                 
# We need session and input variables to be define                             
 sess_res = NCA_test_mksession(session=list(),                                 
      id     = id,                                                             
      id_UD  = id_UD,                                                          
      id_DW  = id_DW,                                                          
      id_ASM = id_ASM,
      full_session=FALSE)
                                                                               
# Extracting the session and input variables                                   
session      = sess_res$session                                                
input        = sess_res$input                                                  
react_state  = list()                                                          
                                                                               
# We also need configuration files                                             
FM_yaml_file  = system.file(package = "formods",  "templates", "formods.yaml") 
MOD_yaml_file = system.file(package = "ruminate", "templates", "NCA.yaml")     
                                                                               
# Getting the current module state                                             
state = NCA_fetch_state(id             = id,                                   
                       input           = input,                                
                       session         = session,                              
                       FM_yaml_file    = FM_yaml_file,                         
                       MOD_yaml_file   = MOD_yaml_file,                        
                       id_ASM          = id_ASM,                               
                       id_UD           = id_UD,                                
                       id_DW           = id_DW,                                
                       react_state     = react_state)                          
                                                                               
# Pulls out the active analysis                                                
current_ana = NCA_fetch_current_ana(state)

# This will get the dataset associated with this analysis
ds = NCA_fetch_ana_ds(state, current_ana)

# After making changes you can update those in the state
state = NCA_set_current_ana(state, current_ana)

# You can use this to check the current analysis
current_ana = NCA_process_current_ana(state)

# This will pull out the code for the module
fc_res = NCA_fetch_code(state)

# This will use patterns defined for the site to detect
# columns. In this example we are detecting the id column:
id_col = NCA_find_col(
  patterns = state[["MC"]][["detect_col"]][["id"]],
  dscols   = names(ds$DS))

# This creates a new analysis
state = NCA_new_ana(state)
}
