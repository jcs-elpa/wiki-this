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
  "Simply search in Wikipedia under point."
  :prefix "wiki-this-"
  :group 'convenience
  :link '(url-link :tag "Repository" "https://github.com/jcs090218/wiki-this"))


(defconst wiki-this-wiki-url "https://%s.wikipedia.org/wiki/%s"
  "Wikipedia url format."
  :group 'wiki-this
  :type 'string)

(defcustom wiki-this-language "en"
  "Language perfer to search with Wikipedia."
  :group 'wiki-this
  :type 'string)


(defun wiki-this-keyword-to-url (keyword)
  "Convert KEYWORD to url and return it."
  (let ((keyword-url ""))
    (setq keyword-url (s-replace " " "_" keyword))
    keyword-url))

(defun wiki-this-url (keyword)
  "Return the full url for Wikipedia by KEYWORD."
  (format wiki-this-wiki-url wiki-this-language (wiki-this-keyword-to-url keyword)))

;;;###autoload
(defun wiki-this (&optional start end)
  "Search under the point.
START : region start point.
END : region end point."
  (interactive "r")
  (let ((final-url "")
        (keyword (if (use-region-p)
                     (buffer-substring start end)
                   (thing-at-point 'symbol))))
    ;; Do the search.
    (if keyword
        (progn
          (setq final-url (wiki-this-url keyword))
          (browse-url final-url)
          (message "Search [%s] in Wikipedia, URL => '%s'" keyword final-url))
      (message "Nothing to search with Wikipedia!"))))

(provide 'wiki-this)
;;; wiki-this.el ends here
