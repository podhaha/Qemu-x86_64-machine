apt update -y
echo install qemu-system
apt install qemu-system &
echo download...
clear
sleep 3
echo 25%
echo [_____................]
sleep 5
clear
echo 50%
echo [_______________...............]
sleep 4 
clear echo 100%
echo [_________________]
clear
echo install windows file...
sleep 1
wget https://computernewb.com/isos/windows/en_windows_7_ultimate_with_sp1_x64_dvd_u_677332.iso
sleep 1 
echo complete
echo install ngrok ....
 curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
 echo complete[ngrok]
 sleep 1
 echo add disk
qemu-img create -f qcow2 1.qcow2 20G
 sleep 1 
 echo 100%
 echo [__________]
 and disk 27G / 1S
 echo save '1.qcow2'
 sleep 1 
 clear
 echo start Ngrok (region=ap)
 ngrok tcp 5901 --region=ap &
echo start machine 
qemu-system-x86_64 -m 13G -vga std -cpu SandyBridge-v2 -smp sockets=1,cores=4,threads=2 -device e1000,netdev=n0 -netdev user,id=n0 -soundhw hda -vnc :1 -boot menu=on -machine usb=on -device usb-tablet -enable-kvm -hda 1.qcow2 &
sleep 1
clear
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sleep 12200
