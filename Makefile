# Leah Brown
# Club Simulation Makefile
# 7/08/2023


JAVAC=/usr/bin/javac
JAVA=/usr/bin/java

SRCDIR=src
BINDIR=bin
PACKAGE=clubSimulation

PACKAGE_SRCS=$(wildcard $(SRCDIR)/$(PACKAGE)/*.java)
SRCS=$(wildcard $(SRCDIR)/*.java)

PACKAGE_CLASSES=$(PACKAGE_SRCS:$(SRCDIR)/%.java=$(BINDIR)/%.class)
CLASSES=$(SRCS:$(SRCDIR)/%.java=$(BINDIR)/%.class)

all: $(BINDIR) $(PACKAGE_CLASSES) $(CLASSES)

$(BINDIR):
	mkdir -p $(BINDIR)

$(BINDIR)/%.class: $(SRCDIR)/%.java
	$(JAVAC) -d $(BINDIR) -cp $(BINDIR) -sourcepath $(SRCDIR) $<

clean:
	rm -f $(BINDIR)/*.class $(BINDIR)/$(PACKAGE)/*.class

run: all
	$(JAVA) -cp $(BINDIR) $(PACKAGE).ClubSimulation $(args)