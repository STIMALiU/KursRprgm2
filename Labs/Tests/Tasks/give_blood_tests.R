### Assignment : giveBlood() ###
# rm(list=ls())
# library(testthat)
# 
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D6/lab6_grupp11.R",encoding="latin1")
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_6.R",encoding="latin1")

context("give_blood()")



test_that("Assignment: give_blood()", {
  error_info <- function(parameters, funcName){
    index<-sapply(X=parameters,FUN=is.null)
    parameters[index]<-"NULL"
    parameters<-lapply(X=parameters,FUN=as.character)
    x<-paste("Problem with ",funcName,"() when called with: ",paste(paste(names(parameters),"=",parameters[names(parameters)],sep=""),collapse="  "),sep="")
    return(x)
  }
  # set locale:
  #Sys.setlocale("LC_TIME", "C")
  
  # test_object_name<-function(target,true_names=NULL){
  #   if(is.function(target)){
  #     temp_name<-names(formals(target))
  #   }else if(is.list(target)){
  #     temp_name<-names(target)
  #   }else{
  #     stop("target has non valid class!")
  #   }
  #   
  #   if(is.null(true_names)){
  #     if(is.null(temp_name)){
  #       return(TRUE)
  #     }else{
  #       return(FALSE)
  #     }
  #   }else if(is.character(true_names)&length(true_names)>=1){
  #     no_names<-length(true_names)
  #     no_match<-vector("logical",no_names)
  #     if(length(temp_name)!=length(true_names)){
  #       return(FALSE)
  #     }
  #     for(i in 1:no_names){
  #       no_match[i]<-any(temp_name%in%true_names[i])
  #     }
  #     return(all(no_match))
  #   }else{
  #     stop("true_names has non valid class!") 
  #   } 
  # }
  
  # Create test suite
  library(lubridate)
  test_list <- list(
    list(lasttime = ymd("2014-02-24"),
         holiday = "hemma",
         sex = "f",
         type_of_travel = NULL),
    list(lasttime = ymd("2014-02-24"),
         holiday = "hemma",
         sex = "m",
         type_of_travel = NULL),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-03-23"), ymd("2014-04-24")),
         sex = "f",
         type_of_travel = "malaria"),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-03-23"), ymd("2014-04-24")),
         sex = "m",
         type_of_travel = "malaria"),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-04-13"), ymd("2014-05-23")),
         sex = "f",
         type_of_travel = "other"),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-04-13"), ymd("2014-05-23")),
         sex = "m",
         type_of_travel = "other")
  )
  
  test_results_eng <- c("year=2014 month=Jun day=24 weekday=Tuesday",
                    "year=2014 month=May day=26 weekday=Monday",
                    "year=2014 month=Oct day=27 weekday=Monday",
                    "year=2014 month=Oct day=27 weekday=Monday",
                    "year=2014 month=Jun day=24 weekday=Tuesday",
                    "year=2014 month=Jun day=23 weekday=Monday")
  test_results_swe <- c("year=2014 month=jun day=24 weekday=Tisdag",
                    "year=2014 month=maj day=26 weekday=Måndag",
                    "year=2014 month=okt day=27 weekday=Måndag",
                    "year=2014 month=okt day=27 weekday=Måndag",
                    "year=2014 month=jun day=24 weekday=Tisdag",
                    "year=2014 month=jun day=23 weekday=Måndag")
# test_results_swe <- c("year=2014 month=Jun day=24 weekday=Tisdag",
#                        "year=2014 month=May day=26 weekday=Måndag",
#                        "year=2014 month=Oct day=27 weekday=Måndag",
#                         "year=2014 month=Oct day=27 weekday=Måndag",
#                         "year=2014 month=Jun day=24 weekday=Tisdag",
#                         "year=2014 month=Jun day=23 weekday=Måndag")
      
  # General:
  expect_true(exists("give_blood"),
              info = "Fel: give_blood() saknas.")
  expect_true(is.function(give_blood),
              info = "Fel: give_blood ska vara en funktion.")
  expect_function_self_contained(object = give_blood,
                        "Fel: Funktionen har fria variabler")
  
  
  #expect_true(test_object_name(target = give_blood,true_names = c("lasttime","holiday","sex","type_of_travel")),
  #            info = "Fel: Argumenten har felaktiga namn.")
  
  expect_function_arguments(object = give_blood,expected = c("lasttime","holiday","sex","type_of_travel"),
                            info = "Fel: Argumenten har felaktiga namn.")
  
  expect_true(is.character(do.call(what=give_blood,args=test_list[[1]])),
              info = "Fel: Funktionen returnerar inte en text-vektor")
  expect_function_code(object = give_blood, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")
  
  expect_true(tolower(do.call(give_blood, test_list[[1]])) == tolower(test_results_swe[1]) | 
                tolower(do.call(give_blood, test_list[[1]])) == tolower(test_results_eng[1]),
              info = error_info(parameters=test_list[[1]],funcName="give_blood"))
  
  expect_true(tolower(do.call(give_blood, test_list[[2]])) == tolower(test_results_swe[2]) | 
                tolower(do.call(give_blood, test_list[[2]])) == tolower(test_results_eng[2]),
              info = error_info(parameters=test_list[[2]],funcName="give_blood"))
  
  expect_true(tolower(do.call(give_blood, test_list[[3]])) == tolower(test_results_swe[3]) | 
                tolower(do.call(give_blood, test_list[[3]])) == tolower(test_results_eng[3]),
              info = error_info(parameters=test_list[[3]],funcName="give_blood"))
  
  expect_true(tolower(do.call(give_blood, test_list[[4]])) == tolower(test_results_swe[4]) | 
                tolower(do.call(give_blood, test_list[[4]])) == tolower(test_results_eng[4]),
              info = error_info(parameters=test_list[[4]],funcName="give_blood"))
  
  expect_true(tolower(do.call(give_blood, test_list[[5]])) == tolower(test_results_swe[5]) | 
                tolower(do.call(give_blood, test_list[[5]])) == tolower(test_results_eng[5]),
              info = error_info(parameters=test_list[[5]],funcName="give_blood"))
  
  expect_true(tolower(do.call(give_blood, test_list[[6]])) == tolower(test_results_swe[6]) | 
                tolower(do.call(give_blood, test_list[[6]])) == tolower(test_results_eng[6]),
              info = error_info(parameters=test_list[[6]],funcName="give_blood"))
  
  expect_silent(object = do.call(give_blood, test_list[[1]]))
  
  # testfall: i <-1
  # for(i in seq_along(test_list)){ 
  #   expect_true(tolower(do.call(give_blood, test_list[[i]])) == tolower(test_results_swe[i]) | tolower(do.call(give_blood, test_list[[i]])) == tolower(test_results_eng[i]),
  #               info = error_info(parameters=test_list[[i]],funcName="give_blood"))
  # } 
})
