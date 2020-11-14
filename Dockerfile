FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

LABEL "com.github.actions.name"="docx to md generator"
LABEL "com.github.actions.description"="Create mds files from docx."

RUN apt-get update
RUN ln -fs /usr/share/zoneinfo/Europe/Oslo /etc/localtime
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get -y install apt-utils pandoc git
#RUN apt-get -y install texlive-latex-base
#RUN apt-get -y install texlive-fonts-recommended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
