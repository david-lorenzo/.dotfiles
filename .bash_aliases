# using apt with ram disk as a cache
alias inst='sudo mount /var/cache/apt/archives/; sudo apt '
alias aptoff='sudo umount /var/cache/apt/archives'

# stop mechanical drive
alias shdd='sudo hdparm -Y /dev/sda'

# controlling the working frequencies
alias cpumax='sudo systemctl stop cpumin.service'
alias cpumin='sudo systemctl restart cpumin.service'
alias cpus='systemctl status cpumin.service'
alias cpuf='for i in 0 1 2 3; do cpufreq-info -f -m -c $i;done'
alias cpui='sensors | grep -i core; cpuf; cpus'

# conectarse a la raspberry
alias rpi='ssh pi@rpi'

alias python='python3'

alias 12v='vlc --rate 1.25'
alias 15v='vlc --rate 1.5'
alias 17v='vlc --rate 1.75'
alias 2v='vlc --rate 2.0'
alias activate='source `find . -type f -name activate`'
alias kubectl='minikube kubectl -- '
alias hp='cat ~/repos/haskell/packages.txt | grep -i '
alias irust='evcxr'
alias clean='rm -rf ~/.ram/.cache/mozilla'
alias cync='sudo systemctl stop davidsync.service'
alias slow='sudo systemctl start cpumin.service'
alias fast='sudo systemctl stop cpumin.service'
alias start='sudo hdparm -y /dev/sda; df -h'
