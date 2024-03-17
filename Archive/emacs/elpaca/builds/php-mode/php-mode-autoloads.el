;;; php-mode-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:



;;; Generated autoloads from php.el

(let ((loads (get 'php 'custom-loads))) (if (member '"php" loads) nil (put 'php 'custom-loads (cons '"php" loads)) (put 'languages 'custom-loads (cons 'php (get 'languages 'custom-loads)))))
(autoload 'php-base-mode "php" "\
Generic major mode for editing PHP.

This mode is intended to be inherited by concrete major modes.
Currently there are `php-mode' and `php-ts-mode'.

(fn)" t)
(autoload 'php-mode-maybe "php" "\
Select PHP mode or other major mode." t)
(autoload 'php-current-class "php" "\
Insert current class name if cursor in class context." t)
(autoload 'php-current-namespace "php" "\
Insert current namespace if cursor in namespace context." t)
(autoload 'php-copyit-fqsen "php" "\
Copy/kill class/method FQSEN." t)
(autoload 'php-run-builtin-web-server "php" "\
Run PHP Built-in web server.

`ROUTER-OR-DIR': Path to router PHP script or Document root.
`HOSTNAME': Hostname or IP address of Built-in web server.
`PORT': Port number of Built-in web server.
`DOCUMENT-ROOT': Path to Document root.

When `DOCUMENT-ROOT' is NIL, the document root is obtained from `ROUTER-OR-DIR'.

(fn ROUTER-OR-DIR HOSTNAME PORT &optional DOCUMENT-ROOT)" t)
(autoload 'php-find-system-php-ini-file "php" "\
Find php.ini FILE by `php --ini'.

(fn &optional FILE)" t)
(register-definition-prefixes "php" '("php-"))


;;; Generated autoloads from php-align.el

(autoload 'php-align-setup "php-align" "\
Setup alignment configuration for PHP code.")
(autoload 'php-align-mode "php-align" "\
Alignment lines for PHP script.

This is a minor mode.  If called interactively, toggle the
`Php-Align mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `php-align-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "php-align" '("php-align-"))


;;; Generated autoloads from php-complete.el

(let ((loads (get 'php-complete 'custom-loads))) (if (member '"php-complete" loads) nil (put 'php-complete 'custom-loads (cons '"php-complete" loads)) (put 'php-mode 'custom-loads (cons 'php-complete (get 'php-mode 'custom-loads)))))
(defvar php-complete-function-modules '(bcmath core gmp libxml intl mbstring pcntl posix sodium xml xmlwriter) "\
Module names for function names completion.")
(custom-autoload 'php-complete-function-modules "php-complete" t)
(put 'php-complete-function-modules 'safe-local-variable (lambda (value) (and (listp value) (cl-loop for v in values always (assq v php-defs-functions-alist)))))
(autoload 'php-complete-complete-function "php-complete" "\
Complete PHP keyword at point.

If INTERACTIVE is nil the function acts like a capf.

(fn &optional INTERACTIVE)" t)
(register-definition-prefixes "php-complete" '("php-complete--"))


;;; Generated autoloads from php-defs.el

(register-definition-prefixes "php-defs" '("php-defs-functions-alist"))


;;; Generated autoloads from php-face.el

(let ((loads (get 'php-faces 'custom-loads))) (if (member '"php-face" loads) nil (put 'php-faces 'custom-loads (cons '"php-face" loads)) (put 'php-mode 'custom-loads (cons 'php-faces (get 'php-mode 'custom-loads)))))
(register-definition-prefixes "php-face" '("php-annotations-annotation-face"))


;;; Generated autoloads from php-flymake.el

(autoload 'php-flymake "php-flymake" "\
Flymake backend for PHP syntax check.

See `flymake-diagnostic-functions' about REPORT-FN and ARGS parameters.

(fn REPORT-FN &rest ARGS)")
(register-definition-prefixes "php-flymake" '("php-flymake-"))


;;; Generated autoloads from php-format.el

(autoload 'php-format-this-buffer-file "php-format" "\
Apply format this buffer file." t)
(autoload 'php-format-project "php-format" "\
Apply format this buffer file." t)
(autoload 'php-format-on-after-save-hook "php-format" "\
Apply format on after save hook.")
(autoload 'php-format-auto-mode "php-format" "\
Automatically apply formatting when saving an edited file.

This is a minor mode.  If called interactively, toggle the
`Php-Format-Auto mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `php-format-auto-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "php-format" '("php-format-"))


;;; Generated autoloads from php-ide.el

(defvar php-ide-features nil "\
A set of PHP-IDE features symbol.")
(custom-autoload 'php-ide-features "php-ide" t)
(put 'php-ide-features 'safe-local-variable (lambda (v) (cl-loop for feature in (if (listp v) v (list v)) always (symbolp feature))))
(defvar php-ide-eglot-executable nil "\
Command name or path to the command of Eglot LSP executable.")
(custom-autoload 'php-ide-eglot-executable "php-ide" t)
(put 'php-ide-eglot-executable 'safe-local-variable (lambda (v) (cond ((stringp v) (file-exists-p v)) ((listp v) (cl-every #'stringp v)) ((assq v php-ide-lsp-command-alist)))))
(autoload 'php-ide-eglot-server-program "php-ide" "\
Return a list of command to execute LSP Server.")
(defvar php-ide-mode-functions nil "\
Hook functions called when before activating or deactivating PHP-IDE.
Notice that two arguments (FEATURE ACTIVATE) are given.

FEATURE: A symbol, like \\='lsp-mode.
ACTIVATE: T is given when activeting, NIL when deactivating PHP-IDE.")
(custom-autoload 'php-ide-mode-functions "php-ide" t)
(put 'php-ide-mode-functions 'safe-local-variable (lambda (functions) (and (listp functions) (cl-every #'functionp functions))))
(autoload 'php-ide-mode "php-ide" "\
Minor mode for integrate IDE-like tools.

This is a minor mode.  If called interactively, toggle the
`Php-Ide mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `php-ide-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(autoload 'php-ide-turn-on "php-ide" "\
Turn on PHP IDE-FEATURES and execute `php-ide-mode'.")
(register-definition-prefixes "php-ide" '("php-ide-"))


;;; Generated autoloads from php-ide-phpactor.el

(autoload 'php-ide-phpactor-activate "php-ide-phpactor" "\
Activate PHP-IDE using phpactor.el." t)
(autoload 'php-ide-phpactor-deactivate "php-ide-phpactor" "\
Dectivate PHP-IDE using phpactor.el." t)
(register-definition-prefixes "php-ide-phpactor" '("php-ide-phpactor-"))


;;; Generated autoloads from php-local-manual.el

(autoload 'php-local-manual-search "php-local-manual" "\
Search the local PHP documentation (i.e. in `php-manual-path') for
the word at point.  The function returns t if the requested documentation
exists, and nil otherwise.

With a prefix argument, prompt (with completion) for a word to search for.

(fn WORD)" t)
(define-obsolete-function-alias 'php-search-local-documentation #'php-local-manual-search "2.0.0")
(register-definition-prefixes "php-local-manual" '("php-local-manual-"))


;;; Generated autoloads from php-mode.el

(let ((loads (get 'php-mode 'custom-loads))) (if (member '"php-mode" loads) nil (put 'php-mode 'custom-loads (cons '"php-mode" loads)) (put 'languages 'custom-loads (cons 'php-mode (get 'languages 'custom-loads)))))
(add-to-list 'interpreter-mode-alist (cons "php\\(?:-?[34578]\\(?:\\.[0-9]+\\)*\\)?" 'php-mode))
(define-obsolete-variable-alias 'php-available-project-root-files 'php-project-available-root-files "\
1.19.0")
(autoload 'php-mode "php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

(fn)" t)
(add-to-list 'auto-mode-alist '("/\\.php_cs\\(?:\\.dist\\)?\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.\\(?:php\\.inc\\|stub\\)\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.\\(?:php[s345]?\\|phtml\\)\\'" . php-mode-maybe))
(register-definition-prefixes "php-mode" '("php-"))


;;; Generated autoloads from php-mode-debug.el

(register-definition-prefixes "php-mode-debug" '("php-mode-debug"))


;;; Generated autoloads from php-project.el

(defvar-local php-project-root 'auto "\
Method of searching for the top level directory.

`auto' (default)
      Try to search file in order of `php-project-available-root-files'.

SYMBOL
      Key of `php-project-available-root-files'.

STRING
      A file/directory name of top level marker.
      If the string is an actual directory path, it is set as the absolute path
      of the root directory, not the marker.")
(put 'php-project-root 'safe-local-variable #'(lambda (v) (or (stringp v) (assq v php-project-available-root-files))))
(defvar-local php-project-etags-file nil)
(put 'php-project-etags-file 'safe-local-variable #'(lambda (v) (or (functionp v) (eq v t) (php-project--eval-bootstrap-scripts v))))
(defvar-local php-project-bootstrap-scripts nil "\
List of path to bootstrap php script file.

The ideal bootstrap file is silent, it only includes dependent files,
defines constants, and sets the class loaders.")
(put 'php-project-bootstrap-scripts 'safe-local-variable #'php-project--eval-bootstrap-scripts)
(defvar-local php-project-php-executable nil "\
Path to php executable file.")
(put 'php-project-php-executable 'safe-local-variable #'(lambda (v) (and (stringp v) (file-executable-p v))))
(defvar-local php-project-coding-style nil "\
Symbol value of the coding style of the project that PHP major mode refers to.

Typically it is `pear', `drupal', `wordpress', `symfony2' and `psr2'.")
(put 'php-project-coding-style 'safe-local-variable #'symbolp)
(defvar-local php-project-align-lines t "\
If T, automatically turn on `php-align-mode' by `php-align-setup'.")
(put 'php-project-align-lines 'safe-local-variable #'booleanp)
(defvar-local php-project-php-file-as-template 'auto "\

`auto' (default)
      Automatically switch to mode for template when HTML tag detected in file.

`t'
      Switch all PHP files in that directory to mode for HTML template.

`nil'
      Any .php  in that directory is just a PHP script.

((PATTERN . SYMBOL))
      Alist of file name pattern regular expressions and the above symbol pairs.
      PATTERN is regexp pattern.
")
(put 'php-project-php-file-as-template 'safe-local-variable #'php-project--validate-php-file-as-template)
(defvar-local php-project-repl nil "\
Function name or path to REPL (interactive shell) script.")
(put 'php-project-repl 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))
(defvar-local php-project-unit-test nil "\
Function name or path to unit test script.")
(put 'php-project-unit-test 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))
(defvar-local php-project-deploy nil "\
Function name or path to deploy script.")
(put 'php-project-deploy 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))
(defvar-local php-project-build nil "\
Function name or path to build script.")
(put 'php-project-build 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))
(defvar-local php-project-server-start nil "\
Function name or path to server-start script.")
(put 'php-project-server-start 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))
(autoload 'php-project-get-bootstrap-scripts "php-project" "\
Return list of bootstrap script.")
(autoload 'php-project-get-root-dir "php-project" "\
Return path to current PHP project.")
(autoload 'php-project-project-find-function "php-project" "\
Return path to current PHP project from DIR.

This function is compatible with `project-find-functions'.

(fn DIR)")
(register-definition-prefixes "php-project" '("php-project-"))

;;; End of scraped data

(provide 'php-mode-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; php-mode-autoloads.el ends here