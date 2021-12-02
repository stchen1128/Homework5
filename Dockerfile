FROM rocker/tidyverse

# install R packages like this
RUN Rscript -e "install.packages('readr')"
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('data.table')"
RUN Rscript -e "install.packages('reshape2')"
RUN Rscript -e "install.packages('lubridate')"
RUN Rscript -e "install.packages('ggthemes')"
RUN Rscript -e "install.packages('scales')"
RUN Rscript -e "install.packages('here')"

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/R/*.R


# set an environment variable
ENV which_dataset="movies"

WORKDIR /project
# make container entry point bash
CMD make report







