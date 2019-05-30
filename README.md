# Docker Image for scMatch: a single-cell gene expression profile annotation tool using reference datasets

Single-cell RNA sequencing (scRNA-seq) measures gene expression at the resolution of individual cells. Massively multiplexed single-cell profiling has enabled large-scale transcriptional analyses of thousands of cells in complex tissues. In most cases, the true identity of individual cells is unknown and needs to be inferred from the transcriptomic data. Existing methods typically cluster (group) cells based on similarities of their gene expression profiles and assign the same identity to all cells within each cluster using the averaged expression levels. However, scRNA-seq experiments typically produce low-coverage sequencing data for each cell, which hinders the clustering process. We introduce scMatch, which directly annotates single cells by identifying their closest match in large reference datasets. We used this strategy to annotate various single-cell datasets and evaluated the impacts of sequencing depth, similarity metric and reference datasets. We found that scMatch can rapidly and robustly annotate single cells with comparable accuracy to another recent cell annotation tool (SingleR), but that it is quicker and can handle considerably larger reference datasets. We demonstrate how scMatch can handle large customized reference gene expression profiles that combine data from multiple sources, thus empowering researchers to identify cell populations in any complex tissue with the desired precision.

scMatch tool is maintained by Rui Hou [rui.hou@research.uwa.edu.au]

scMatch Docker image is maintained by Carlos Biagi Jr [biagi@usp.br]


## Docker installation
To install docker follow the instructions in the links below depending on your operating system:
- CentOS: https://docs.docker.com/install/linux/docker-ce/centos/
- Debian: https://docs.docker.com/install/linux/docker-ce/debian/
- Fedora: https://docs.docker.com/install/linux/docker-ce/fedora/
- Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/
- MacOS: https://docs.docker.com/docker-for-mac/install/
- Windows: https://docs.docker.com/docker-for-windows/install/


## Pulling Docker Image
Once docker is installed, the next step is to pull the [scmatch](https://hub.docker.com/r/biagii/scmatch) image from dockerhub using the following command:
```
docker pull biagii/scmatch
```


## Running image
* scMatch: Annotate the given transcriptome data using human and/or mouse expression data from given reference dataset.
```
docker run -it --rm --name [ANY_NAME] -v /server/path/:/docker/path biagii/scmatch python scMatch.py ... [ARGUMENTS]
```

* toTerms: Transfer the original sample name annotation vectors to the vectors of ontology terms.
```
docker run -it --rm --name [ANY_NAME] -v /server/path/:/docker/path biagii/scmatch python toTerms.py ... [ARGUMENTS]
```

* visAnnos.py: Visulise the annotation results from scMatch.py and toTerms.py.
```
docker run -it --rm --name [ANY_NAME] -v /server/path/:/docker/path biagii/scmatch python visAnnos.py ... [ARGUMENTS]
```

## Help
This docker image is based on scMatch tool developed by Rui Hou [rui.hou@research.uwa.edu.au]. Any doubt about how to use the parameters of the tool can be found in https://github.com/asrhou/scMatch and in the original [paper](https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btz292/5480299).

Any questions in Docker image contact the developer by email: biagi@usp.br


