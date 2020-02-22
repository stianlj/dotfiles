(setq user-full-name "Stian Lund Johansen"
      user-mail-address "stian@lundjohansen.no")
(setq doom-font (font-spec :family "Source Code Pro Semibold" :size 28))

(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(setq display-line-numbers-type 'relative)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
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
