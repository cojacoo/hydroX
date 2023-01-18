# first time use requires installation of packages
# remove # before the command to do so
#install.packages('airGRdatasets')
#install.packages('airGRteaching')

# load required packages
library(airGRdatasets)
library(airGRteaching)

Sys.setenv(TZ='UTC')

# The dataset contains exemplary data for 16 french catchments.
# You will find an overview for each basin with the following url:
#B https://webgr.inrae.fr/wp-content/uploads/fiches/A6051020_fiche.png
#C https://webgr.inrae.fr/wp-content/uploads/fiches/B2220010_fiche.png
#D https://webgr.inrae.fr/wp-content/uploads/fiches/E5400310_fiche.png
#E https://webgr.inrae.fr/wp-content/uploads/fiches/E6456510_fiche.png
#F https://webgr.inrae.fr/wp-content/uploads/fiches/H0100020_fiche.png
#G https://webgr.inrae.fr/wp-content/uploads/fiches/H1201010_fiche.png
#I https://webgr.inrae.fr/wp-content/uploads/fiches/H6221010_fiche.png
#J https://webgr.inrae.fr/wp-content/uploads/fiches/J1711710_fiche.png
#K https://webgr.inrae.fr/wp-content/uploads/fiches/J4211910_fiche.png
#L https://webgr.inrae.fr/wp-content/uploads/fiches/K1341810_fiche.png
#M https://webgr.inrae.fr/wp-content/uploads/fiches/K2654010_fiche.png
#N https://webgr.inrae.fr/wp-content/uploads/fiches/K7312610_fiche.png
#O https://webgr.inrae.fr/wp-content/uploads/fiches/V1214010_fiche.png
#P https://webgr.inrae.fr/wp-content/uploads/fiches/X0310010_fiche.png
#Q https://webgr.inrae.fr/wp-content/uploads/fiches/X0454010_fiche.png
#R https://webgr.inrae.fr/wp-content/uploads/fiches/Y6434010_fiche.png

# 1. Select two catchments from DIFFERENT hydroclimatic regions (indicated by the leading letter in the code).
#    Characterise both catchments according to their hydrological properties and compare them. You 
#    will find all information for this task on the linked overview charts. How to read them is 
#    explained here: https://webgr.inrae.fr/wp-content/uploads/2020/05/BDD_HydroClim_Fiches.pdf

# 2. Fit two different models to both catchments based on two different objective functions.
#    Remember to use a calibration and a validation period.
#    2.1 What do you observe about the characteristics of the respective models in comparison to
#    observed dynamics? a) What characteristics are well/not well represented? b) What parameters 
#    are most sensitive (influential) to the system? 
#    2.2 What do you observe about the model parameters in comparison between the two catchments? 
#    a) Which processes dominate in each catchment and how does this affect the parameters? b) What
#    are the dominating stores? c) What can we learn about the catchment from these model parameters/
#    model structures?

# To answer the second task load the data of all provided catchments and start the airGR Shiny app
# I have prepared all needed code for you until Line 130. Just run these and head over to the Shiny
# app in your browser for fulfilling the task. (select L50..130 and hit cmd+Enter)

# Load data of available basins
data("A605102001", package = "airGRdatasets")
dA6 <- A605102001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mA6 <- A605102001$Meta

data("B222001001", package = "airGRdatasets")
dB2 <- B222001001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mB2 <- B222001001$Meta

data("E540031001", package = "airGRdatasets")
dE5 <- E540031001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mE5 <- E540031001$Meta

data("E645651001", package = "airGRdatasets")
dE6 <- E645651001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mE6 <- E645651001$Meta

data("H010002001", package = "airGRdatasets")
dH0 <- H010002001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mH0 <- H010002001$Meta

data("H120101001", package = "airGRdatasets")
dH1 <- H120101001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mH1 <- H120101001$Meta

data("H622101001", package = "airGRdatasets")
dH6 <- H622101001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mH6 <- H622101001$Meta

data("J171171001", package = "airGRdatasets")
dJ1 <- J171171001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mJ1 <- J171171001$Meta

data("J421191001", package = "airGRdatasets")
dJ4 <- J421191001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mJ4 <- J421191001$Meta

data("K134181001", package = "airGRdatasets")
dK1 <- K134181001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mK1 <- K134181001$Meta

data("K265401001", package = "airGRdatasets")
dK2 <- K265401001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mK2 <- K265401001$Meta

data("K731261001", package = "airGRdatasets")
dK7 <- K731261001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mK7 <- K731261001$Meta

data("V121401001", package = "airGRdatasets")
dV1 <- V121401001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mV1 <- V121401001$Meta

data("X031001001", package = "airGRdatasets")
dX0 <- X031001001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mX0 <- X031001001$Meta

data("X045401001", package = "airGRdatasets")
dX1 <- X045401001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mX1 <- X045401001$Meta

data("Y643401001", package = "airGRdatasets")
dY6 <- Y643401001$TS[0001:7305, c("Date", "Ptot", "Evap", "Qmmd", "Temp")]
mY6 <- Y643401001$Meta

# Start the airGR shiny app
ShinyGR(ObsDF = list("B" = dA6, "C" = dB2, "D" = dE5, "E" = dE6,
                     "F" = dH0, "G" = dH1, "I" = dH6, "J" = dJ1,
                     "K" = dJ4, "L" = dK1, "M" = dK2, "N" = dK7,
                     "O" = dV1, "P" = dX0, "Q" = dX1, "R" = dY6),
        ZInputs = list(median(mA6$HypsoData), median(mB2$HypsoData), median(mE5$HypsoData), median(mE6$HypsoData),
                       median(mH0$HypsoData), median(mH1$HypsoData), median(mH6$HypsoData), median(mJ1$HypsoData),
                       median(mJ4$HypsoData), median(mK1$HypsoData), median(mK2$HypsoData), median(mK7$HypsoData),
                       median(mV1$HypsoData), median(mX0$HypsoData), median(mX1$HypsoData), median(mY6$HypsoData)),
        HypsoData = list(mA6$HypsoData, mB2$HypsoData, mE5$HypsoData, mE6$HypsoData,
                         mH0$HypsoData, mH1$HypsoData, mH6$HypsoData, mJ1$HypsoData,
                         mJ4$HypsoData, mK1$HypsoData, mK2$HypsoData, mK7$HypsoData,
                         mV1$HypsoData, mX0$HypsoData, mX1$HypsoData, mY6$HypsoData),
        NLayers = 5,
        SimPer = c("1999-01-01", "2018-12-31"),
        theme = "United")

# Prepare a small report (3-5 pages) about this assessment. Use the plots from the Shiny app for
# illustration. Cite the data properly as https://doi.org/10.15454/UV01P1. Groups of 2 are ok. 
# If you like to work in groups of 3, please do the assessment with 3 catchments.
# This assessment has to be submitted BEFORE your exams as pdf file with the title "hy23_#ID1#_#ID2#.pdf".
# Please replace #IDx# with your student number.

# If in any case the Shiny app keeps hanging with a specific selection: Mostly, waiting is sufficient. 
# Otherwise, restart the app in R (hit the stop button and call the last command again) and take a different
# selection.

