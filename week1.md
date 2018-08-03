### Objects

Atomic classes of objects:
* character
* numberic
* integer
* complex
* logical

The most basic object is a vector. All elements of a vector must be the same class.

Lists are vectors where each element can be anything.

#### Numbers

Inf is a special number. 1/0 yield Inf.

### Misc

attributes(obj) returns an attribute.
Don't know the answer? help() is great in RStudio.

#### Vectors

R will create a least common denominator vector when you coerce types.

#### Factors

x <- factor(c("yes", "yes", "no", "no"))

You can also pass in a levels argument to the factor function, in that case the levels will be no, yes

#### Missing Values

is.na()
is.nan()
NA values can have a class
NAN is NA but NA is not necessarily NAN

#### Data Frames

Used to store tabular data

A list where every element of the list has to have the same length.

row.names => special attribute on data frames

Created via read.table() or read.csv()

There are complementing write. functions

The read.csv() is calling read.table() with the sep already set as a comma. There are specifics you can set when reading in table.

The most interesting one is stringsAsFactors - which is true by default, reading in strings as factors.

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))

readLines reads the lines of a text file

source reads the file into R

#### Textual Data Formates

dumping & dputing <- These are text formats. So they're more editable and potentially recoverable. So your dataframe will be dumped with file names. There's metadata. Not very space efficient.

dput(data, "filename.R") Outputs

dump does this but takes a character vectors with the names of the objects you want to store. Wherein dput just takes an R object.

### Interfacing With The Outisde World

file()
gzfile()
bzfile()
url()

These also take other options, i.e. file you can set read, write, append

#### Subsetting Data

* [ returns an object of the same class as the original, can be used to select more than one element
* [[ extracts a single element of a list
* $ can extract the object by name. Similar to [[

You can do some cool stuff though i.e.

x < c("a", "b", "c", "d")
x[2]
"b"
x[ x > "a"]
"b", "c", "d"

Calling an operation on a vector calls it for all elements

x <- list(foo = 1:4, bar = 5:8)

name <- "foo"

x[[name]]

You can also go x, y with [[]][[]]

Matrices subsetted with [4,] for 4th row of the matrix