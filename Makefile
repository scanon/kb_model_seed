TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

MODEL_SEED_DIR = submodules/ModelSEED
all: update-submodules deploy-libs

update-submodules:
	git submodule init
	git submodule update

deploy: update-submodules deploy-libs

deploy-libs:
	cd $(MODEL_SEED_DIR); perl Build.PL;\
		./Build installdeps --cpan_client 'cpanm -l $(TARGET)';\
		mv $(TARGET)/lib/perl5/* $(TARGET)/lib;\
		rm -r $(TARGET)/lib/perl5;\
		./Build install --install_base $(TARGET) --install_path lib=$(TARGET)/lib
