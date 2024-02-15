# NAV commandline tool


Navigate the Terminal quickly with saved shortcuts!
  - the nav command uses a suffix alias to source files that contain the saved directory path

## Creating a shortcut


Keyname Arguments
  - the short, long, and plaintext argument names are interchangable

| Command ||| Description |
|:----:|:----:|:----:|:----:|:-----|
| -s | --save   | save   | [name] | Creates a new shortcut called [name].nav |
| -d | --delete | delete | [name] | Deletes the shortcut saved as [name].nav |
| -p | --path   | path   | [path] | Specifies the [path] to use for the new shortcut |
| -h | --help   | help | | Displays command usage information |
| -o | --open   | open | | Opens nav-command directory |

### Examples

- Save a new shortcut that navigates to the current directory
  ```
  nav newShortcut
  -or-
  nav save newShortcut
  ```
- Delete a shortcut
  ```
  nav -d oldShortcut
  ```
- Create a shortcut with a specified path
  ```
  nav --save newShortcut --path /some/other/path/
  -or-
  nav path /some/other/path/ newShortcut
  ```

## Using a Shortcut

To use a shortcut to navigate the Terminal to a new directory
simply type the shortcut name followed by ".nav"

### Example

- Navigate to the directory that was saved for newShortcut
```
newShortcut.nav

```

## setup/install

to install the NAV command you will need to:
1. Fork and clone the nav-command repo to your machine
  - nav-command does not need to be in your home directory
  - cd into the directory where you would like the command files to be stored
  ```
  git clone "https://gitlab.com/your/fork/of/nav-command/
  ```

2. Run the install.sh file
  ```
  zsh ./nav-command/install.sh
  ```

3. The ".zshrc" file will open.
  - please verify that it now contains the following:
  ```
  export PATH="/Users/profile-name/your/filepath/to/nav-command/:$PATH"
  alias -s nav=source
  ```

4. The nav file will open in VS Code.
  - please verify that the files variable has been set to the correct file path where nav-command is installed
  - this filepath must match the filepath exported inside the .zshrc file.
  ```
  # ---------------------------------------------------------------------------------
  files=/Users/user-name/your/filepath/to/nav-command/
  # ---------------------------------------------------------------------------------
  ```
