## Data Analytics with R
# Refresh: What Is A Loop?
As you being your first foray into R programming, you may find that you need to conduct repetitive tasks such as printing out the third item of ten different lists. You could begin the tedious exercise of picking out the third item in each of the ten lists by hand, but let's be honest, you have better things to. There true crime documentaries to watch on Netflix. Your favorite author just came out with a new book. You need to train your dog or cat to make an adorable face on command. Good news, R can free up this time with loops!

In a loop you can define a set of instructions that R will execute a certain number of times or over a set of variables. There are three types of loops in R: the for loop, the while loop. and the repeat loop. The for loop is the most commonly used and dynamic loop. Let's begin there!

# For Loops

The simplest implementation of a for loop is to conduct a task x number of times.

![for-loop](/images/for-loop.jpeg)

In the following code, we are printing the numbers 1 to 10:

```R{cmd}
for (i in 1:10){
  print(i)
}
```

This code will repeat ten times, as indicated by the `1:10`. The `i` stands for index. Over each iteration of the loop `i` will change. In the first loop `i` is 1. In the second `i` is 2 and so on. We are not required to start the loop at 1. Change `1:10` to `2:10` and see what happens.

We have the power to conduct more complex tasks within for loop. Let's say we need to add 2 to each interger between 1 and 3.

```R{cmd}
x = 2
for (i in 1:3){
  print(i+2)
}
```

We added 2 to all of the numbers between 1 and 3 and printed them. Simple enough, but what if we need to store variables within a for loop? No problem! In the following code we save the result of `i + 2` to the variable y.

```R{cmd}
x = 2
for (i in 1:3){
  y = i + 2
  print(y)
}
```

You may be wondering why we would want to save our result to a variable and then print it. Seems redundant, but we may need to conduct further tasks on our y variable. Let's say we want to divide y by 3 and print that result. We could write something like this:

```R{cmd}
x = 2
for (i in 1:3){
  y = i + 2
  print(y/3)
}
```

Assigning variables in loops provides us the flexibility to carry out more complicated tasks and refer to the variables created in the loop later in our code.

# While Loops

While loops are another common type of loop in R that allow us to execute tasks so long as the statement we set is true (Fig. 2). For example, in an ordered list of professional basketball players points for the season we might want to print the list of players with over 4000 points.

![while_flowdiagram](/images/while_flowdiagram.png)

```{r}
players <- c("LeBron James","Kevin Durant","Stephen Curry","James Harden","Klay Thompson")
points <- c(8023, 4878, 3966, 3637, 3032)

basketball <- data.frame(players, points)

head(basketball)

while (basketball$points >= 4000){
  print(basketball$players)
}
```

# Repeat Loops
The final type of loop we will cover in this course is a repeat loop. In a repeat loop there is no condition check placed before the loop as in a while loop. Instead a condition check is placed within the loop and a break is uitilized to escape the loop (Fig. 3).

![repeat-loop](/images/repeat-loop.jpg)

```{r}
x <- 100
repeat{
  x <- x *2
  print(x)
  if (x >= 1000)
  break
}
```
# Refresh: Functions

Functions define a set of tasks we wish to apply to
# Leveraging Loops and Functions to Analyze Data
Now that we have completed a quick review of loops and functions, we can use our new knowledge to read in several files at once and conduct some interesting analysis on our data. We have provided you with five files containing meta data information for 5 separate studies.

Let's list all of these files in our Data_Analytics_1_Lesson_Data directory in the /data directory on GitHub.

```{r}
#Please note that your path will likely be different! Make sure you point to where you downloaded this directory on your personal computer.

filenames <- list.files(path = "/Users/noellekosarek/Documents/GitHub/QBS103/data/Data_Analytics_1_Lesson_Data", pattern = ".csv")
print(filenames)
```

In the above code we are asking R to look in our specific Data_Analytics_1_Lesson_Data directory for files with a .csv extension.

I'm curious, what exactly is in these metadata files we will be working with today? We can implement a for loop to take a look at the first 5 rows of each file.

```{r}
setwd("/Users/noellekosarek/Documents/GitHub/QBS103/data/Data_Analytics_1_Lesson_Data")

for (file in filenames){
  the_file <- read.csv(file)
  print(head(the_file))
}
```

