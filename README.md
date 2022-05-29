<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/troopek/TropX">
    <img src="images/logo.png" alt="logo" width="100">
  </a>

<h3 align="center">TropX</h3>

  <p align="center">
    The best penetration testing and tech tools unified into one beatiful command line interface!
    <br />
    ·
    <a href="https://github.com/troopek/TropX/issues/new">Report Bug</a>
    ·
    <a href="https://github.com/troopek/TropX/issues/new">Request Feature</a>
  </p>
</div>

---

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#next-feature">Next Feature</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#setup">Setup</a></li>
        <li><a href="#initiation">Initiation</a></li>
        <li><a href="#updates">Updates</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#custom-scripts">Custom Scripts</a></li>
      <ul>
      <li><a href="#bash">Bash</a></li>
        <li><a href="#python">Python</a></li>
        <li><a href="#setup">Setup</a></li>
        <li><a href="#share-your-script">Share your script</li>
      </ul>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#credits">Credits</a></li>
    <li><a href="#donate">Donate</a></li>
    <li><a href="#compatibility">Compatibility</a></li>
    <li><a href="#troubleshooting">Troubleshooting</a></li>
    <li><a href="#disclaimer">Disclaimer</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
# About The Project

<img src="images/image.png" alt="image">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TropX is a command line application to run penetration testing scripts. It aims to more efficiently run long processes and tedious tasks by allowing the creation of custom scripts in the CLI that can be run whenever. To make scripting even easier, there are premade functions and variables for bash and python to be used to simplify the process. TropX also allows for maximum customization and optimization by providing a settings menu controlled trough the CLI. This project is free and opensource so all funding originates from <a href="#donate">donations</a>.

<p align="right">(<a href="#top">back to top</a>)</p>


# Next Feature
Vote on the next feature to be implemented into TropX.

* This feature is not setup yet


<!-- GETTING STARTED -->
# Getting Started
Learn how to install, setup, and update Tropx.


## Installation
A local copy of TropX can be obtained using the `git clone` command.

* Navigate to your terminal (e.g. Terminator)
* Navigate to the directory you want TropX saved
* Clone the repository using the `git clone` command
  ```sh
  git clone https://github.com/troopek/TropX 
  ```
* Navigate to the TropX folder
  ```sh
  cd TropX
  ```


## Setup
The setup is automatically done after running the `setup.sh` file. The installation time may vary according to some variables.

* Run the `setup.sh` file with bash and follow along with the setup tutorial
  ```sh
  bash setup.sh
  ```


## Initiation
To run TropX, you will have to run the `main.sh` file.

* Navigate to the TropX folder
  ```sh
  cd TropX
  ```
* Run the `main.sh` file with bash
  ```sh
  bash main.sh
  ```
  
## Updates

You can update TropX to the newest version without losing any custom scripts and while also preserving your settings and other modified things. You can do this automatically trough TropX.

* <a href="#initiation">Start up TropX</a>
* Select `Check for Updates` in the main menu
* If a newer version is available, you will be promted to install it
  
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE -->
# Usage
Learn how to use **TropX** efficiently and to it's fullest.

* <a href="#initiation">Start up TropX</a>
* You will be prompted to select out of an ample of scripts
* To select any script, you will have to input its corresponding number like `4` and then press `Enter`
* All tools and scripts will send you back to the main menu after executing
* This same navigation also applies to navigation within scripts.

<p align="right">(<a href="#top">back to top</a>)</p>

## First Steps
Find out what to do first after <a href="#initiation">Starting up TropX</a>

* Configure your wireless Interface in the settings tab


<!-- Custom Scripts -->
# Custom Scripts

You can very easily add **Custom Scripts** to TropX to further personalize the CLI, it supports both **bash** and **python**. Additionally you can **clone** a tool from **github** also.


## **Bash**

TropX has some default **functions** and **variables** to simplify the programming pillar of custom scripts.



