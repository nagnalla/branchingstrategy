t branch
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

# PI.16.1,PI.16.2 etc.
versionLabel=PI-$1

# establish branch and tag name variables
devBranch=develop
releaseBranch=release-$versionLabel
 
# create the release branch from the -develop branch
git checkout -b $releaseBranch $devBranch
 
# commit version number increment
git commit -am "Creating Release Branch with version number to $versionLabel"

#push new branch to remote origin
git push origin $releaseBranch

# merge release branch with the new version number back into develop
git checkout $devBranch
git merge --no-ff $releaseBranch