It looks like in each file we have 6 columns including participant ID, age, sex, race, socioeconomic status (SES), and disease status. This is a lot of information for us to digest. it is often advantageous to take a look at the spread of our data using summary statistics in R. Let's do this now for the variable "age" in our five files.

```{r}
setwd("/Users/noellekosarek/Documents/GitHub/QBS103/data/Data_Analytics_1_Lesson_Data")

for (file in filenames){
  the_file <- read.csv(file)
  print(summary(the_file$age))
}
```

"summary()" provides us with quite a bit of information for each file:

* Min. - the minimum of our data column
* 1st Qu. - the first quartile is the value under which 25% of data points are found when they are arranged in increasing order.
* Median - the median value of our data column
* 3rd Qu. - the third quartile is the value under which 75% of the data points are found when they are arranged in increasing order.
* Max - the maximum of our data columns

It's great to have information on our age data that we can put in a table, but we might find it useful to visualize our data with a figure. We can observe the distribution of the age information using a histogram. Let's generate a histogram for age in each of our five studies.

```{r}
setwd("/Users/noellekosarek/Documents/GitHub/QBS103/data/Data_Analytics_1_Lesson_Data")

for (file in filenames){
  the_file <- read.csv(file)
  age_var <- the_file$age
  histogram <- ggplot(the_file, aes(x=age_var)) + geom_histogram(bins = 10, fill = "darkgreen")
  plot(histogram)
}
```

We can see from this histogram that the age variable for each of sample data sets follows a roughly normal distribution. We can also visualize more than one variable using a box plot. let's look at the distribution of age by sex.

```{r}
for (file in filenames){
  the_file <- read.csv(file)
  age_var <- the_file$age
  box_plot <- ggplot(the_file, aes(x=sex, y=age, fill = sex)) +
  geom_boxplot() + scale_fill_manual(values=c("goldenrod1","darkgray"))
  plot(box_plot)
}
```

I personally would like to introduce all of you to the Harry Potter R color palette by creating bar plots for the distribution of age across the race category. Here I am implementing the "ronweasley" color scale. You can explor the use of this color palette [here](https://github.com/aljrico/harrypotter).

```{r}
for (file in filenames){
  the_file <- read.csv(file)
  age_var <- the_file$age
  box_plot <- ggplot(the_file, aes(x=race, y=age, fill = race)) +
  geom_boxplot() + scale_fill_hp_d(option = "ronweasley")
  plot(box_plot)
}
```

We have learned some really useful analytic methods here! We can generate plots as well as summary statistics, but it is quite labor intensive to write this code over and over again for different projects that will require the same analysis. In order to circumvent this and save our future selves some time, we can generate a function that carries out all these tasks. Let's have our function take a single directory containing .csv files we wish to analyze. This function will generate summary statistics for each data set along with a histogram of the age and box plots for the distribution of age by race and disease status.

```{r}
fun_stats_pretty_plots <- function(path_to_directory){
  filenames <- list.files(path = path_to_directory, pattern = ".csv")
  for (file in filenames){
    the_file <- read.csv(file)
    age_var <- the_file$age
    print(summary(age_var))
    histogram <- ggplot(the_file, aes(x=age_var)) + geom_histogram(bins = 10, fill = "darkgreen")
    box_plot_race <- ggplot(the_file, aes(x=race, y=age, fill = race)) +
    geom_boxplot() + scale_fill_hp_d(option = "ronweasley")
    box_plot_disease_status <- ggplot(the_file, aes(x=disease_status, y=age, fill = disease_status)) +
    geom_boxplot() + scale_fill_hp_d(option = "lunalovegood")

    plot(histogram)
    plot(box_plot_race)
    plot(box_plot_disease_status)
  }
}

fun_stats_pretty_plots("/Users/noellekosarek/Documents/GitHub/QBS103/data/Data_Analytics_1_Lesson_Data")
```

This is great! We can apply this function to any other directory containing the same or similar .csv files. We might have to alter the function if we are hoping to look at other variables. Other experiments could have continuous variables you are interested in visualizing such as blood cell counts or concentrations of contaminants. The possibilities are endless!
