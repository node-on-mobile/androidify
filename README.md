# androidify

android dev the simple way. take a set of html files,
and turn them into an apk with one command. Proof of Concept.

## motivation

dabbling occasionally in android dev... is a massive pain in the butt!
why can't it just be easy? why do I have to install massive SDKs
and all that crap? Since I only want to build my app with
web tech, why isn't it as easy as creating a web site?

write some HTML and javascript, then hit deploy?

Then I had an idea: instead of recompiling the stupid java app
from scratch every time (and requiring the enormous android sdk)
just use a prebuilt apk, replace the text files, repack and resign.

Turns out, this was surprisingly easy.

## installation

`npm install androidify -g`

Almost, you'll also need to have java, to get the `jarsigner`
command, and `adb` command to deploy your app.

* ubuntu/debian: `sudo apt-get install default-jre android-tools-adb`
* archlinux: `sudo pacman -S jre8-openjdk-headless android-tools`
* osx: `brew cask install java android-platform-tools`

and put your phone into developer mode (depends on your phone)

## usage

```
mkdir hello
echo '<h1> HELLO </h1>' > index.html
androidify #will output app.apk
adb install app.apk # will send it to your device.
```

A new app called "Hello World" will appear.

I havn't figured out how to change the name yet.
So, it's called "Hello World" no matter what.

## signing

The apps are selfsigned, which is basically meaningless,
so I just checked the key it in. My phone doesn't complain
about this, maybe because it's in developer mode?

## thanks

This is made an old `hello world.apk` i found at

[simplificator/phonegap-helloworld](https://github.com/simplificator/phonegap-helloworld/)

## License

MIT

