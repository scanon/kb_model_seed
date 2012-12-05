TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

MFA_TOOLKIT_DIR= submodules/MFAToolkit
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
	$(MAKE) -C $(MFA_TOOLKIT_DIR)


clean:
	cd $(MODEL_SEED_DIR); ./Build clean
	cd $(MFA_TOOLKIT_DIR); make clean
