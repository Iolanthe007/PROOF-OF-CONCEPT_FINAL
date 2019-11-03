library(yaml)
library(testthat)

test_filename <- "incorrect-gardiner-codes.yml"

count_NumberOfRecords <- function(filename)
  {
  yamldata <- yaml.load_file(file.path("data",filename))
   NumberOfRecords <- 0
   for (sentence in yamldata$project$sentences)
   {
     for (word in sentence$words)
     {
       for (glyph in word$glyphs)
       {
         NumberOfRecords <- NumberOfRecords + 1
       }
     }
   }
   
  return(NumberOfRecords)
}

count_NumberOfRecords(test_filename)

test_that("create vector", expect_equal(count_NumberOfRecords("incorrect-gardiner-codes.yml"), 12))
