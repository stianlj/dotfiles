(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package no-littering)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq inhibit-startup-message t
      visible-bell t)

(load (locate-user-emacs-file "local-variables.el"))

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq org-roam-directory slj/org-roam-directory)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 15)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(setq use-dialog-box nil)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

(global-display-line-numbers-mode 1)
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "MonoLisa" :height 125)
(set-face-attribute 'fixed-pitch nil :font "MonoLisa" :height 125)
(set-face-attribute 'variable-pitch nil :font "Ubuntu" :height 145 :weight 'regular)
(setq-default line-spacing 0.1)

(hl-line-mode 1)

(use-package recentf
  :config
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)
  (add-to-list 'recentf-exclude slj/dotfiles-directory)
  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 25))

(setq history-length 25)
(savehist-mode 1)
(save-place-mode 1)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'catppuccin t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 5)
			  (bookmarks . 5)
			  (agenda . 5)))
  (dashboard-setup-startup-hook))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tokyo-night t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode))

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)


;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package consult
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  :init
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)
  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   :preview-key '(:debounce 0.4 any))
  (setq consult-project-function nil)
)

(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package all-the-icons
  :ensure t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package helpful
  :ensure t
  :bind
   ([remap describe-key] . helpful-key)
   ([remap describe-command] . helpful-command)
   ([remap describe-variable] . helpful-variable)
   ([remap describe-function] . helpful-callable))

