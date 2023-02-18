kpst() {
  if ( $SPACESHIP_KUBECONTEXT_SHOW ); then
    export SPACESHIP_KUBECONTEXT_SHOW=false
  else
    export SPACESHIP_KUBECONTEXT_SHOW=true
  fi
}

weather() {
  curl "http://wttr.in/$1"
}

myip() {
  curl "ifconfig.co"
}

zbench() {
  for i in $(seq 1 10); do
    /usr/bin/time /usr/local/bin/zsh -i -c exit
  done
}

prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

ssh-ffapp() {
  TEMP_VALUE=$VAULT_ADDR
  export VAULT_ADDR=https://vault.a05.4finance.net
  vault ssh -address=https://vault.a05.4finance.net -mode=ca -mount-point=ssh-a06 -role=a06-developers -private-key-path=~/.ssh/id_ed25519 -public-key-path=~/.ssh/id_ed25519.pub ffapp@$1
  export VAULT_ADDR=$TEMP_VALUE
}

ssh-dev() {
  TEMP_VALUE=$VAULT_ADDR
  export VAULT_ADDR=https://vault.a05.4finance.net
  vault ssh -address=https://vault.a05.4finance.net -mode=ca -mount-point=ssh-a06 -role=a06-devops -private-key-path=~/.ssh/id_ed25519 -public-key-path=~/.ssh/id_ed25519.pub root@$1.a06.4finance.net
  export VAULT_ADDR=$TEMP_VALUE
}

ssh-dev-a06() {
  TEMP_VALUE=$VAULT_ADDR
  export VAULT_ADDR=https://vault.a06.4finance.net
  vault ssh -address=https://vault.a06.4finance.net -mode=ca -mount-point=ssh-a06 -role=a06-devops -private-key-path=~/.ssh/id_ed25519 -public-key-path=~/.ssh/id_ed25519.pub root@$1.a06.4finance.net
  export VAULT_ADDR=$TEMP_VALUE
}

de() {
  docker exec -it "$1" bash
}

ke() {
  k exec -it "$1" -- sh
}

kenv() {
  k exec -it "$1" -- env
}

kdump() {
 k exec "$1" -- jmap -dump:live,file=heap.bin 1 \
 && k exec "$1" -- gzip heap.bin \
 && k cp "$1":/srv/app/heap.bin.gz ~/Downloads/heap."$1".bin.gz
}

wpos() {
 watch "kubectl get po | grep $1"
}

awsinfo() {
 TAG="${1:=jenkins-pipeline3-worker-standard}"
 aws ec2 describe-instances --filters Name=tag:Name,Values=$TAG --query 'Reservations[*].Instances[*].{"InstanceId":InstanceId,"PrivateIP":PrivateIpAddress,"State":State.Name}'
}

sshawstest() {
 ssh centos@$1 -i ~/.ssh/test.env.admin
}

sshjenkins() {
 ssh -l root -i ~/.ssh/a06-devops $1
}

ebase64() {
 echo -n $1 | base64
}

dbase64() {
 echo -n $1 | base64 -d
}
