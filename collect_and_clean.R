rm(list = ls())
library(magrittr)
library(dplyr)

#Create the data folder
if (!file.exists('data')){
  dir.create('data')
}