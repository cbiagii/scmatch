################## BASE IMAGE ######################
FROM python:2


################## METADATA ######################
LABEL base.image="python:2"
LABEL version="1"
LABEL software="scMatch"
LABEL software.version="1.0"
LABEL about.summary="scMatch: a single-cell gene expression profile annotation tool using reference datasets"
LABEL about.home="https://github.com/asrhou/scMatch"
LABEL about.documentation="https://github.com/asrhou/scMatch"
LABEL license="https://github.com/asrhou/scMatch/blob/master/LICENSE"
LABEL about.tags="Genomics"


################## MAINTAINER ######################
MAINTAINER Carlos Biagi Jr <biagi@usp.br>


################## INSTALLATION ######################
RUN apt-get update && apt-get install -y \
	vim \
	apt-utils

RUN pip install pandas scipy openpyxl xlrd sklearn umap-learn plotly seaborn

RUN git clone https://github.com/asrhou/scMatch.git /opt/scMatch

RUN unzip /opt/scMatch/refDB/FANTOM5/10090_HID.csv.zip -d /opt/scMatch/refDB/FANTOM5/ && rm /opt/scMatch/refDB/FANTOM5/10090_HID.csv.zip
RUN unzip /opt/scMatch/refDB/FANTOM5/10090_symbol.csv.zip -d /opt/scMatch/refDB/FANTOM5/ && rm /opt/scMatch/refDB/FANTOM5/10090_symbol.csv.zip
RUN unzip /opt/scMatch/refDB/FANTOM5/9606_HID.csv.zip -d /opt/scMatch/refDB/FANTOM5/ && rm /opt/scMatch/refDB/FANTOM5/9606_HID.csv.zip
RUN unzip /opt/scMatch/refDB/FANTOM5/9606_symbol.csv.zip -d /opt/scMatch/refDB/FANTOM5/ && rm /opt/scMatch/refDB/FANTOM5/9606_symbol.csv.zip 

RUN wget -P /opt/scMatch/refDB/ https://ndownloader.figshare.com/articles/7397003?private_link=efd2969ce20fae5c118f
RUN mv /opt/scMatch/refDB/7397003?private_link=efd2969ce20fae5c118f /opt/scMatch/refDB/7397003.zip
RUN unzip /opt/scMatch/refDB/7397003.zip -d /opt/scMatch/refDB/FANTOM5_SingleR
RUN rm -rf /opt/scMatch/refDB/7397003.zip

RUN cp /opt/scMatch/refDB/FANTOM5/human_samples_oto.txt /opt/scMatch/refDB/FANTOM5/mouse_samples_oto.txt /opt/scMatch/refDB/FANTOM5/hgmm_samples_oto.txt /opt/scMatch/refDB/FANTOM5_SingleR/

WORKDIR /opt/scMatch
CMD [ "/bin/bash" ]
