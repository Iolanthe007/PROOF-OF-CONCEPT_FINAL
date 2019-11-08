library(yaml)
library(base64enc)

options(warn=-1)

all_yaml_files <- dir(path="data", pattern=".yml", full.names = TRUE)

for (this_yaml_file in all_yaml_files)
{
  yamldata <- yaml.load_file(this_yaml_file)
  for (source in yamldata$files$sources)
  {
    imageData <- (source$dataURL)
    imagesource <- gsub("^data.*base64, *", "", imageData)
    decodedimagesource <- base64decode(imagesource)
    writeBin(decodedimagesource, file.path("output_data", paste(source$title,".png")))
  }
}