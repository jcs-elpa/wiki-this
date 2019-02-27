[![Build Status](https://travis-ci.com/jcs090218/wiki-this.svg?branch=master)](https://travis-ci.com/jcs090218/wiki-this)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)


# wiki-this #

Simply search in Wikipedia under point.


## Configurations ##
You can set the prefer language by setting `wiki-this-language` variable. 
The default setting is `en`.
```el
(setq wiki-this-language "en")
```

## Key Bindings ##
There are no default key bindings within the plugin. You can simply bind 
`wiki-this` to any key you want.
```el
(define-key global-map (kbd "C-w i k i") #'wiki-this)
```


## Contribution ##
If you would like to contribute to this project. You may either
clone and make pull request to this repository. Or you can
clone the project and make your own branch of this tool. Any
methods are welcome!
