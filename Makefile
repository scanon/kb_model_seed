TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

MODEL_SEED_CORE_DIR = submodule/model-seed-core

all: deploy-lib

deploy: deploy-libs

deploy-libs:
	perl $(MODEL_SEED_CORE_DIR)/Build.PL
	./$(MODEL_SEED_CORE_DIR) installdeps --cpan_client 'cpanm' --install_base $(TARGET)
	./$(MODEL_SEED_CORE_DIR) install --install_base $(TARGET)
