setup-julian-nvim:
    #!/usr/bin/bash
    pip3 install pynvim
    mkdir $HOME/.npm-global
    npm config set prefix '~/.npm-global'
    echo 'export PATH=$HOME/.local/share/nvim/mason/bin:$HOME/.npm-global/bin:$PATH' >> $HOME/.profile
    source $HOME/.profile
    npm install -g neovim
    cd $HOME/.config
    mkdir nvim
    cd nvim
    git clone --depth 1 https://github.com/JulesVerne22/JulianSmith.nvim.git .
    git checkout ostree
    echo "IMPORTANT! Logout and back in for changes to take effect."
