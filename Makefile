TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

MODEL_SEED_DIR = submodules/ModelSEED
all: update-submodules

update-submodules:
	git submodule init
	git submodule update

deploy: update-submodules deploy-libs

deploy-libs:
	cd $(MODEL_SEED_DIR); perl Build.PL;\
		./Build installdeps --cpan_client 'cpanm -l $(TARGET)';\
		./Build kbase --install_base $(TARGET)

clean:
	cd $(MODEL_SEED_DIR); ./Build clean
