Steps to Generate the ssh-key file:
$ ssh-keygen.exe -f devgod
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in devgod.
Your public key has been saved in devgod.pub.
The key fingerprint is:
SHA256:i7Bf4soENKotgzVg89GDi9Mo+fOKQPH5JBJhDnG659Y kanakuma@MSORUPAK-LAP1
The key's randomart image is:
+---[RSA 3072]----+
|o+.              |
|+o. o            |
|o*oo o           |
|.*X.+ .          |
|=*=B..  S        |
|=*o++o . .       |
|* * E.o o        |
|.= = o o         |
|. ..+.o          |
+----[SHA256]-----+

kanakuma@MSORUPAK-LAP1 MINGW64 /c/data/Devops GOD
$ ls
devgod  devgod.pub  readme.md

kanakuma@MSORUPAK-LAP1 MINGW64 /c/data/Devops GOD
$ mv devgod devgod.pem

kanakuma@MSORUPAK-LAP1 MINGW64 /c/data/Devops GOD
$ ls
devgod.pem  devgod.pub  readme.md