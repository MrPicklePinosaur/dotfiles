					; basic configuration
(setq inhibit-startup-message t)
(setq visual-bell nil)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

; (setq blink-cursor-interval 0.6)

(load-theme 'modus-vivendi t)

(recentf-mode 1)
(save-place-mode 1)

(setq use-dialog-box nil)
(global-auto-revert-mode 1)

(setq display-line-numbers 'relative)

					; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (gotoOD-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; use package
(straight-use-package 'use-package)
(use-package straight :custom (straight-use-package-by-default t))

; evil mode
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)

  :config
  (setq evil-emacs-state-cursor '("#ffffff" box))
  (setq evil-normal-state-cursor '("#ffffff" box))
  (setq evil-operator-state-cursor '("#ffffff" hollow))
  (setq evil-visual-state-cursor '("#ffffff" box))
  (setq evil-insert-state-cursor '("#ffffff" (bar . 2)))
  (setq evil-replace-state-cursor '("#ffffff" hbar))
  (setq evil-motion-state-cursor '("#ffffff" box))

  (evil-mode 1))

; lsp mode
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l"))
(add-hook 'python-mode-hook #'lsp)
