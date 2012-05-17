TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

MODEL_SEED_CORE_DIR = submodules/model-seed-core
CWD=`cwd`

all: update-submodules deploy-lib

update-submodules:
	git submodule init
	git submodule update

deploy: update-submodules deploy-libs

deploy-libs:
	cd $(MODEL_SEED_CORE_DIR);
	perl Build.PL
	./Build installdeps --cpan_client 'cpanm' --install_base $(TARGET)
	./Build install --install_base $(TARGET)
	cd $(CWD)
