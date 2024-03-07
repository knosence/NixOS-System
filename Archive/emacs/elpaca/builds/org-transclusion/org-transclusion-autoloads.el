;;; org-transclusion-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:



;;; Generated autoloads from org-transclusion.el

(autoload 'org-transclusion-mode "org-transclusion" "\
Toggle Org-transclusion minor mode.

This is a minor mode.  If called interactively, toggle the
`Org-Transclusion mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `org-transclusion-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(autoload 'org-transclusion-activate "org-transclusion" "\
Activate Org-transclusion hooks and other setups in the current buffer.
This function does not add transclusions; it merely sets up hooks
and variables." t)
(autoload 'org-transclusion-make-from-link "org-transclusion" "\
Make a transclusion keyword from a link at point.

The resultant transclusion keyword will be placed in the first
next empty line.  If there is no empty line until the bottom of
the buffer, this function adds a new empty line.

When minor-mode `org-transclusion-mode' is active, this function
automatically transcludes the text content; when it is inactive,
it simply adds the \"#+transclude\" keyword before the link and
inserts the whole line.

If you pass a `universal-argument', this function reverses this:
if the mode is active, the keyword gets inserted; if the mode is
inactive, the transclusion gets added.

You can pass a prefix argument (ARG) with using
`digit-argument' (e.g. C-1 or C-2; or \\[universal-argument] 3,
so on) or `universal-argument' (\\[universal-argument]).

If you pass a positive number 1-9 with `digit-argument', this
function automatically puts the :level property to the resultant
transclusion keyword.

(fn &optional ARG)" t)
(autoload 'org-transclusion-add "org-transclusion" "\
Transclude text content for the #+transclude at point.
When minor-mode `org-transclusion-mode' is inactive in the
current buffer, this function toggles it on.

Examples of acceptable formats are as below:

- \"#+transclude: [[file:path/file.org::search-option][desc]]:level n\"
- \"#+transclude: [[id:uuid]] :level n :only-contents\"

The file path or id in the transclude keyword value are
translated to the normal Org Mode link format such as
[[file:path/tofile.org::*Heading]] or [[id:uuid]] to copy a piece
of text from the link target.

TODO: id:uuid without brackets [[]] is a valid link within Org
Mode. This is not supported yet.

A transcluded text region is read-only. You can use a variety of
commands on the transcluded region at point. Refer to the
commands below. You can customize the keymap with
using `org-transclusion-map'.

For example, `org-transclusion-live-sync-start' lets you edit the
part of the text at point.  This edit mode is analogous to Occur
Edit for Occur Mode.

TODO: that for transclusions of Org elements/buffer, live-sync
does not support all the elements.

\\{org-transclusion-map}

(fn &optional COPY)" t)
(autoload 'org-transclusion-add-all "org-transclusion" "\
Add all active transclusions in the current buffer.

By default, this function temporarily widens the narrowed region
you are in and works on the entire buffer.  Note that this
behavior is important for `org-transclusion-after-save-buffer' in
order to clear the underlying file of all the transcluded text.

For interactive use, you can pass NARROWED with using
`universal-argument' (\\[universal-argument]) to get this
function to work only on the narrowed region you are in, leaving
the rest of the buffer unchanged.

(fn &optional NARROWED)" t)
(register-definition-prefixes "org-transclusion" '("org-transclusion-"))


;;; Generated autoloads from org-transclusion-font-lock.el

(register-definition-prefixes "org-transclusion-font-lock" '("org-transclusion-font"))


;;; Generated autoloads from org-transclusion-indent-mode.el

(register-definition-prefixes "org-transclusion-indent-mode" '("org-trans"))


;;; Generated autoloads from org-transclusion-src-lines.el

(register-definition-prefixes "org-transclusion-src-lines" '("org-transclusion-"))


;;; Generated autoloads from text-clone.el

(register-definition-prefixes "text-clone" '("text-clone-"))

;;; End of scraped data

(provide 'org-transclusion-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; org-transclusion-autoloads.el ends here
