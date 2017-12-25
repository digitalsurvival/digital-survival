## The Digital Survival overlay [![Build Status](https://travis-ci.org/digitalsurvival/digital-survival.svg?branch=master)](https://travis-ci.org/digitalsurvival/digital-survival) [![Join the chat at https://gitter.im/digitalsurvival/digital-survival](https://badges.gitter.im/digitalsurvival/digital-survival.svg)](https://gitter.im/digitalsurvival/digital-survival?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This repository focuses on secure communication and encryption technology, although quite a few text editor ebuilds are lurking in the depths.

Have improvements? Open a pull request. Any help is appreciated!

### Installation

This overlay uses the repos.conf repository management system. Be sure the repos.conf directory exists: `mkdir -p /etc/portage/repos.conf`

Then wget the digital-survival.conf file in the base of the repository: `wget https://raw.githubusercontent.com/digitalsurvival/digital-survival/master/digital-survival.conf -O /etc/portage/repos.conf/digital-survival.conf`

Then use `emaint` to sync the repository: `emaint sync -r digital-survival`

## Packages ##

### app-misc/nixnote ###

An open source Evernote clone for Linux. I will be working on only version 2; version 1 is obsolete.

### sys-auth/ppp-pam ###

The Perfect Paper Passwords Pluggable Authentication Module is a PAM module that enables two step verification using one time passwords.

See the [source code repository](https://github.com/digitalsurvival/ppp-pam#introduction) for additional information.

### Anaconda packages ###

All works in progress...

<sup><small><small>* The Anaconda related packages are a continuation of [wiktor-b's work](https://gitweb.gentoo.org/proj/anaconda-overlay.git/) GSoC work.</small></small></sup>

### A bunch of graphical text editors ###

* app-editors/brackets
* app-editors/lighttable
* app-editors/lighttable-bin

