Repositorio de aulas Topicos Especiais III (Haskell)
-> Mestre: Alexandre Garcia
-> Horario: Toda segunda as 19h 

Instruções Basicas
-> Instalação linux 
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:hvr/ghc
    sudo apt-get update
    sudo apt-get install -y cabal-install-1.22 ghc-7.10.3
    cat >> ~/.bashrc <<EOF
    export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
    EOF
    export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH
    ghci
    
    Laravel FrameWork: https://laravel.com/docs/5.3/eloquent