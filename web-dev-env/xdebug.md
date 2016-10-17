## :beetle: Install and Configure xDebug on Ubuntu and Php Storm :elephant:

* Assuming that you have already installed php and apache
* **Install [xDebug](http://packages.ubuntu.com/xenial/php-xdebug) php extension**
```
# Ubuntu 16.04, php 7.0
sudo apt-get install php-xdebug
# Ubuntu 14.04, php 5.6 
sudo apt-get install php5-xdebug
```

* Now edit your ```php.ini``` and add these lines at last
```
[Xdebug]
zend_extension="/usr/lib/php/20151012/xdebug.so"
xdebug.remote_enable=1
xdebug.remote_port=9000
xdebug.idekey=PHPSTORM
```
* Above config is bare minimum, read all options [here](https://xdebug.org/docs/all_settings)
* Make sure **xdebug.so** path is correct in above configuration
* To find the **xdebug.so** file path; run this command
```
locate xdebug.so
```
* Above command will return the correct path to xdebug.so file

* Now check php version
```
php --version
```
* Above command should return like this
```
PHP 7.0.4-7ubuntu2.1 (cli) ( NTS )
Copyright (c) 1997-2016 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
    with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
    with Xdebug v2.4.0, Copyright (c) 2002-2016, by Derick Rethans
```
* Notice the Xdebug version in last line
* Restart apache server to reflect changes
```
sudo srevice apache2 restart
```
* **Configure phpStorm**
* Go through - Settings >> Languages & Frameworks >> PHP
* Lets set php Interpreter, to do so; click on three dots [...] button
* On the new window click on plus [+] button and select ```/usr/bin/php``` from suggestion popup
* Save and close this window
* Now on the Settings window select the Interpreter you just created then save and close


* **Start debuging**
* In phpStorm create some breakpoints in your project 
* Start listerner by clicking on the telephone :telephone_receiver: button on top toolbar
* In your browser access your project like this, OR use [bookmarks](https://www.jetbrains.com/phpstorm/marklets/)
```
http://localdomain.dev/?XDEBUG_SESSION_START=1
```
* You should see a popup window in phpStorm , click **Accept** connection 
* Done !!!

-----

### Disable xdebug temporary
```
sudo phpdismod xdebug
```
### Enable xdebug back
```
sudo phpenmod xdebug
```

#### Sublime Text 3 user ?
* Try this [package](https://packagecontrol.io/packages/Xdebug%20Client)

_Ubuntu 16.04, php 7.04, phpStorm 2016_
