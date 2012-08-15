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
		rsync $(TARGET)/lib/perl5/* $(TARGET)/lib;\
		./Build install --install_base $(TARGET) --install_path lib=$(TARGET)/lib
