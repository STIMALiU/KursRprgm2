
context("leap_year()")

test_that("leap_year()", {
  
  test_object_name<-function(target,true_names=NULL){
    if(is.function(target)){
      temp_name<-names(formals(target))
    }else if(is.list(target)){
      temp_name<-names(target)
    }else{
      stop("target has non valid class!")
    }
    
    if(is.null(true_names)){
      if(is.null(temp_name)){
        return(TRUE)
      }else{
        return(FALSE)
      }
    }else if(is.character(true_names)&length(true_names)>=1){
      no_names<-length(true_names)
      no_match<-vector("logical",no_names)
      if(length(temp_name)!=length(true_names)){
        return(FALSE)
      }
      for(i in 1:no_names){
        no_match[i]<-any(temp_name%in%true_names[i])
      }
      return(all(no_match))
    }else{
      stop("true_names has non valid class!") 
    } 
  }
  
  
  test_years <- c("1800","1900","2000", "1856", "1236", "1999", "12")
  test_years_leap <-c(FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE)
  
  test_years2 <- c("1","1800","4","400","100")
  test_years_leap2 <-c(FALSE,FALSE,TRUE,TRUE,FALSE)
  
  expect_true(exists("leap_year"),
              info = "Fel: leap_year() saknas.")
  expect_true(is.function(leap_year), 
              info = "Fel: leap_year är inte en funktion.")
  expect_function_self_contained(object = leap_year,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(object = leap_year, expected = c("years"),
  info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_silent(leap_year)
  
  # expect_true(test_object_name(target = leap_year,true_names = c("years")),
  #             info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_true(is.data.frame(leap_year(years=test_years)), 
              info="Fel: Funktionen leap_year() returnerar inte en data.frame")
  expect_true(all(dim(leap_year(years=test_years))==c(length(test_years),2)), 
             info="Fel: Funktionen leap_year() returnerar fel dimensioner (kolumner och/eller rader)")
  
  temp_df<-leap_year(years=test_years)
  expect_true(test_object_name(target = temp_df,true_names = c("years","leap_year")),
              info = "Fel: Data.frame har felaktiga namn")
  

  expect_true(is.numeric(leap_year(years=test_years)[,"years"]),
              info="Fel: Variabeln years är ej numerisk.")
  expect_true(is.logical(leap_year(years=test_years)[,"leap_year"]),
              info="Fel: Variabeln leap_year är ej logisk")
  
  # testa olika fall:
  # test_years
  expect_equal(leap_year(years=test_years)["years"], 
               data.frame(years=as.numeric(test_years)), 
              info="Fel: Variabeln years är felaktig (ej numerisk).")
  
  expect_equal(leap_year(years=test_years)["leap_year"], 
              data.frame(leap_year=test_years_leap), 
              info="Fel: Variabeln leap_years är felaktig.")
  # testa olika fall:
  # test_years2
  expect_equal(leap_year(years=test_years2)["years"], 
               data.frame(years=as.numeric(test_years2)), 
               info="Fel: Variabeln years är felaktig (ej numerisk).")
  
  expect_equal(leap_year(years=test_years2)["leap_year"], 
               data.frame(leap_year=test_years_leap2), 
               info="Fel: Variabeln leap_years är felaktig.")
  
  
  expect_function_code(object = leap_year, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})
  