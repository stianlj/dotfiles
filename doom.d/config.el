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
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :weight 'semi-bold :size 19)
      doom-variable-pitch-font (font-spec :family "Roboto" :weight 'normal :size 19)
      doom-unicode-font (font-spec :family "Noto Color Emoji" :size 18)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :weight 'semi-bold :size 28))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(setq mixed-pitch-set-height t)
(set-face-attribute 'variable-pitch nil :height 180)

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-constant-face :slant italic :family "VictorMono Nerd Font Mono" :weight bold)
  '(font-lock-function-name-face :weight bold)
  '(font-lock-variable-name-face :weight bold)
  '(font-lock-keyword-face :slant italic))

(font-lock-add-keywords 'js2-mode '(("\\<\\(return\\)" 1 '(:slant italic
                                                           :weight bold
                                                           :family "VictorMono Nerd Font Mono"
                                                           :inherit font-lock-keyword-face) t)))

(ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!=" "=:="
                                     "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***"
                                     ";;" "!!" "??" "?:" "?." "?=" "<:" ":<" ":>"
                                     ">:" "<>" "<<<" ">>>" "<<" ">>" "||" "-|"
                                     "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                                     "#{" "#[" "]#" "#(" "#?" "#_" "#_("
                                     "#:" "#!" "#=" "^=" "<$>" "<$" "$>" "<+>"
                                     "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>"
                                     "<!--" "<#--" "-->" "->" "->>" "<<-" "<-"
                                     "<=<" "=<<" "<<=" "<==" "<=>" "<==>" "==>"
                                     "=>" "=>>" ">=>" ">>=" ">>-" ">-" ">--"
                                     "-<" "-<<" ">->" "<-<" "<-|" "<=|" "|=>"
                                     "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>"
                                     "~>" "~-" "-~" "~@" "[||]" "|]" "[|" "|}"
                                     "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                                     "|||>" "<|||" "<|>" "..." ".." ".=" ".-"
                                     "..<" ".?" "::" ":::" ":=" "::=" ":?"
                                     ":?>" "//" "///" "/*" "*/" "/=" "//="
                                     "/==" "@_" "__" "\\/" "/\\"))

(global-ligature-mode t)

;; (defun slj/resize-variable-pitch-font()
;;   (setq doom-variable-pitch-font (font-spec :family "Roboto" :size 29))
;;   )

;; (add-hook! 'doom-big-font-mode-hook #'slj/resize-variable-pitch-font)

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
 "C-l" #'evil-window-right)

