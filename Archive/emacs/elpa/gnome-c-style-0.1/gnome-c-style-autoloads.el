;;; gnome-c-style-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from gnome-c-align.el

(autoload 'gnome-c-align-arglist-at-point "gnome-c-align" "\
Reformat argument list at point, aligning argument to the right end.

(fn &optional IDENTIFIER-START-COLUMN)" t)
(autoload 'gnome-c-align-set-column "gnome-c-align" "\
Set alignment column of SYMBOL.

(fn SYMBOL)" t)
(autoload 'gnome-c-align-guess-optimal-columns "gnome-c-align" "\
Compute the optimal alignment rule from the declarations in BEG and END.

This sets `gnome-c-align-identifier-start-column',
`gnome-c-align-arglist-start-column', and
`gnome-c-align-arglist-identifier-start-column'.

(fn BEG END)" t)
(autoload 'gnome-c-align-guess-columns "gnome-c-align" "\
Guess the existing alignment rule from the declarations in BEG and END.

This sets `gnome-c-align-identifier-start-column',
`gnome-c-align-arglist-start-column', and
`gnome-c-align-arglist-identifier-start-column'.

(fn BEG END)" t)
(autoload 'gnome-c-align-decls-region "gnome-c-align" "\
Reformat function declarations in the region between BEG and END.

(fn BEG END)" t)
(register-definition-prefixes "gnome-c-align" '("gnome-c-align-"))


;;; Generated autoloads from gnome-c-snippet.el

(autoload 'gnome-c-snippet-insert-package_class "gnome-c-snippet" "\
Insert the class name before the current point.

(fn PACKAGE CLASS)" t)
(autoload 'gnome-c-snippet-insert-PACKAGE_CLASS "gnome-c-snippet" "\
Insert the class name before the current point.

(fn PACKAGE CLASS)" t)
(autoload 'gnome-c-snippet-insert-PackageClass "gnome-c-snippet" "\
Insert the class name (in CamelCase) before the current point.

(fn PACKAGE CLASS)" t)
(autoload 'gnome-c-snippet-insert "gnome-c-snippet" "\


(fn SNIPPET)" t)
(register-definition-prefixes "gnome-c-snippet" '("gnome-c-snippet-"))


;;; Generated autoloads from gnome-c-style.el

(autoload 'gnome-c-style-mode "gnome-c-style" "\
A minor-mode for editing GNOME-style C source code.

This is a minor mode.  If called interactively, toggle the
`GNOME-C-Style mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `gnome-c-style-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "gnome-c-style" '("gnome-c-style-mode-map"))


;;; Generated autoloads from gnome-c-tests.el

(register-definition-prefixes "gnome-c-tests" '("gnome-c-test-program-"))

;;; End of scraped data

(provide 'gnome-c-style-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; gnome-c-style-autoloads.el ends here