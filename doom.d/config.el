;; VARIABLES AND ENVIRONMENT
(setq computer-identifier (getenv "COMPUTER_IDENTIFIER")
      env-user-full-name (getenv "USER_FULL_NAME")
      env-user-mail-address (getenv "USER_MAIL_ADDRESS"))

(setenv "SHELL" "/usr/bin/fish")

;; (setq is-work-laptop (string-match-p computer-identifier "work-laptop"))
;; (defun is-work-laptop ()
;;   (when (string-match-p computer-identifier "work-laptop") t))

;; USER
(setq user-full-name env-user-full-name
      user-mail-address env-user-mail-address)

;; DOOM CONFIG
(setq doom-theme 'doom-vibrant)
(setq doom-font (font-spec :family "JetBrainsMonoMedium Nerd Font Mono" :size 18)
      doom-big-font (font-spec :family "JetBrainsMonoMedium Nerd Font Mono" :size 28))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; MODELINE
(display-time-mode 1)
(setq display-time-24hr-format 1)
(when (string-match-p computer-identifier "work-laptop") (display-battery-mode 1))

;; EDITOR
(setq display-line-numbers-type 'relative)
(display-fill-column-indicator-mode 1)
;; (setq display-fill-column-indicator-character '|')
;; (setq display-fill-column-indicator-column 80)

;; PROJECTILE
(setq projectile-project-search-path '("~/Code/Work/applications"))

;; Bindings
(map!
 "C-h" #'evil-window-left
 "C-j" #'evil-window-down
 "C-k" #'evil-window-up
 "C-l" #'evil-window-right
 )

(setq +format-with-lsp nil)
(setq lsp-intelephense-files-max-size 10000000)

;; ORG-MODE
(setq org-agenda-files '("~/org-agenda/" "~/Nextcloud/Agenda/"))
;; (setq org-directory "~/org/")
;; (if (eq 'computer-identifier "work-laptop")
;;       (setq org-agenda-files '("~/org-agenda/" "~/Nextcloud/Agenda/")))
;; (if (eq 'computer-identifier "main-desktop")
;;       (setq org-agenda-files '("~/Nextcloud/Agenda/")))

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

;; (eval-after-load 'js2-mode
;;   '(progn
;;     (add-hook 'js2-mode-hook #'add-node-modules-path)
;;     (add-hook 'js2-mode-hook #'prettier-js-mode)))

;; (eval-after-load 'web-mode
;;   '(progn
;;     (add-hook 'web-mode-hook #'add-node-modules-path)
;;     (add-hook 'web-mode-hook #'prettier-js-mode)))

;; (eval-after-load 'typescript-mode
;;   '(progn
;;     (add-hook 'typescript-mode-hook #'add-node-modules-path)
;;     (add-hook 'typescript-mode-hook #'prettier-js-mode)))
