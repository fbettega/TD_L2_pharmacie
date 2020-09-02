
Hydroxychloroquine <- read.table("data/chloroquin_data_set.txt",sep=" ",header = TRUE,fileEncoding = "utf8")
data_set_pharma <- function(df,path){
  write.csv(df,paste0("data_set_cc/",path,".csv"), row.names = FALSE)
  xlsx::write.xlsx(df,paste0("data_set_cc/",path,".xlsx"), row.names = FALSE)
}


# Question 1 
Hydroxychloroquine <- read.table("chloroquin/chloroquin_data_set.txt",sep=" ",header = TRUE,fileEncoding = "utf8")
data_set_pharma <- function(df,path){
  write.csv(df,paste0("data_set_cc/",path,".csv"), row.names = FALSE)
  xlsx::write.xlsx(df,paste0("data_set_cc/",path,".xlsx"), row.names = FALSE)
}

data_set_pharma(data.frame(age = Hydroxychloroquine$Age.years.),"question_1")


# Question 2 
data_set_pharma(data.frame(hydroxychloroquine = Hydroxychloroquine$Hydroxychloroquine.treatment,age = Hydroxychloroquine$Age.years.),"question_2")

# Question 3 
Question_3_df <- Hydroxychloroquine[Hydroxychloroquine$Hydroxychloroquine.serum.concentration.µg.ml !="-",]
data_set_pharma(data.frame(hydroxychloroquine_Q3 = Question_3_df$Hydroxychloroquine.treatment,azytro = Question_3_df$Azithromycin.treatment),"question_3")



# Question 4 
Donnee_reproduction <- Hydroxychloroquine

# Q 4 1
# transformation des PCR non effectué en résultat positif groupe controle
Donnee_reproduction$PCR <- gsub("\\d+", "POS", Donnee_reproduction$D6)
Donnee_reproduction$PCR[Donnee_reproduction$D6=="ND" & Donnee_reproduction$Hydroxychloroquine.treatment =="No"] <- "POS"

# transformation des PCR non effectué en résultat positif groupe traitement
Donnee_reproduction$PCR[Donnee_reproduction$D6=="ND" & Donnee_reproduction$Hydroxychloroquine.treatment =="Yes"] <- "NEG"
Donnee_reproduction$PCR <- as.factor(Donnee_reproduction$PCR )
data_set_pharma(data.frame(PCR_1 = Donnee_reproduction$PCR, hydroxychloroquine_1 = Donnee_reproduction$Hydroxychloroquine.treatment),"question_4_1")

#Q 4 2 

Donnee_test <- Hydroxychloroquine[Hydroxychloroquine$D6 !="ND",] 

# transformation des PCR non effectué en résultat positif groupe controle
Donnee_test$PCR <- gsub("\\d+", "POS", Donnee_test$D6)

Donnee_test$PCR <- as.factor(Donnee_test$PCR )
data_set_pharma(data.frame(PCR_2 = Donnee_test$PCR, hydroxychloroquine_2 = Donnee_test$Hydroxychloroquine.treatment),"question_4_2")

library(Rcompression)
files <- list.files("data_set_cc/", recursive=TRUE)
zip::zipr("data_set_cc.zip",files = c("data_set_cc"),recurse = TRUE)

