# This is a sample R code that will serve as an example for some useful syntax
# This is intended to be used after the first class

# First of all, a line of code that starts with a # is a comment, which means that the computer does not look for syntax within the line, it just moves to the next line.
print("not all text is a comment, this syntax can be used to print text or variables to the console")

# Also, it is sometimes useful to skip lines to set off sections of code.  This is perfectly permissible.

# Ok, let's get to the coding.  Computers excel over humans in one key area: repetition.  Computers can repeat a task 
# without getting tired (well, they do heat up and can run out of memory, but this is not exactly the same as tired).  
# Furthermore, computers can carry out computations with a specific precision.  Let's look at an example:

# Before we start, we have to let the computer know how much memory a task will require; this is called pre-allocation 
# and it generally speeds up the whole process.  Some computer languages don't require pre-allocation, but it is 
# always a benefit.  Remember how I said that computers do a great job at repetition?  If you don't, it's on line 8
# (also, this is why lines are numbered).  They are even good at repeating repitition.  This is why our first step is 
# not to preallocate the memory but to set a variable that shows how large of a preallocation we will use.  This is 
# how you store a variable:
len <- 10
# the variable len is short for length.  I didn't use length as that is a command in and of itself and I don't want 
# the computer or me to get confused; some computer languages will permit this to be done, but why risk it.  You may 
# also notice that a varible does not have to be a single letter.  You can name your variable lots of different 
# things.  The use of short but descriptive variables helps later when you are deep in your code but don't recall what 
# you called something.  Now, for the preallocation:
x <- array(-9999, dim = c(len,2))
# the array command sets up an array (similar to a matrix with rows and columns) with the inital values given by the 
# arguement, in this case -9999, and the dimensions, given by the variable dim.  In this syntax, we state in the 
# arguement of the command that dim equals something.  The syntax c(len,2) provides concatenated vector, [len, 2].  
# This is the size of the preallocation.

# The next useful process is indeces.  When a process is repeated over and over, it is useful to keep track of the 
# process and store the results in an order that makes sense.

# Here's our example problem.  We're going to add one to the previous number in a series ten times (well, len-times).  
# This is how we're going to do it: set up our starting point, then have the computer LOOP ten times the process of 
# adding one.  To keep track, we will use the index, i.  We will start with the number eleven.
x[1,1] <- 1 # this is the first value in the list and the first column will provide that index.  This is not needed 
# as the indeces themselves will provide that ordinality; however, it is provided here as an example of what can be 
# stored in variable spaces.
x[1,2] <- 11 # this is the first value.

for (i in 2:len) {
      # You might wonder why we're starting at 2.  Well, it's because we already know what our initial condition is; 
      # it is 11.
      x[i,1] <- i # this stores the index
      x[i,2] <- x[(i-1),2] + 1 # this is the actual computation
}
# and that's it!  You can run line-by-line by putting your cursor on the line and clicking run or by running the 
# entire code by clicking source.

# One more thing: you should use lots of comments in your code so that you always know what you're thinking.  Also, 
# use GIT so that you can keep track of any changes you made.

# After you run your code, you can double-click on x in the environment and see the table you made.  You can also 
# plot your results, but that will be done in another code.