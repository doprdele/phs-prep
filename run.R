# obtain port argument (if given) bump
args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  port <- "12000"
} else if (length(args) == 1) {
  port <- args[1]
}

print(paste("Listening on port", port))
dir.create("/app/tmp")
rmarkdown::run(dir=getwd(),
	       render_args = list(output_dir="/app/tmp",
			          intermediates_dir="/app/tmp/intermediates",
				  clean=FALSE,
				  quiet=TRUE
			     ),
               shiny_args = list(host = "127.0.0.1",
                                 port = as.numeric(port)))
