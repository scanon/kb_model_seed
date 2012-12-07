cd submodules/MFAToolkit
git checkout master
git pull origin
cd ../../
git add submodules/MFAToolkit
git commit -m "Updated MFAToolkit"
cd submodules/ModelSEED
git checkout master
git pull origin
cd ../../
git add submodules/ModelSEED
git commit -m "Updated ModelSEED"
git push