#-H "Authorization: Bearer <YOUR-TOKEN>"\
repository=name of repo
#saves json of response from github
curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/artsdatabanken/$repository/releases/latest >> latest.json

#Get the release tag and remove quotation marks
name=$(cat latest.json | jq -cs .[0].name)
version=$(echo "$name" | tr -d "\042")

echo "Fetching files from github, based on release $version"
#Fetch the correct files from the latest release
wget -q https://github.com/Artsdatabanken/$repository/releases/download/$version/nameOfFiles