#!/bin/sh

# Prepare the settings file for installation
if [ ! -f docroot/sites/default/settings.php ]
  then
    if [ -f environments/settings.php.example  ]
      then
        cp environments/settings.php.example docroot/sites/default/settings.php
      else
        cp docroot/sites/default/default.settings.php docroot/sites/default/settings.php
    fi
    chmod 777 docroot/sites/default/settings.php
fi

# Prepare the services file for installation
if [ ! -f docroot/sites/default/services.yml ]
  then
    cp docroot/sites/default/default.services.yml docroot/sites/default/services.yml
    chmod 777 docroot/sites/default/services.yml
fi

# Prepare the files directory for installation
if [ ! -d docroot/sites/default/files ]
  then
    mkdir -m777 docroot/sites/default/files
fi

# Prepare the directory for custom modules
if [ ! -d docroot/modules/custom ]
  then
    mkdir -m755 docroot/modules/custom
fi

# Prepare the directory for custom themes
if [ ! -d docroot/themes/custom ]
  then
    mkdir -p -m755 docroot/themes/custom
fi
