PROJECT=main
TEX=lualatex
BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex

all:
	$(BUILDTEX)
	$(BIBTEX) $(PROJECT)
	$(BUILDTEX)
	$(BUILDTEX)

once:
	$(BUILDTEX)
one: 
	$(TEX) -jobname=one "\includeonly{msip/msip}\input{$(PROJECT)}"
two: 
	$(TEX) -jobname=two --shell-escape "\includeonly{dfo/dfo}\input{$(PROJECT)}"
ftwo: 
	$(TEX) -jobname=two "\includeonly{front,dfo/dfo}\input{$(PROJECT)}"
three: 
	$(TEX) -jobname=three "\includeonly{jcc/jcc}\input{$(PROJECT)}"
four: 
	$(TEX) -jobname=four "\includeonly{slk/slk}\input{$(PROJECT)}"
intro: 
	$(TEX) -jobname=intro "\includeonly{intro/intro}\input{$(PROJECT)}"
title: 
	$(TEX) -jobname=title "\includeonly{front}\input{$(PROJECT)}"

clean:
	rm -f *.aux *.log *.out	*.idx *.lot *.lof *.gz *.toc *~ *.blg *.auxlock *.bbl *.ent
	rm -f */*.aux */*.log */*.out	*/*.idx */*.lot */*.lof */*.gz */*.toc */*~ */*.blg */*.auxlock */*.bbl */*.ent

.PHONY: intro