* #### installPackages
* Install Packages more simply and reliably without causing errors and messing up the script
  ```sh
  installPackages "python3" "network-manager" "macchanger" 
  ```
  * All packages listed after the `installPackages` command will be installed automatically.
  * If they already are installed nothing will happen.
  * The function accepts an infinite amount of packages.

---
* #### selectOptions 

* With `selectOptions` you can ask the user to select an option, the CLI equivalent of good navigation.


  ```sh
  selectOptions "Options" "Enter selection Here" "Try another selection" "Option1" "Option2" "Option3"
  ```
  *  `"Options"` is the title for the option choices
  *  `"Enter selection Here" "Try another selection"` These two are the `type here` text before the `>`, the second will be shown in case of an error.
  *  `"Option1" "Option2" "Option3"` The rest are options which will be shown to the user, they can be passed singularly or in an Array 
  * The ouput can be saved into a variable like so, where `choice` is the number corresponding to the option, so if you choose `Option2`, then `$SO` and also `choice` will be set to `2`. This extra step is recommended as sometimes the variable gets overwritten by this function getting run somewhere else and then its value will change to something completely diffrent and irrelevant.
    ```sh
    choice=$SO
    ```
  * The function has a built-in check for the selected option to confirm it's validity.

---

* #### getInput
* With `getInput` you can get user input to save into a variable and use within your custom script

  ```sh
  getInput "Select an Option" "Type a file name" "file.txt"
  ```
  * `"Select an Option"` is the title for the get input function
  * `"Type a file name"` is going to be the action they are to perform or write
  * `"file.txt"` is an example of what their input should look like
    ```sh
    input=$SI
    ```
  
  *  The ouput can be saved into a variable like so, where input is the text inputted, so if you typed in `foo`, then `$SI` and also `input` will be set to `foo`. This extra step is recommended as sometimes the variable gets overwritten by this function getting run somewhere else and then its value will change to something completely diffrent and irrelevant.
  * In the below example im using getInput to obtain a valid path to a file
  * To ensure that your user returns a proper and useful string, you can run it trough an until loop
    ```sh
        getInput "File Path" "Please type in the relative or full path of the script" "Do not incldue a file extension" "file.txt"
    path=$SI

      until [ -f $path ] #this is a bash built-in way to check if a file exists
      do
        getInput error "File Path" "Please type in the relative or full path of the script" "Do not incldue a file extension" "file.txt"
        path=$SI
      done
    ```
  * First I just `getInput` normally from the user
  * Here I run an `until` loop which checks if the path exists, if it does nothing happens, otherwise it will loop until the expression is true.
  * Make sure to pass `error` as the first argument in the getInput function and keep the rest as is
    
---

* #### message
* With the `message` function you can display a message to the user that waits until they press a key on their keyboard.

  ```sh
  Message="TropX is cool!"
  message "Disclaimer" "$Message"
  ```
  *  `"Disclaimer"` is the title for the message
  *  `"$Message"` is the variable in which the message is stored
    
---

* #### changeWImode
* With the `changeWImode` function, you can easily change the mode of your Wireless Interface
  ```sh
  changeWImode monitor
  # ...
  changeWImode managed
  ```
  * The only argument passed will be the mode you want to change the Wireless Interface to
  * The Wireless Interface used will be the one the user has saved in the settings page
    
---

* #### changeMac
* With the `changeMac` function, you can easily change your Mac Address to either a random or specific one
  ```sh
  changeMac 
  # ...
  changeMac "00:d0:70:00:20:69"
  # ...
  changeMac reset
  ```
  * If no argument is passed, a random Mac Address will be choosen to replace your current
  * Optionally, you can specify what you want your Mac Address to be
  * `reset` will set your Wireless Interface back to it's default permanent Mac Address
  * The Wireless Interface used will be the one the user has saved in the settings
---

