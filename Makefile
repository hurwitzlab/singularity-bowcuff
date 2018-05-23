SING242 = /usr/local/bin/singularity #2.4.2-dist
SING231 = /home/vagrant/bin/singularity #2.3.1-dist

SINGULARITY = $(SING242)
IMG_NAME = bowcuff.img
DEF_NAME = image.def
SIZE = 2136

help:
	$(SINGULARITY) exec $(IMG_NAME) bowtie2 -h

run:
	$(SINGULARITY) run $(IMG_NAME)

clean:
	rm -f $(IMG_NAME)

img: clean 
	sudo $(SINGULARITY) build $(IMG_NAME) $(DEF_NAME) #actually the 2.4.2 way
#	sudo $(SINGULARITY) create --size $(SIZE) $(IMG_NAME)
#	sudo $(SINGULARITY) bootstrap $(IMG_NAME) $(DEF_NAME)

shell:
	sudo $(SINGULARITY) shell $(IMG_NAME)

scp:
	scp $(IMG_NAME) ua-sftp:/rsgrps/bhurwitz/scottdaniel/singularity-images
