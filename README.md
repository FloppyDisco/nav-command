# NAV command-line tool
the `nav` command is a convenient way of managing aliases specific for changing directories

### Creating a new `navigator` is easy:
- go to the desired directory
- run the command: `nav --save [name]`

### Using a `navigator` is even easier:
- from any directory run: `nav [name]`

### To delete an unwanted `navigator`:
- from any directory run: `nav --delete [name]`

### To see a list of all `navigators`:
- simply run: `nav`

### To specify the path for a `navigator`:
`nav` uses the `CWD` as the `[filepath]` for saving a new `navigator`.
A custom path may be provided while saving a new `navigator` by passing the `--path` arg.
- `nav --save --path [filepath] [name]`

Note: `[filepath]` must be the argument immediately after the `--path` option.

## Usage: 
```
nav [options] [filepath] [name]
```
| Command            | Description                                  |
| :----------------- | :------------------------------------------- |
| `-s` / `--save`    | Saves a new navigator as `[name]`            |
| `-d` / `--delete`  | Deletes the navigator `[name]`               |
| `-p` / `--path`    | Provide a `[filepath]` for the new navigator |
| `-h` / `--help`    | Displays command usage information           |


### `nav` supports auto-completion in `zsh`! Start typing a navigator name and press (tab)


## Setup:

1. Clone the repository
2. Add the file to your Shell profile

#### For ZSH:
```
git clone https://github.com/FloppyDisco/nav-command
echo "source $PWD/nav-command/nav" >> ~/.zshrc
source ~/.zshrc
```
