;; Variables and environment
(setq env-user-full-name (getenv "USER_FULL_NAME")
      env-user-mail-address (getenv "USER_MAIL_ADDRESS"))

(setenv "SHELL" "/usr/bin/fish")
(global-evil-quickscope-mode 1)

(let ((computer-specific-config (format "~/.doom.d/computers/init.%s.el" (getenv "COMPUTER_IDENTIFIER"))))
  (when (file-exists-p computer-specific-config)
    (load-file computer-specific-config)))

;; User
(setq user-full-name env-user-full-name
      user-mail-address env-user-mail-address)

;; Doom config
(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "Roboto" :size 19)
      doom-unicode-font (font-spec :family "Noto Color Emoji" :size 18)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 28))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(setq mixed-pitch-set-height t)
(set-face-attribute 'variable-pitch nil :height 180)
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(map! :leader
      :desc "Load new theme"
      "h t" #'counsel-load-theme)

(setq fancy-splash-image
      (concat doom-private-dir "splash/doom-emacs-color2.svg"))

;; Modeline
(display-time-mode 1)
(setq display-time-24hr-format 1)

;; Editor
(setq display-line-numbers-type 'relative)
(after! git-gutter-fringe
  (fringe-mode '10))

(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Bindings
(map!
 "C-h" #'evil-window-left
 "C-j" #'evil-window-down
 "C-k" #'evil-window-up
 "C-l" #'evil-window-right
 )

(setq +format-with-lsp nil)
(setq lsp-intelephense-files-max-size 10000000)

;; Org mode
(setq org-directory "~/Nextcloud/Documents/Org")
(setq org-roam-directory "~/Nextcloud/Documents/Org/Roam")

(setq deft-directory "~/Nextcloud/Documents/Org"
      deft-extensions '("org")
      deft-recursive t)

(defun slj/org-mode-visual()
  (setq visual-fill-column-width 120
        display-fill-column-indicator nil)
  (visual-fill-column-mode 1))

(add-hook! 'org-mode-hook #'mixed-pitch-mode #'doom-disable-line-numbers-h #'slj/org-mode-visual)

(after! org
  (custom-set-faces!
    '(org-document-title :height 1.3)
    '(org-level-1 :inherit outline-1 :weight extra-bold :height 1.4)
    '(org-level-2 :inherit outline-2 :weight bold :height 1.15)
    '(org-level-3 :inherit outline-3 :weight bold :height 1.12)
    '(org-level-4 :inherit outline-4 :weight bold :height 1.09)
    '(org-level-5 :inherit outline-5 :weight semi-bold :height 1.06)
    '(org-level-6 :inherit outline-6 :weight semi-bold :height 1.03)
    '(org-level-7 :inherit outline-7 :weight semi-bold)
    '(org-level-8 :inherit outline-8 :weight semi-bold)
    '(org-block nil :foreground nil :inherit 'fixed-pitch)
    '(org-code nil :inherit '(shadow fixed-pitch))
    '(org-table nil :inherit '(shadow fixed-pitch))
    '(org-verbatim nil :inherit '(shadow fixed-pitch))
    '(org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-checkbox nil :inherit 'fixed-pitch)))

;; Javascript/Typescript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

;; Elfeed
(setq rmh-elfeed-org-files '("~/Nextcloud/Documents/Org/elfeed.org"))
