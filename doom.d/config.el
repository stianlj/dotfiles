;; VARIABLES AND ENVIRONMENT
(setq computer-identifier (getenv "COMPUTER_IDENTIFIER")
      env-user-full-name (getenv "USER_FULL_NAME")
      env-user-mail-address (getenv "USER_MAIL_ADDRESS"))

(setenv "SHELL" "/usr/bin/fish")
(global-evil-quickscope-mode 1)

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
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; MAIL
(when (string-match-p computer-identifier "main-desktop")
  (after! mu4e
    (setq mu4e-root-maildir (expand-file-name "~/Mail/Main")
          mu4e-headers-date-format "%d/%m/%Y"
          mu4e-headers-time-format "%H:%M"
          mu4e-drafts-folder "/Drafts"
          mu4e-sent-folder "/Sent"
          mu4e-trash-folder "/Trash"
          mu4e-spam-folder "/Spam"
          mu4e-refile-folder "/Archive")

    (setq! mu4e-get-mail-command "offlineimap")

    (setq mu4e-bookmarks '(("maildir:/INBOX" "Inbox" ?i)
                           ("maildir:/INBOX AND flag:flagged" "Flagged messages" ?f)
                           ("maildir:/INBOX AND flag:unread" "Unread messages" ?u)
                           ("maildir:/INBOX AND date:today..now" "Today's messages" ?t)
                           ("maildir:/INBOX AND date:7d..now" "Last 7 days" ?w)))

    ;; Mark as read and move to spam
    (add-to-list 'mu4e-marks
                 '(spam
                   :char "S"
                   :prompt "Spam"
                   :show-target (lambda (target) mu4e-spam-folder)
                   :action (lambda (docid msg target)
                             (mu4e~proc-move docid mu4e-spam-folder "+S-u-N"))))

    (mu4e~headers-defun-mark-for spam)
    (define-key mu4e-headers-mode-map (kbd "S") 'mu4e-headers-mark-for-spam)
    )
  )

;; PROJECTILE
(when (string-match-p computer-identifier "work-laptop")
  (setq projectile-project-search-path '("~/Code/Work/applications"))
  )

;; MAGIT
;; (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

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

;; ELFEED
(setq rmh-elfeed-org-files '("~/Documents/Notes/elfeed.org"))

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
