library(tidyverse)

lsquitar<-read.csv("Pres_mx_endangered_quitar.csv")
names(lsquitar)[1]<-c("scientific_names")

dirs <- list.dirs("verts")
dirs <- dirs[ grepl("/decadal", dirs) ]
dirs

listaspecies<-data.frame(
  gsub("verts/", "", dirs)%>%
  gsub("/decadal", "", .))
names(listaspecies)[1]<-c("scientific_names")
coinciden<-merge(lsquitar, listaspecies, by = "scientific_names")

Pres_mx_endangered<-read.csv("Pres_mx_endangered.csv")
names(Pres_mx_endangered)[1]<-c("scientific_names")
coinciden2<-merge(Pres_mx_endangered, listaspecies, by = "scientific_names")

Pres_mx<-read.csv("Pres_mx.csv")
names(Pres_mx)[1]<-c("scientific_names")
coinciden3<-merge(Pres_mx, listaspecies, by = "scientific_names")

Pres_mx_missing<-read.csv("Pres_mx_Missing.csv")
names(Pres_mx_missing)[1]<-c("scientific_names")
coinciden4<-merge(Pres_mx_missing, listaspecies, by = "scientific_names")
