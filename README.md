# NAV command-line tool
The `nav` command is a convenient way of managing aliases specific for changing directories

### Creating a new `navigator` is easy:
Go to the desired directory and run:

    nav --save [name]

### Using a `navigator` is even easier:
    nav [name]

### Rename a `navigator`:
    nav --rename [current-name] [new-name]

### Delete an unwanted `navigator`:
    nav --delete [name]

### List all `navigators`:
    nav

### Create a `navigator` with a Path:
When saving a new `navigator`, the `PWD` will be used as the `[filepath]`.
Unless a custom path is set by passing the `--path` argument

    nav --save --path [filepath] [name]

Note: `[filepath]` must be the argument immediately after the `--path` option.

## Usage: 
```
nav [options] [filepath] [name] [new-name]
```

| Option             | Description                                  |
| :----------------- | :------------------------------------------- |
| `-s` / `--save`    | Saves a new navigator as `[name]`            |
| `-r` / `--rename`  | Rename a navigator`[name]` as `[new-name]`   |
| `-d` / `--delete`  | Deletes the navigator `[name]`               |
| `-p` / `--path`    | Provide a `[filepath]` for the new navigator |
| `-h` / `--help`    | Displays command usage information           |



## `nav` supports auto-completion in ZSH
Start typing a navigator `[name]` and press **(Tab)**!



## Setup:
1. Clone the repository
2. Add the file to your login profile

#### For ZSH:
```
git clone https://github.com/FloppyDisco/nav-command
echo "source $PWD/nav-command/nav.sh" >> ~/.zshrc
source ~/.zshrc
```
