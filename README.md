# ObjectiveGit Playground

## Setup

Run these commands:

```
git submodule update --init (no 
objective-git/script/bootstrap
```

Don't use the `--recursive` option with the git command; the `bootstrap` script will take care of that.

Then, open **ObjectiveGit.xcworkspace**. The playground won't work by itself as a [workspace is required to import a 3rd party framework](https://developer.apple.com/library/ios/recipes/xcode_help-source_editor/chapters/ImportingaFrameworkIntoaPlayground.html).

```
mkdir "$HOME/Documents/Shared Playground Data"
```

