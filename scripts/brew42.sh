#!/usr/bin/env bash
# Brew@42 installer into sgoinfre

# Delete and reinstall Homebrew from Github repo
rm -rf $HOME/.brew $HOME/sgoinfre/.brew
mkdir $HOME/sgoinfre/.brew
ln -s $HOME/sgoinfre/.brew $HOME/.brew
git clone --depth=1 https://github.com/Homebrew/brew $HOME/sgoinfre/.brew

# Create Extra Symlinks for Minikube and Docker
rm -rf $HOME/.minikube $HOME/sgoinfre/.minikube $HOME/.docker $HOME/sgoinfre/.docker $HOME/sgoinfre/.kube
mkdir $HOME/sgoinfre/.minikube $HOME/sgoinfre/.docker $HOME/sgoinfre/.kube
ln -s $HOME/sgoinfre/.minikube $HOME/.minikube
ln -s $HOME/sgoinfre/.docker $HOME/.docker
ln -s $HOME/sgoinfre/.kube $HOME/.kube

# Create .brewconfig script in home directory 
# # A prime example of heredoc usage 🤟
cat > $HOME/.brewconfig.zsh <<EOL
# HOMEBREW CONFIG

# Add brew to path
export PATH=\$HOME/sgoinfre/.brew/bin:\$PATH

# Set Homebrew temporary folders
export HOMEBREW_CACHE=/tmp/\$USER/Homebrew/Caches
export HOMEBREW_TEMP=/tmp/\$USER/Homebrew/Temp

mkdir -p \$HOMEBREW_CACHE
mkdir -p \$HOMEBREW_TEMP

# If NFS session
# Symlink Locks folder in /tmp
if df -T autofs,nfs \$HOME 1>/dev/null
then
  HOMEBREW_LOCKS_TARGET=/tmp/\$USER/Homebrew/Locks
  HOMEBREW_LOCKS_FOLDER=\$HOME/.brew/var/homebrew

  mkdir -p \$HOMEBREW_LOCKS_TARGET
  mkdir -p \$HOMEBREW_LOCKS_FOLDER

  # Symlink to Locks target folders
  # If not already a symlink
  if ! [[ -L \$HOMEBREW_LOCKS_FOLDER && -d \$HOMEBREW_LOCKS_FOLDER ]]
  then
     echo "Creating symlink for Locks folder"
     rm -rf \$HOMEBREW_LOCKS_FOLDER
     ln -s \$HOMEBREW_LOCKS_TARGET \$HOMEBREW_LOCKS_FOLDER
  fi
fi
EOL

# Add .brewconfig sourcing in your .zshrc if not already present
if ! grep -q "# Load Homebrew config script" $HOME/.zshrc
then
cat >> $HOME/.zshrc <<EOL

# Load Homebrew config script
source \$HOME/.brewconfig.zsh
EOL
fi

source $HOME/.brewconfig.zsh
rehash
bree update

echo "\nPlease open a new shell to finish installation"
