# Digital Humanities Proof of Concept

## Background:

The idea for *The Hieroglyphics Initiative* developed during the production of the 2017 Ubisoft video game *Assassin’s Creed: Origins*, set in Ptolemaic Egypt. The consulting Egyptologist for the game, Perrine Poiron, helped make the gamer experience as authentic as possible. Although development of *The Hieroglyphics Initiative* slowed between 2017 and 2018, the company spearheading the project, Psycle (in association with Ubisoft) and multi-billion dollar company Google have since collaborated to move the project forward.

By harnessing the ability of computers to learn, interpret, and process, *The Hieroglyphics Initiative* aims to  produce a tool that can improve the process of translating hieroglyphic texts. It has the potential to assist researchers in Egyptology in producing translations, but it also has the potential to become a useful pedagogical tool. By streamlining the process of capturing and processing images, as well as being able to produce facsimiles and line drawings, *The Hieroglyphics Initiative* can potentially combine both epigraphy and translation into one self-contained process.

The Proof of Concept project presented here had two aims: to develop code that would allow a user to extract the source image(s) of someone else's *Hieroglyphics Initiative* project (in the form of a YAML file), and to develop code that would allow the accuracy of the program's ability to auto-classify hieroglyphs to be calculated. This code was successfully developed and is contained within this Git repository.

## Outline of the Project:

The main goal of this project was to develop two R scripts that could help automate two very useful interactions with *The Hieroglyphics Initiative*. One was aimed at being able to effectively share image files using the common file type used to access the program with, and the other intended to actually assess the reliability and accuracy of the program's machine learning capabilities. Both scripts ran successfully and produced useful outputs.

## Navigating this Repository:

### Scripts

#### Extract-Source-Images.R:

When first interacting with *The Hieroglyphics Initiative* itself, I started by uploading someone else's project into the program (which had been sent to me in an email in the form of a YAML file). It was useful to see what someone else had been able to do with the program, but I wanted to have a go myself. I wanted to replicate their project, but starting from scratch. I realised that I could not find a way to download the original source image they had used to upload into a new project. In order to rectify this issue, I developed an R script that parses the YAML file, extracts the relevant information, decodes it from the Base64 language in which the image file is saved, and writes it to a PNG file. This can be used for extracting multiple source images, using a For Loop.

#### Compare-Gardiner-Codes.R:

As part of my thesis aim for next year is to evaluate the accuracy and usefulness of *The Hieroglyphics Initiative* as a translation tool, I needed to develop a means of analysing the programs ability to automatically classify hieroglyphs. In order to achieve this, I created a project in which I **manually** classified a selection of hieroglyphs, which I exported as a YAML file. I then created a project in which I let the program **automatically** classify the same selection of hieroglpyhs, which I then also exported as a YAML file. I then developed an R script that extracted the specific Gardiner Code identifiers (where a letter and a number represent a specific hieroglyph, such as M23, or A8), assigned them to vectors, and compared them line by line. They number of matches was then divided by the total number of items, giving the percentage of correctly auto-classified glyphs.

#### Unit-Testing-Code.R (and Unit-Testing-Code_test_file.R)

### Data

#### Extract-Source-Files.yml:

This is a simple yaml file created by starting a project in *The Hieroglyphics Initiative* Workbench and uploading two source files, with different file names. I exported it as a yaml file without adding any annotations or hieroglyphic signs.

#### Correct-Gardiner-Codes.yml:

This file was created in *The Hieroglyphics Initiative* Workbench, where I uploaded an image of a simple wall scene (one of the source images in the previous file, in fact), and made a selection of 12 hieroglyphic signs. I then manually identified each hieroglyphic sign, assigning the correct Gardiner Code to each. I then exported the project as a yaml file, ready to pass through the Compare-Gardiner-Codes.R script.

#### Incorrect-Gardiner-Codes.yml:

This file was created in *The Hieroglyphics Initiative* workbench, where I used the same source image as in Correct-Gardiner-Codes.yml and selected the exact same hieroglyphic signs in the same order and let the program automatically identify the hieroglyphic signs using its machine learning. I then exported the project in the same manner as the previous file so that its contents can be analysed against those of the Correct-Gardiner-Codes.yml file.

## Interacting with this Proof of Concept Project

In order to test my codes and see how they work and what output they produce, follow the following Code Ocean link:

https://codeocean.com/capsule/0967768/tree

*Please note that only Brian has access to this Code Ocean capsule at this point, as the capsule is currently being verified for publication.*

Once the link is opened, follow the acceptance tests within the Acceptance-Tests.xlsx file, which will guide you through the step by step process of interacting with my Code Ocean capsule, and in turn, my R scripts.

An alternative way of accessing my R Project is to download the .zip file titled *RStudio* and extract the files. Once you open the R Project titled *PROOF-OF-CONCEPT_FINAL.Rproj*, ensure the following packages are successfully downloaded: *yaml*, *base64enc*, and *testthat*. You can then run the scripts from within the *scripts* directory (accessible via the Working Directory). It is preferrable to run them in the following order: *Extract-Source-Images.R*, *Compare-Gardiner-Codes.R*, *Unit-Testing-Code.R*, *Unit-Testing-Code_test_file.R*.
