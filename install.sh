nav_path=`PWD`/nav-command
sed -i.bak "s~\(files=\).*~\1$nav_path/~" $nav_path/nav
echo "\n\nexport PATH=\"$nav_path/:\$PATH\"" >> ~/.zshrc
echo "alias -s nav=source" >> ~/.zshrc
source ~/.zshrc
open ~/.zshrc
code $nav_path/nav
