# docx to markdown Action	

This action will find any markdown, .docx, files and generate a .md file for each one. This action can be used in conjunction with a commit action to add the generated .md back to the repository. The example shows how to...

1. Checkout the code 
2. Convert all word document (.docx) to .mds, **Note:** You can filter the paths to only run on certain file types.
3. Open a PR back to the repo with the generated .mds. 

This action uses the [pandoc](https://pandoc.org/) library installed on Ubuntu.

## Example
```yaml
name: Convert PDF to Markdown

on:
  push:
    paths:
    - '**.md'

jobs:
  convert_md: 
    runs-on: ubuntu-latest
    steps:
    # We must checkout the latest version of the code to get a copy of all .md files
    - name: Checkout Code
      uses: actions/checkout@v2.0.0
      with:
        fetch-depth: 1
    - name: Create .pdfs
      uses: baky0905/md-to-pdf@v0.1.1
      env: {
        # Use this parameter to determine where the generated .pdf(s) will be stored.
        PDF_DIR: './pdfs'
      }
    - name: Create Pull Request
      uses: peter-evans/create-pull-request@v1.6.1
      env:
        # The token is built in to actions. No config required.
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        COMMIT_MESSAGE: Add .md files.
        PULL_REQUEST_TITLE: Add .md files.
        PULL_REQUEST_BRANCH: md-add
        PULL_REQUEST_BODY: :wave: Here are the .md files you requested.
        PULL_REQUEST_REVIEWERS: baky0905
```      
