################################################################################
## Project: Introduction to PLS
## Script name: Libraries.R
## Script purpose: This script loads all the required R libraries
## Date: September 2020
## Author: Joe Moss (joe.moss@york.ac.uk)
## Organisation: York Health Economics Consortium (YHEC)
################################################################################


# List of required packages ==========================================================================================================

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
