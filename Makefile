DIR_SRC		:=	.
DIR_BLD		:=	./build

JAVA_HOME	?=	/lib/jvm/default

FILES_C		:=	$(DIR_SRC)/test.c
FILES_CXX	:=	$(DIR_SRC)/test.cpp
FILES_JAVA	:=	$(DIR_SRC)/Test.java
FILES_SCALA	:=	$(DIR_SRC)/Test.scala
FILES_O		:=	$(DIR_BLD)/c/test.elf $(DIR_BLD)/cpp/test.elf $(DIR_BLD)/java/Test.class $(DIR_BLD)/scala/Test.class

FLAGS_C		:=	-Wno-comment
ECHO_GREEN	:=	"\033[0;32m"
ECHO_RESET	:=	"\033[0m"

CC		:=	clang
CXX		:=	clang++
JAVA		:=	$(JAVA_HOME)/bin/java
JAVAC		:=	$(JAVA_HOME)/bin/javac
SCALA		:=	scala
SCALAC		:=	scalac

all: $(FILES_O)
	@echo -e $(ECHO_GREEN)Running C code$(ECHO_RESET)
	$(DIR_BLD)/c/test.elf
	@echo -e $(ECHO_GREEN)Running C++ code$(ECHO_RESET)
	$(DIR_BLD)/cpp/test.elf
	@echo -e $(ECHO_GREEN)Running Java code$(ECHO_RESET)
	$(JAVA) -cp $(DIR_BLD)/java Test
	@echo -e $(ECHO_GREEN)Running Scala code$(ECHO_RESET)
	$(SCALA) -cp $(DIR_BLD)/scala Test

clean:
	@echo -e $(ECHO_GREEN)Cleaning up$(ECHO_RESET)
	@rm -vf $(FILES_O)

$(DIR_BLD)/c/%.elf: $(DIR_SRC)/%.c
	@echo -e $(ECHO_GREEN)Compiling C code$(ECHO_RESET)
	@mkdir -p $(@D)
	$(CC) $(FLAGS_C) -o $@ $^

$(DIR_BLD)/cpp/%.elf: $(DIR_SRC)/%.cpp
	@echo -e $(ECHO_GREEN)Compiling C++ code$(ECHO_RESET)
	@mkdir -p $(@D)
	$(CXX) $(FLAGS_C) -o $@ $^

$(DIR_BLD)/java/%.class: $(DIR_SRC)/%.java
	@echo -e $(ECHO_GREEN)Compiling Java code$(ECHO_RESET)
	@mkdir -p $(@D)
	$(JAVAC) -d $(DIR_BLD)/java $^


$(DIR_BLD)/scala/%.class: $(DIR_SRC)/%.scala
	@echo -e $(ECHO_GREEN)Compiling Scala code$(ECHO_RESET)
	@mkdir -p $(@D)
	$(SCALAC) -d $(DIR_BLD)/scala $^
