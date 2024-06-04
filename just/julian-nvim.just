setup-julian-nvim:
    #!/usr/bin/bash
    pip3 install pynvim
    npm install -g neovim
    echo 'PATH=$PATH:$HOME/.local/share/nvim/mason/bin' >> $HOME/.bashrc
    cd $HOME/.config
    mkdir nvim
    cd nvim
    git clone --depth 1 https://github.com/JulesVerne22/JulianSmith.nvim.git .
    git checkout ostree
