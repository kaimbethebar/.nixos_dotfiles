# !/bin/bash

echo "This will wipe your .config directory. Are you sure you want to continue? (y/n)"
read start_yes_no

if [ start_yes_no = "n" ]; then exit; fi

rm -rf ~/.config
rm ~/.bashrc
mkdir ~/.config


ln -s ~/nixos_dotfiles/.config/cava ~/.config/cava
ln -s ~/nixos_dotfiles/.config/kitty ~/.config/kitty
ln -s ~/nixos_dotfiles/.config/ranger ~/.config/ranger
ln -s ~/nixos_dotfiles/.config/sway ~/.config/sway
ln -s ~/nixos_dotfiles/.config/waybar ~/.config/waybar
ln -s ~/nixos_dotfiles/.config/wofi ~/.config/wofi
ln -s ~/nixos_dotfiles/.config/.bashrc ~/.bashrc


echo "Finished";read
# mkdir ~/.config/cava
# mkdir ~/.config/kitty
# mkdir ~/.config/ranger
# mkdir ~/.config/sway
# mkdir ~/.config/waybar
# mkdir ~/.config/wofi

