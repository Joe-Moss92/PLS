################################################################################
## Project: Introduction to PLS
## Script name: .Rprofile
## Script purpose: This script loads the libaries required, checks the R version and welcomes the client to the model
## Date: August 2020
## Author: Joe Moss (joe.moss@york.ac.uk)
## Organisation: York Health Economics Consortium (YHEC)
################################################################################


## Check that all required libraries are installed and load them =====================================================================================

# In order to make the check work, I first had to ensure "utils" was loaded otherwise the following code is exectured before R has a chance to load 
# the libraries to use the installed.packages function

library(utils)

# Start message in the model

message("Checking the status of the required libraries\n\n")

# List of required packages

Packages <- c("tidyverse", "survival", "survminer", "doSNOW", "foreach", "knitr", "scales", "devtools", "reshape2", "plotly")
Packages_Git <- "dampack"

# Check which ones are not already installed on this machine

Require_Installing <- Packages[!Packages %in% rownames(installed.packages())]
Require_Installing_Git <- Packages_Git[!Packages_Git %in% rownames(installed.packages())]


# Create a package loader function

Package_Loader <- function(){
  
# Generate a pop up box asking if the user wants to install the required packages - Not required but not all users
# Like random packages being installed without warning first

if(length(Require_Installing) > 0){
  
  Check <- askYesNo(paste("The following ",
                length(Require_Installing),
                " packages are not installed on this machine:\n\n",
                paste(Require_Installing, collapse = " "),
           "\n\n", "Are you happy to install these packages?", sep = ""), 
         )
  
   if(Check & !is.na(Check)){ # User gives permission to install packages
  
  message("Installing and loading all required packages")
  
  suppressWarnings(suppressPackageStartupMessages(lapply(Require_Installing, install.packages, character.only = TRUE)))
  
  suppressWarnings(suppressPackageStartupMessages(lapply(Packages, library, character.only = TRUE)))
  
  message("All required packages installed and loaded")
  
  Exit <<- FALSE
  
 }
  
  else{ # User denies permission to install packages
    
    message("Required packages not installed.\n\nModel exited.\n\nPlease reload the model to install packages.")
    
    Exit <<- TRUE
    
  }
}
  
  else{ # All packages already installed, so load them
  
  message("Installing and loading all required packages")
  
  suppressWarnings(suppressPackageStartupMessages(lapply(Packages, library, character.only = TRUE)))
  
  message("\n\nAll required packages installed and loaded")
  
  Exit <<- FALSE
  
  }
  
}

Package_Loader_Git <- function(){
  
  # Generate a pop up box asking if the user wants to install the required packages - Not required but not all users
  # Like random packages being installed without warning first
  
  if(length(Require_Installing_Git) > 0){
    
    Check <- askYesNo(paste("The following ",
                            length(Require_Installing_Git),
                            " packages are not installed on this machine:\n\n",
                            paste(Require_Installing_Git, collapse = " "),
                            "\n\n", "Are you happy to install these packages from Github?", sep = ""), 
    )
    
    if(Check & !is.na(Check)){ # User gives permission to install packages
      
      message("Installing and loading all required packages")
      
      suppressWarnings(suppressPackageStartupMessages(devtools::install_github("DARTH-git/dampack")))
      
      suppressWarnings(suppressPackageStartupMessages(library("dampack")))
      
      message("All required packages installed and loaded")
      
      Exit <<- FALSE
      
    }
    
    else{ # User denies permission to install packages
      
      message("Required packages not installed.\n\nModel exited.\n\nPlease reload the model to install packages.")
      
      Exit <<- TRUE
      
    }
  }
  
  else{ # All packages already installed, so load them
    
    message("Installing and loading all required packages")
    
    suppressWarnings(suppressPackageStartupMessages(library("dampack")))
    
    message("\n\nAll required packages installed and loaded")
    
    Exit <<- FALSE
    
  }
  
}

# Run function

Package_Loader()
Package_Loader_Git()


## welcome message ====================================================================================================================================

if(!Exit){

  message("\n\nWelcome to the \"Intro to Patient Level Simulation Model\" built by York Health Economics Consortium.\n\n")
  message("This is a cost-effectiveness model design to assess \"Drug X\" for the treatment of Chronic kidney disease.\n\n")
  message("This is version 1.0 of the model.\n\n")
  message("The model was last updated on the 15th of August 2020.\n\n")
  message("The model was built using R 4.0.0 (2020-04-24).\n\n")
  message(paste("You are using ", R.Version()$version.string, ".\n\n", sep = ""))

  message("If you are using a version of R that that is not 4.0.0, We cannot guarantee the full functionality of the model.\n\n")
  
}




## Clean R ============================================================================================================================================

# Before running the model, it is a good idea to clear all previous inputs in the model
# This will prevent the model running with outdated inputs if they have been changed between runs of the model

rm(list = ls())


## Load functions =====================================================================================================================================

source("R Scripts/Functions.R")
