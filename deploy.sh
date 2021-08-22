set -e
git status | grep "working tree clean" || (echo "ABORTING DEPLOY, WOULD LOSE FILES"; exit 1)
zola build
git checkout gh-pages
find . -maxdepth 1 -not -name '.' -not -name '.git' -not -name 'public' -exec rm -r {} \;
mv public/* .
rmdir public/
git add .
git commit -m "Deploy site"
git push
git checkout main
