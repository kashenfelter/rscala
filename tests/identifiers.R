library(rscala)

serialize <- as.logical(Sys.getenv("RSCALA_SERIALIZE"))
cat(serialize,"\n")
s <- scalaInterpreter(serialize=serialize)


s %~% "util.Properties.versionNumberString"

s$.asdf <- 3
s %~% "3+4"

tryCatch(s$adf,error = function(e) {'Caught'})

tryCatch(intpGet(s,"def"),error = function(e) {'Caught'})
s$def <- 4
s %~% "3+4"

f <- s$ def("x: Int, y: Double",'
  x+y
')
f(3,4)

x <- as.character(0:8)
set.seed(234235)
s$x <- rnorm(100)
tryCatch(s$val(x),error = function(e) {'Caught'})
identical(s$x,s$.val("x"))

s %~% "val $bob = 4"
intpGet(s,"$bob")
s$$bob
