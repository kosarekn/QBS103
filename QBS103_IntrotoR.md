# Introduction to R
## Learning Objectives

* Download and install R (version 3 or higher)
* Download and install R Studio (version 1.3 or higher)
* Run basic commands in R Console
* Run basic commands in R Studio
* Declare variables in R
* Input data in to R
* Output data from R
* Write a simple R script

## Materials

* R version 3.0 or higher https://cran.rstudio.com/
* R Studio 1.3 or higher https://rstudio.com/products/rstudio/download/#download
* Sample Data http://swcarpentry.github.io/r-novice-inflammation/setup.html
  - Follow the instructions on the link to download and unzip the data to your desktop.
  - Be sure to either move the data according to the instructions, or make a note of where the data is located.

## R Programming
R is a free, open source programming language and statistical software environment, first released in 1993, that is used extensively in bioinformatics. Beyond the basic functionality included in R's standard distribution, an enormous number of packages designed to extend R's functionality for specific applications exist, representing one of R's core strengths.

R is also a very powerful way to create high quality graphics, using both functionality in base R as well as graphics specific packages, such as ggplot2. These packages provide a high level of user control, meaning almost all plotting features can be controlled. Importantly, numerous R packages provide functionality for generating bioinformatics specific visualizations.

### Installing R
We will be using R-Studio to explore our example data. The latest versions for R and R-Studio can be found [here](https://www.r-project.org/) and [here](https://posit.co/download/rstudio-desktop/).

Confirm R and R Studio are installed by double clicking the R Studio icon. This icon may be on your Desktop or in your Applications folder. In the Console window copy the following:

``` R{cmd}
R.Version()
# The "#" hashtag indicates a comment and means that the R interpreter will ignore this line.
```
In the above code block we added a comment. Comments are VERY important when programming to add details about our code or even information about data we are pulling from outside sources. This is useful if we are revisiting a program we wrote months ago or sharing code with a friend.

Now, back to R Studio itself. You may be wondering why do we need R Studio if we already have R installed? RStudio is an IDE (Integrated Development Environment). An IDE is software built to consolidate different aspects of writing, executing, and evaluating computer code. Without an IDE, these aspects of programming would need to be performed in different applications, potentially reducing productivity.

Basic features of the RStudio IDE include:

* console for submitting code to
* syntax-highlighting editor used for writing R-scripts
* windows for environment management, data visualization, and debugging
* facilities for version control & project management

![r_studio_example]("/images/r-studio-example.png")

### R as a Functional Programming Language

R is generally considered a functional programming language. Without going into detail, this essentially means that the way in which R performs tasks and solves problems is centered around functions.

Functions are specific pieces of code that take a defined input, perform an operation or series of operations on the input, and return an output, again in a defined format.

One of the simplest functions is the `print` function. `print` will print the argument(s) provided to it as input to the R console as outputs. In the below code chunk, the input "Hello" is being provided to the print() function as input to its first argument.

``` R {cmd}
print("Hello")
```
Manual/help pages for a specific function can be obtained using ?. To bring up the manual page for the print() function:

``` R {cmd}
?print()
```
