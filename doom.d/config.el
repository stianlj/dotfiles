;; VARIABLES AND ENVIRONMENT
(setq font-size (string-to-number (getenv "EMACS_FONT_SIZE")))
(setenv "SHELL" "/usr/bin/fish")

;; USER
(setq user-full-name "Stian Lund Johansen"
      user-mail-address "stian@lundjohansen.no")

;; DOOM CONFIG
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "Source Code Pro Semibold" :size font-size))

;; MODELINE
(display-time-mode 1)
(display-battery-mode 1)
(setq display-time-24hr-format 1)

;; EDITOR
(setq display-line-numbers-type 'relative)

;; BINDINGS
(map!
 "C-h" #'evil-window-left
 "C-j" #'evil-window-down
 "C-k" #'evil-window-up
 "C-l" #'evil-window-right
 )

;; ORG-MODE
(setq org-directory "~/org/")

;; JAVASCRIPT/TYPESCRIPT
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   (company-mode +1))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)

;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (add-hook 'typescript-mode-hook 'prettier-js-mode)
;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'web-mode-hook 'prettier-js-mode)

(eval-after-load 'js2-mode
  '(progn
    (add-hook 'js2-mode-hook #'add-node-modules-path)
    (add-hook 'js2-mode-hook #'prettier-js-mode)))

(eval-after-load 'web-mode
  '(progn
    (add-hook 'web-mode-hook #'add-node-modules-path)
    (add-hook 'web-mode-hook #'prettier-js-mode)))

(eval-after-load 'typescript-mode
  '(progn
    (add-hook 'typescript-mode-hook #'add-node-modules-path)
    (add-hook 'typescript-mode-hook #'prettier-js-mode)))
