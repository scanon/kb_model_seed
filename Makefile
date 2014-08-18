TOP_DIR = ../..
DEPLOY_RUNTIME ?= /kb/runtime
TARGET ?= /kb/deployment
include $(TOP_DIR)/tools/Makefile.common

MFA_TOOLKIT_DIR= submodules/MFAToolkit
MODEL_SEED_DIR = submodules/ModelSEED
all: update-submodules

update-submodules:
	git submodule init
	git submodule update

deploy: update-submodules deploy-libs

deploy-client:
	echo "no client"

test:
	echo "no tests implemented for kb_model_seed"

deploy-libs:
	cd $(MODEL_SEED_DIR); perl Build.PL;\
		./Build installdeps --cpan_client 'cpanm -l $(TARGET)';\
		./Build kbase --install_base $(TARGET)
	$(MAKE) -C $(MFA_TOOLKIT_DIR)
	cp $(MFA_TOOLKIT_DIR)/bin/mfatoolkit $(TARGET)/bin/
	if [ ! -e $(TARGET)/bin/scip ] ; then wget http://bioseed.mcs.anl.gov/~chenry/KbaseFiles/scip ; mv scip $(TARGET)/bin/ ; fi
	if [ ! -d $(TARGET)/etc/ ] ; then mkdir $(TARGET)/etc ; fi
	if [ ! -d $(TARGET)/etc/MFAToolkit ] ; then mkdir $(TARGET)/etc/MFAToolkit ; fi
	cp $(MFA_TOOLKIT_DIR)/etc/MFAToolkit/* $(TARGET)/etc/MFAToolkit/
	chmod +x $(TARGET)/bin/scip
	chmod +x $(TARGET)/bin/mfatoolkit

clean:
	cd $(MODEL_SEED_DIR); ./Build clean
	cd $(MFA_TOOLKIT_DIR); make clean
