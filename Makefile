TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

MODEL_SEED_CORE_DIR = submodules/model-seed-core
MFATOOLKITDIR = $(MODEL_SEED_CORE_DIR)/software/mfatoolkit
MFATOOLKITCCFLAGS = "-O3 -fPIC -fexceptions -DNDEBUG -DIL_STD -DILOSTRICTPOD -DLINUX -I../Include/ -DNOSAFEMEM -DNOBLOCKMEM -lglpk -lpthread -lz"
CPLEXAPI = "CPLEXapiEMPTY.cpp"

all: update-submodules deploy-lib mfatoolkit

update-submodules:
	git submodule init
	git submodule update

deploy: update-submodules deploy-libs mfatoolkit

mfatoolkit:
	cd $(MFATOOLKITDIR)/Linux; make; cp mfatoolkit $(TARGET)/bin

deploy-libs:
	cd $(MODEL_SEED_CORE_DIR); perl Build.PL;\
		./Build installdeps --cpan_client 'cpanm' --install_base $(TARGET);\
		./Build install --install_base $(TARGET)
