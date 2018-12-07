;;; wiki-this.el --- Simply search in Wikipedia under point.                     -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Shen, Jen-Chieh
;; Created date 2018-12-07 00:42:51

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Simply search in Wikipedia under point.
;; Keyword: search wiki wikipedia
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4") (s "1.12.0"))
;; URL: https://github.com/jcs090218/wiki-this

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Simply search in Wikipedia under point.
;;

;;; Code:

(require 's)


(defgroup wiki-this nil
  "Simply search in Wikipedia under point"
  :prefix "wiki-this-"
  :group 'convenience
  :link '(url-link :tag "Repository" "https://github.com/jcs090218/wiki-this"))


(defcustom wiki-this-wiki-url "https://-LANG-.wikipedia.org/wiki/"
  "Wikipedia url format."
  :group 'wiki-this
  :type 'string)

(defvar wiki-this-language "en"
  "Language perfer to search with Wikipedia.")


(defun wiki-this-prefix-url ()
  "Get the prefix url for Wikipedia."
  (s-replace "-LANG-" wiki-this-language wiki-this-wiki-url))

(defun wiki-this-keyword-to-url (keyword)
  "Convert KEYWORD to url and return it."
  (let ((keyword-url ""))
    (setq keyword-url (s-replace " " "_" keyword))
    keyword-url))

(defun wiki-this-url (keyword)
  "Return the full url for Wikipedia by KEYWORD."
  (concat (wiki-this-prefix-url) (wiki-this-keyword-to-url keyword)))

;;;###autoload
(defun wiki-this ()
  "Search under the point."
  (interactive)
  (let ((final-url "")
        (keyword ""))
    (if (use-region-p)
        (setq keyword (buffer-substring (region-beginning) (region-end)))
      (setq keyword (thing-at-point 'word)))

    ;; Do the search.
    (when keyword
      (setq final-url (wiki-this-url keyword))
      (message "URL: %s" final-url)
      (browse-url final-url))))

(provide 'wiki-this)
;;; wiki-this.el ends here
