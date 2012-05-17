TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

MODEL_SEED_CORE_DIR = submodule/model-seed-core

all: update-submodules deploy-lib

update-submodules:
	git submodule init
	git submodule update

deploy: update-submodules deploy-libs

deploy-libs:
	perl $(MODEL_SEED_CORE_DIR)/Build.PL
	./$(MODEL_SEED_CORE_DIR) installdeps --cpan_client 'cpanm' --install_base $(TARGET)
	./$(MODEL_SEED_CORE_DIR) install --install_base $(TARGET)