* #### $WI
* The `WI` variable holds the name of the Wireless Interface (e.g. `wlan0`)
* This is obtained from the user's settings and changed in the settings page also

---

* #### $PRIMARY & $SECONDARY
* The `$PRIMARY` variable holds the color code for the primary (*no shit*) color
* The `$SECONDARY` variable holds the color code for the secondary (*no shit again*) color
* Make sure to escape it like such
  ```sh
  echo -e "${PRIMARY}Hello ${SECONDARY}World!"
  ```
* Even though it is not neccesary to use these variables, it is highly recommended so your script stays in sync with the user's settings

---
### **python**
Sadly this language does not have any premade functions or variables **yet**!

---


## Setup
The custom script creation process.

* To create a new Custom Script, firstly <a href="#initiation">start up TropX</a> **(*No Shit*)**
* Afterwards, select `M` to Manage Scripts
* Choose the first option `1` to create a new script
* Type in the script name and continue
* Select the script language or github
* Select the way in which you want to provide TropX with the script and confirm

## Share your script
TropX is still looking for more tools and scripts!
* If you believe that you made a decent tool or script that you would like featured as a default, make sure to share it with us
* Firstly, head on over to the TropX directory in your file manager
* Then, head on over to the `custom_scripts` folder
* When there, locate the folder of the custom script you wish to upload
* Copy the `main.sh` file
* Upload it to this [Google Form](https://forms.gle/VS78nDGNCdn6jE5S7 "Upload Your Script Within This Form")

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
# Roadmap

View our Trello Roadmap: [Trello TropX](https://trello.com/b/GItUPVEs/tropx "Trello Roadmap for TropX")


See the [open issues](https://github.com/troopek/TropX/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
# Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
# License

Distributed under the Apache 2.0 License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
# Contact

eugene.chicevic@gmail.com

Project Link: [https://github.com/troopek/TropX](https://github.com/troopek/TropX)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
# Credits
Big shoutout to all these people as their scripts helped make TropX possible, make sure to check them out!

* Netattack2 by Chrizater
* WifiSpammer by 125k
* Ducky Flasher by Hak5

<p align="right">(<a href="#top">back to top</a>)</p>


# Donate
TropX is a free tool, and the only source of income generated by it is trough your donations.

<a href="https://www.paypal.me/troopekyt">
<img src="https://raw.githubusercontent.com/aha999/DonateButtons/master/Paypal.png" data-canonical-src="https://www.paypal.me/troopekyt" width="300" />
</a>

<!-- Compatibility -->
# Compatibility

* Kali Linux
* BlackArch Linux
* Ubuntu
* Kali Nethunter
* Parrot OS
* Windows (using [Cygwin](https://www.cygwin.com/setup-x86_64.exe))
* MacOS
* Android (using termux on rooted devices)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- TROUBLESHOOTING -->
# Troubleshooting

* Is troopek cool?
  * Yes
* Does it have bugs?
  * Absolutely not &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'nt

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- DISCLAIMER -->
# Disclaimer

I am not held responsible for any misdeeds done with the help of this tool, I provide it to you for educational purposes only. By using this tool you accept that I am not held responsible for any consequences your usage of my tool might yield.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/troopek/TropX.svg?style=for-the-badge
[contributors-url]: https://github.com/troopek/TropX/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/troopek/TropX.svg?style=for-the-badge
[forks-url]: https://github.com/troopek/TropX/network/members
[stars-shield]: https://img.shields.io/github/stars/troopek/TropX.svg?style=for-the-badge
[stars-url]: https://github.com/troopek/TropX/stargazers
[issues-shield]: https://img.shields.io/github/issues/troopek/TropX.svg?style=for-the-badge
[issues-url]: https://github.com/troopek/TropX/issues
[license-shield]: https://img.shields.io/github/license/troopek/TropX.svg?style=for-the-badge
[license-url]: https://github.com/troopek/TropX/blob/master/LICENSE.txt
