# NAV commandline tool


Navigate the Terminal quickly with saved shortcuts!
  - the nav command uses a suffix alias to source files that contain the saved directory path

## Creating a shortcut


Keyname Arguments
  - the short, long, and plaintext argument names are interchangable

| Command | Description |
|:-----|:-----|
| -s  --save    save   [name] | Creates a new shortcut called [name].nav |
| -d  --delete  delete [name] | Deletes the shortcut saved as [name].nav |
| -p  --path    path   [path] | Specifies the [path] to use for the new shortcut |
| -h  --help    help | Displays command usage information |
| -o  --open    open | Opens nav-command directory |

### Examples

```
  #save a new shortcut that navigates to the current directory
nav newShortcut
-or-
nav save newShortcut


  # delete a shortcut
nav -d oldShortcut

  #create a shortcut with a specified path
nav --save newShortcut --path /This/new/file/path/
-or-
nav path /some/other/path anotherShortcut
```

## using a shortcut

To use a shortcut to navigate the Terminal
simply type the shortcut name followed by ".nav"

### Example

```
 # navigate to the directory that was saved for newShortcut
newShortcut.nav

```



## setup

to install the NAV command you will need to:
1. Fork and clone the nav-command repo to your machine

```
git clone "https://gitlab.com/your/fork/of/nav-command/
```

2. run the install.sh file with the zsh shell
```
zsh ./nav-command/install.sh
```

3. the ".zshrc" file will open please verify that it now contains the following:
  - export PATH="/Users/profile-name/filepath/to/nav-command/:$PATH"
  - alias -s nav=source

4. the nav file will open in VS Code. please verify that the files variable has been set to the correct file path where nav-command is installed
  - this filepath must match the filepath exported inside the .zshrc file.
