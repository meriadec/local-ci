# local-ci

Post-commit hook that triggers local CI

### Install on any repo

```bash
# do this from your repo root directory
curl https://raw.githubusercontent.com/meriadec/local-ci/master/install-hook.sh | bash
```

### Usage

Create a `.local-ci` file inside your repo root directory, containing various
comands to run.

```bash
#!/bin/bash

yarn
yarn test
npm run lint
whatever-package run whatever check
rm -rf /
# etc....
```

All these commands will be launched in the background, in a separate
directory, checkouted on the commit you just created. Pretty noice, no?

The log will always be created into `local-ci.log`.

### Caching

An out-of-the-box solution is to use the `$SRC_DIR` env variable that is automatically filled
on your script execution context.

Example caching node_modules (aka: doing a naive symlink from src dir)

```bash
#!/bin/bash

ln -s "$SRC_DIR/node_modules" .

# no more need to `yarn` before !
yarn test
```

### Ignoring ci file & log file

Put them into your global gitignore file. See https://help.github.com/en/articles/ignoring-files
