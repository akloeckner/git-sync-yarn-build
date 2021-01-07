# git-sync-yarn-build
This Docker container can be used to deploy a [Node.js](https://nodejs.org) app with `yarn` from a `git` repository.
It retrieves a repository using [git-sync](https://github.com/kubernetes/git-sync) and builds the app using [yarn](https://www.yarnpkg.com/).

## Usage
* You can use the image on Docker hub at https://hub.docker.com/r/akloeckner/git-sync-yarn-build .
* In order to configure `git-sync`, please see its documentation at https://github.com/kubernetes/git-sync .
* In order to configure `yarn`, please set up your repository according to https://classic.yarnpkg.com/en/docs/creating-a-project .
* You will likely want to serve your app with another container, such as `nginx` from https://hub.docker.com/_/nginx .
