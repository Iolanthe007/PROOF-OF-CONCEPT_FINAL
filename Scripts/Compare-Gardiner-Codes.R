library(yaml)
options(warn=-1)
# ignores warnings

# Calculate Number of records

yamldata1 <- yaml.load_file(file.path("data","incorrect-gardiner-codes.yml"))

NumberOfRecords <- 0

for (sentence in yamldata1$project$sentences)
{
  for (word in sentence$words)
  {
    for (glyph in word$glyphs)
    {
      NumberOfRecords <- NumberOfRecords + 1
    }
  }
}
print(NumberOfRecords)

# Parse 1st file

DataVector1 <- vector("character", length = 0)

for (sentence in yamldata1$project$sentences)
{
  for (word in sentence$words)
  {
    for (glyph in word$glyphs)
    {
      DataVector1 <- c(DataVector1, glyph$gardinerCode)
    }
  }
}
print(DataVector1)

# Parse 2nd file

yamldata2 <- yaml.load_file(file.path("data","correct-gardiner-codes.yml"))
DataVector2 <-vector("character", length = 0)

for (sentence in yamldata2$project$sentences)
{
  for (word in sentence$words)
  {
    for (glyph in word$glyphs)
    {
      DataVector2 <- c(DataVector2, glyph$gardinerCode)
    }
  }
}
print(DataVector1)
print(DataVector2)

# Count exact matches for file 1 to file 2

Count <- 1
MatchCount <- 0

while (Count <= NumberOfRecords)
{
  
  if(DataVector1[Count] == DataVector2[Count])
  {
    MatchCount <- MatchCount + 1
  }
  print(DataVector1[Count])
  print(DataVector2[Count])
  print(Count)
  print(MatchCount)
  Count <- Count + 1
}

# Print functions help see what's happening as it goes

# Calculate Percentage

PercentMatch <- MatchCount/NumberOfRecords*100
print(format(PercentMatch, digits=2, nsmall=2))

# Voila