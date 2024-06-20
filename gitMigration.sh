
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                       Script to clone all branches and write all the branches in word file
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#!/bin/bash 

echo "---Source and destination repository URL---"
SOURCE_REPO=""
DEST_REPO=""

#Add a base path name which contains all the scripts and needed files
BASE_PATH="/"

echo "---------Clone repository from SOURCE_REPO-------------"
#clone all the branches from old git repository it gives bare git 
git clone --mirror $SOURCE_REPO
echo "---------Change the directory path -----------"
#cmi.git this is the bare git repo downloded from eu git
cd cmi.git  

#Add a remote destination to push all the branches to new git repository
git remote add cmi $DEST_REPO

#Push all if new Git repository is empty otherwise push only wanted branches
#cmi this is the repository name for global git
git push cmi --all
#git push cmi 

echo "---------Write all the branches in text file -----------"
#Create a file and write all the branches into it.
git branch --all > "cmibranches.txt"

#Move the text file into the base path for reference and edit the names 
mv "cmibranches.txt" "$BASE_PATH"
echo "---------All the branches are-----------"

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                       Script to clone all the branches to existing repo to new repo
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash 

SOURCE_CICD=""
DEST_PATH=""
BASE_PATH=""

while IFS= read -r line || [ -n "$line" ]; do
  BRANCH_NAME=$(echo "$line" | tr -d ' ')
  git clone --branch $BRANCH_NAME ""
  echo "-----------cloned cmi $BRANCH_NAME ----------"
  cp -r "$BASE_PATH"settings.xml $SOURCE_CICD
  chmod -R 777 cmi
  #cmi is the repository name for global git cloned branch
  cd cmi
  echo "---swith the branch $BRANCH_NAME ----"
  #create a code directory to maintain code contents separatly
  mkdir -m 777 code
  mv /* code
  mv * code
  mv "$SOURCE_CICD"settings.xml code
  cp -r "$SOURCE_CICD".* "$DEST_PATH"
  cp -r "$SOURCE_CICD"* "$DEST_PATH"
  echo "------------ci/cd file copiedfor branch $BRANCH_NAME -----------"
  git add --all 
  git commit -m "adding scripts dir and new code dir to move code files into it"
  git push 
  cd ..
  rm -rf cmi
   echo "-----------$BRANCH_NAME removed from local ----------"
done < "cmibranches.txt"
