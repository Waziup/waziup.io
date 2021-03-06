WAZIUP website
==============

This is the source for the [waziup.io](http://waziup.io) site.

Writing content
---------------

1. Clone this repo

        $ git clone https://github.com/waziup/waziup.io

2. Download Hugo from [http://gohugo.io](http://gohugo.io) or install using Homebrew:

        $ brew update && brew install hugo

4. Run hugo in watch mode and start adding content under the `content/` tree

        $ hugo server --watch

    The site is served under `localhost:1313`

Deploying
---------

To deploy on Waziup platform:

```
$ hugo
$ docker build -t waziup/website .
$ docker push waziup/website
```
Optionally, restart the task on Amazon:
```
aws ecs list-tasks --cluster "waziup-frontend" --service "Waziup-website" --output text --query taskArns[0] | xargs aws ecs stop-task --cluster "waziup-frontend" --task
```


Documentation
-------------

To generate the dcumentation, you need to install TexLive and pandoc:
```
sudo apt-get update
sudo apt-get install -y wget ca-certificates texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-fonts-recommended
sudo apt-get install -y pandoc
```

You can then generate the PDF documentation this way:
```
./makeDocs.sh
```