;; (setq +format-with-lsp nil)
(setq-hook! 'js2-mode-hook +format-with-lsp nil)
(setq lsp-intelephense-files-max-size 10000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-log-io t)

;; Org mode
(setq org-directory "~/Nextcloud/Documents/Org")
(setq org-roam-directory "~/Nextcloud/Documents/Org/Roam")

(defun slj/org-mode-visual()
  (setq visual-fill-column-width 120
        display-fill-column-indicator nil)
  (visual-fill-column-mode 1))

(add-hook! 'org-mode-hook #'mixed-pitch-mode #'doom-disable-line-numbers-h #'slj/org-mode-visual)

(setq org-image-actual-width 500)

;; (defun slj/capture-report-data-file (path)
;;   (let ((name (read-string "Name: ")))
;;     (expand-file-name (format "%s-%s.org"
;;                               (format-time-string "%Y")
;;                               name) path)))
(require 'org-habit)
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
    '(org-checkbox nil :inherit 'fixed-pitch))

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-time 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-start-on-weekday 1)

  (setq deft-directory "~/Nextcloud/Documents/Org"
        deft-extensions '("org")
        deft-recursive t)
  (setq org-agenda-files
        '("~/Nextcloud/Documents/Org/Projects/"
          "~/Nextcloud/Documents/Org/Tasks.org"
          "~/Nextcloud/Documents/Org/Habits.org"))
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
          (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "PROJ(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

  (setq org-refile-targets
        '(("Archive.org" :maxlevel . 1)
          ("Tasks.org" :maxlevel . 1)))

  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-tag-alist
        '((:startgroup)
          (:endgroup)
          ("@home" . ?H)
          ("@work" . ?W)
          ("@computer" . ?c)
          ("agenda" . ?a)
          ("planning" . ?p)
          ("note" . ?n)
          ("idea" . ?i)))

  (setq org-agenda-custom-commands
        '(("d" "Dashboard"
           ((agenda "" ((org-deadline-warning-days 7)))
            (todo "NEXT"
                  ((org-agenda-overriding-header "Next Tasks")))
            (todo "PROJ" ((org-agenda-overriding-header "Active Projects")))))

          ("n" "Next Tasks"
           ((todo "NEXT"
                  ((org-agenda-overriding-header "Next Tasks")))))

          ("h" "Home Tasks" tags-todo "+@home")

          ;; Low-effort next actions
          ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
           ((org-agenda-overriding-header "Low Effort Tasks")
            (org-agenda-max-todos 20)
            (org-agenda-files org-agenda-files)))

          ("w" "Workflow Status"
           ((todo "WAIT"
                  ((org-agenda-overriding-header "Waiting on External")
                   (org-agenda-files org-agenda-files)))
            (todo "REVIEW"
                  ((org-agenda-overriding-header "In Review")
                   (org-agenda-files org-agenda-files)))
            (todo "PLAN"
                  ((org-agenda-overriding-header "In Planning")
                   (org-agenda-todo-list-sublevels nil)
                   (org-agenda-files org-agenda-files)))
            (todo "BACKLOG"
                  ((org-agenda-overriding-header "Project Backlog")
                   (org-agenda-todo-list-sublevels nil)
                   (org-agenda-files org-agenda-files)))
            (todo "READY"
                  ((org-agenda-overriding-header "Ready for Work")
                   (org-agenda-files org-agenda-files)))
            (todo "PROJ"
                  ((org-agenda-overriding-header "Active Projects")
                   (org-agenda-files org-agenda-files)))
            (todo "COMPLETED"
                  ((org-agenda-overriding-header "Completed Projects")
                   (org-agenda-files org-agenda-files)))
            (todo "CANC"
                  ((org-agenda-overriding-header "Cancelled Projects")
                   (org-agenda-files org-agenda-files)))))))

  (setq org-capture-templates
        `(("t" "🏢 Tasks")
          ("tt" "🔨 Task" entry (file+olp "~/Nextcloud/Documents/Org/Tasks.org" "Inbox")
           "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

          ("tn" "📩 Next" entry (file+olp "~/Nextcloud/Documents/Org/Tasks.org" "Inbox")
           "* NEXT %?\n  %U\n  %a\n  %i" :empty-lines 1)

          ;; ("tp" "🧑‍ New project" entry (slj/capture-report-data-file "~/Nextcloud/Documents/Org/Projects")
          ;;  "#+TITLE:%?\n %U\n* Notater\n* Møter\n* Oppgaver\n** PROJ %?" :empty-lines 1)

          ;; TODO: Add project capture. New org file. Add folder to agenda

          ;; ("j" "Journal Entries")
          ;; ("jj" "Journal" entry
          ;;  (file+olp+datetree "~/Nextcloud/Documents/Org/Journal.org")
          ;;  "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
          ;;  ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
          ;;  :clock-in :clock-resume
          ;;  :empty-lines 1)
          ;; ("jm" "Meeting" entry
          ;;  (file+olp+datetree "~/Nextcloud/Documents/Org/Journal.org")
          ;;  "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
          ;;  :clock-in :clock-resume
          ;;  :empty-lines 1)

          ("n" "📔 Notes")

          ("nl" "🎁 Wishlist" entry
           (file+olp "~/Nextcloud/Documents/Org/Web-resources.org" "Wishlist")
           "** %(org-cliplink-capture)\n %U\n %a\n %i" :empty-lines 1)

          ("nw" "💨 Web resource" entry
           (file+olp "~/Nextcloud/Documents/Org/Web-resources.org" "Inbox")
           "** %(org-cliplink-capture)\n %U\n %a\n %i" :empty-lines 1))))

;; ("w" "Workflows")
;; ("we" "Checking Email" entry (file+olp+datetree "~/Nextcloud/Documents/Org/Journal.org")
;;  "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)


;; Calendar
(setq calendar-week-start-day 1)

;; Web
(setq css-indent-offset 2
      js2-basic-offset 2
      js-switch-indent-offset 2
      js-indent-level 2
      js2-mode-show-parse-errors nil
      js2-mode-show-strict-warnings nil
      web-mode-attr-indent-offset 2
      web-mode-code-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-markup-indent-offset 2
      web-mode-enable-current-element-highlight t
      web-mode-enable-current-column-highlight t)
(setq-default typescript-indent-level 2)

;; Elfeed
(setq rmh-elfeed-org-files '("~/Nextcloud/Documents/Org/elfeed.org"))

;; Etc
(add-to-list 'auto-mode-alist `(,(rx "sxhkdrc" string-end) . sxhkd-mode))
(add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode))