(defun slj/org-font-setup ()
  (custom-set-faces
    `(org-document-title ((t (:height 1.3))))
    `(org-level-1 ((t (:inherit outline-1 :weight extra-bold))))
    `(org-level-2 ((t (:inherit outline-2 :weight bold))))
    `(org-level-3 ((t (:inherit outline-3 :weight bold))))
    `(org-level-4 ((t (:inherit outline-4 :weight bold))))
    `(org-level-5 ((t (:inherit outline-5 :weight semi-bold))))
    `(org-level-6 ((t (:inherit outline-6 :weight semi-bold))))
    `(org-level-7 ((t (:inherit outline-7 :weight semi-bold))))
    `(org-level-8 ((t (:inherit outline-8 :weight semi-bold))))
    `(org-block ((nil (:foreground nil :inherit 'fixed-pitch))))
    `(org-code ((nil (:inherit 'fixed-pitch))))
    `(org-table ((nil (:inherit 'fixed-pitch))))
    `(org-verbatim ((nil (:inherit 'fixed-pitch))))
    `(org-special-keyword ((nil (:inherit 'fixed-pitch))))
    `(org-document-info-keyword ((nil (:inherit 'fixed-pitch))))
    `(org-meta-line ((nil (:inherit 'fixed-pitch))))
    `(org-checkbox ((nil (:inherit 'fixed-pitch))))))

(defun slj/org-mode-setup ()
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . slj/org-mode-setup)
  :config

  (setq org-directory slj/org-directory)
  (setq org-ellipsis " ▾")
  (setq org-superstar-todo-bullet-alist
	'(("TODO" . ?☐)
	  ("NEXT" . ?☐)
	  ("HOLD" . ?🤚)
	  ("HAPPENING" . ?🌴)
	  ("PROJECT" . ?🚧)
	  ("WAITING" . ?☕)
	  ("CANCELLED" . ?✘)
	  ("DONE" . ?✔)))
  ;;(org-superstar-restart)
  (setq org-startup-indented t
	org-adapt-indentation t
	org-pretty-entities t
	org-hide-emphasis-markers t
	org-startup-with-inline-images t
	org-image-actual-width '(300))
  (setq evil-auto-indent t)
  (setq org-agenda-files slj/org-agenda-files)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-time 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-start-on-weekday 1)
  (setq org-habit-graph-column 60)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
          (sequence "HOLD(h)" "WAITING(w)" "HAPPENING(H)" "PROJECT(p)" "|" "COMPLETED(c)" "CANCELLED(k@)")))

  (setq org-refile-targets slj/org-refile-targets)

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
            (todo "PROJECT" ((org-agenda-overriding-header "Active Projects")))))

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
           ((todo "WAITING"
                  ((org-agenda-overriding-header "Waiting on External")
                   (org-agenda-files org-agenda-files)))
            (todo "PROJECT"
                  ((org-agenda-overriding-header "Active Projects")
                   (org-agenda-files org-agenda-files)))
            (todo "COMPLETED"
                  ((org-agenda-overriding-header "Completed Projects")
                   (org-agenda-files org-agenda-files)))
            (todo "CANCELLED"
                  ((org-agenda-overriding-header "Cancelled Projects")
                   (org-agenda-files org-agenda-files)))))))

  (setq org-capture-templates
        `(("t" "🏢 Tasks")
          ("tt" "🔨 Task" entry (file+olp ,(concat org-directory "/Tasks.org") "Inbox")
           "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

          ("tn" "📩 Next" entry (file+olp ,(concat org-directory "/Tasks.org") "Inbox")
           "* NEXT %?\n  %U\n  %a\n  %i" :empty-lines 1)

          ("n" "📔 Notes")

          ("nl" "🎁 Wishlist" entry
           (file+olp ,(concat org-directory "/Web-resources.org") "Wishlist")
           "** %(org-cliplink-capture)\n %U\n %a\n %i" :empty-lines 1)

          ("nw" "💨 Web resource" entry
           (file+olp ,(concat org-directory "/Web-resources.org") "Inbox")
           "** %(org-cliplink-capture)\n %U\n %a\n %i" :empty-lines 1)

          ("np" "🎵 Playlist item" entry
           (file+olp ,(concat org-directory "/Playlists.org") "Inbox")
           "** %i\n %U\n %a" :empty-lines 1)

          ("g" "😞 Generic")

          ("gw" "Web resource" entry
           (file+olp ,(concat org-directory "/Web-resources.org") "Inbox")
           "%i" :empty-lines 1 :immediate-finish 1)))

  (slj/org-font-setup))

(defun slj/org-roam-rg-search ()
 "Run consult-ripgrep on the org roam directory"
 (interactive)
 (consult-ripgrep org-roam-directory nil))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n s" . slj/org-roam-rg-search)
	 :map org-mode-map
	 ("C-M-i"   . completion-at-point))
  :config
  (org-roam-setup))

(defun slj/org-mode-visual-fill ()
  (setq visual-fill-column-width 120)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . slj/org-mode-visual-fill))

(use-package org-appear
  :after org
  :custom
  (org-appear-autoemphasis  t)
  (org-appear-autolinks t)
  (org-appear-autosubmarkers t)
  :hook (org-mode . org-appear-mode))

(use-package org-superstar
  :config
  (setq org-superstar-special-todo-items t)
  (add-hook 'org-mode-hook (lambda ()
			     (org-superstar-mode 1))))

(use-package org-cliplink
  :ensure t)

(use-package org-yt
  :straight (org-yt :type git :host github :repo "TobiasZawada/org-yt"))

(use-package magit
  :ensure t)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(require 'org-tempo)
(require 'org-crypt)
(require 'epa-file)
(epa-file-enable)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key nil)

;(use-package evil-org
;  :ensure t
;  :after org
; :hook (org-mode . (lambda () evil-org-mode))
; :config
; (require 'evil-org-agenda)
; (evil-org-agenda-set-keys))

;; Look at this list, especially `evil-nerd-commenter`
;; https://github.com/doomemacs/doomemacs/blob/master/modules/editor/evil/packages.el
;; And https://hugocisneros.com/org-config/

(with-eval-after-load 'org

  (defun slj-org-get-level-face (n)
    "Get the right face for match N in font-lock matching of headlines.
Modifies the orginal to make the font of the last star and the space
after it also inherit the fixed-pitch font."
    (let* ((org-l0 (- (match-end 2) (match-beginning 1) 1))
       (org-l (if org-odd-levels-only (1+ (/ org-l0 2)) org-l0))
       (org-f (if org-cycle-level-faces
              (nth (% (1- org-l) org-n-level-faces) org-level-faces)
            (nth (1- (min org-l org-n-level-faces)) org-level-faces))))
      (cond
       ((eq n 1) (if org-hide-leading-stars 'org-hide org-f))
       ((eq n 2) `((t :inherit (fixed-pitch ,org-f)))) ;; changed here only
       (t (unless org-level-color-stars-only org-f)))))

  (advice-add 'org-get-level-face :override #'slj-org-get-level-face))

(add-hook 'org-mode-hook
          (lambda () 
            (set-face-attribute 'org-hide nil :inherit 'fixed-pitch)))

;;; System org-capture
;;; taken from: https://www.reddit.com/r/emacs/comments/74gkeq/system_wide_org_capture/
;;; USAGE: emacsclient -c -F '(quote (name . "capture"))' -e '(slj/activate-capture-frame)'
(defadvice org-switch-to-buffer-other-window
    (after supress-window-splitting activate)
  "Delete the extra window if we're in a capture frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-other-windows)))

(defun slj/org-capture/open-frame ()
  "run org-capture in capture frame"
  (select-frame-by-name "capture")
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (org-capture))

(defun slj/org-roam-capture/open-frame ()
  "run org-roam-capture in capture frame"
  (select-frame-by-name "capture")
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (org-roam-capture))

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (when (and (equal "capture" (frame-parameter nil 'name))
	     (not (eq this-command 'org-capture-refile)))
    (delete-frame)))

(defadvice org-capture-refile
    (after delete-capture-frame activate)
  "Advise org-refile to close the frame"
  (delete-frame))
