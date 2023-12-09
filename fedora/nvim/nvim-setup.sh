rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

rm -rf ~/.config/nvim/lua/custom/

ln -s ~/configurations/fedora/nvim/custom ~/.config/nvim/lua/custom


