

# nav commandline tool

## Navigate the Terminal quickly with saved shortcuts!

## Creating a shortcut

### Keyname Arguments

---

## the short, long, and plaintext options are interchangeable as argument names

_-s | --save | save_

- the "save" argument flag is optional if only passing the name for the new shortcut

_-d | --delete | delete_

- pass the name of the shortcut you wish to delete

_-p | --path | path_

- specify the path to be assigned to the new shortcut

_-o | --open | open_

- opens the nav-command directory in VS code

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
```

## using a shortcut

To use a shortcut to navigate the Terminal
simply type the shortcut name followed by ".nav"

### Example

```
 # navigate to the directory that was saved for newShortcut
newShortcut.nav

```
