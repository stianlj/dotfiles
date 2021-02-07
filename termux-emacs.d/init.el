;; init.el --- Description -*- lexical-binding: t; -*-

;; Emacs config for Android devices to make org-capture work through share button
;; Inspiration: https://gist.github.com/tylergrinn/4b4f4d37e630988eff4d881e4e26360d

;;; Code:
(when (file-exists-p "./variables.el")
  (load-file "./variables.el"))

(package-initialize)
(require 'org)
(require 'org-protocol)

;; Revert buffers automatically if changed on disk. This is useful if you're using
;; a daemon and viewing shared files via tramp or syncthing or whichever tool.
(global-auto-revert-mode t)

(setq org-capture-templates
      '(("L" "Link" entry
         ;; Place new links in the 'IN.org' file under the top-level headline 'Mobile'
         (file+headline (lambda () (concat my-org-directory "IN.org")) "Mobile")
         ;; Ex: ** [[https://google.com][Google]]\n   [2021-01-23 Sat 08:07]\n\n   Cool site I found
         "* %:annotation\n  %U\n\n  %i"
         :prepend t
         ;; Immediate finish is required to save the file if run from the command line.
         :immediate-finish t
         ;; Kill the buffer after inserting capture if it is not already opened. This prevents
         ;; overwriting IN.org from another device or daemon
         :kill-buffer t
         ("N" "Note" entry
          ;; Place new notes in the 'IN.org' file under the top-level headline 'Mobile'
          (file+headline (lambda () (concat my-org-directory "IN.org")) "Mobile")
          ;; Ex: ** Here's that fix for the bug\n   [2021-01-23 Sat 08:07]\n\n   rm -rf /
          "* %:description\n  %U\n\n  %i"
          :prepend t
          ;; Immediate finish is required to save the file if run from the command line.
          :immediate-finish t
          ;; Kill the buffer after inserting capture if it is not already opened. This prevents
          ;; overwriting IN.org from another device or daemon
          :kill-buffer t))))
