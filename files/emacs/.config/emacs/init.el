
					; basic configuration

(setq inhibit-startup-message t)
(setq initial-buffer-choice nil)
(setq visual-bell 1)
(setq ring-bell-function 'ignore)
; (setq blink-cursor-interval 0.6)
(setq use-dialog-box nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq vc-follow-symlinks nil)

(setq-default frame-title-format "%b %& emacs")
(setq-default indicate-empty-lines t)

; (setq maximum-scroll-margin 0.5
;       scroll-margin 99999
;       scroll-preserve-screen-position t
;       scroll-conservatively 0)

(menu-bar-mode -1)
(tool-bar-mode -1)
; (scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(recentf-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(electric-pair-mode 1)
(global-tab-line-mode 1)
(which-function-mode 1)
(show-paren-mode 1)
(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil) 

(setq display-line-numbers-type 'relative)
(defalias 'yes-or-no-p 'y-or-n-p)

; clean up buffers

(setq-default message-log-max nil)
(kill-buffer "*Messages*")

; get rid of scratch
(setq initial-scratch-message "")
(add-hook 'emacs-startup-hook (lambda ()
    (when (get-buffer "*scratch*")
    (kill-buffer "*scratch*"))))

; skip buffers when switching
(defcustom pino/buffer-skip-regexp
  (rx bos (or (or "*Backtrace*" "*Compile-Log*" "*Completions*"
                  "*Messages*" "*package*" "*Warnings*"
                  "*Async-native-compile-log*" "*scratch*" "*straight-process*" "*rust-analyzer*" "*rust-analyzer::stderr*")
	      ) eos)
  "Regular expression matching buffers ignored by `next-buffer' and `previous-buffer'."
  :type 'regexp)

(defun pino/buffer-skip-p (window buffer bury-or-kill)
    "Return t if BUFFER name matches `pino/buffer-skip-regexp'."
    (string-match-p pino/buffer-skip-regexp (buffer-name buffer)))

(setq switch-to-prev-buffer-skip 'pino/buffer-skip-p)
;; (mailcap-add-mailcap-entry "image" "png" '((viewer "sxhkd %s") (type . "image/*")))

; startup time optimization
(setq gc-cons-threshold most-positive-fixnum)

;; (load-theme 'modus-vivendi t)

; spell checking (with aspell)
;; (setq ispell-list-command "--list")
;; (flyspell-mode 1)

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
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; use package
;; (use-package-always-ensure t)
(straight-use-package 'use-package)
(use-package straight :custom
  (straight-use-package-by-default t)
)
(kill-buffer "*straight-process*")

(use-package material-theme)
(load-theme 'material t)

; which key
(use-package which-key
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

; centered cursor mode
(use-package centered-cursor-mode
  :config
  (global-centered-cursor-mode)
  )

; undo tree
(use-package undo-tree
  :config
  (global-undo-tree-mode))

; evil mode

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-undo-system 'undo-tree)

  :config
  (setq evil-emacs-state-cursor '("#ffffff" box))
  (setq evil-normal-state-cursor '("#ffffff" box))
  (setq evil-operator-state-cursor '("#ffffff" hollow))
  (setq evil-visual-state-cursor '("#ffffff" box))
  (setq evil-insert-state-cursor '("#ffffff" (bar . 2)))
  (setq evil-replace-state-cursor '("#ffffff" hbar))
  (setq evil-motion-state-cursor '("#ffffff" box))

  (evil-mode 1))

(evil-define-key 'normal 'global "gc" 'comment-or-uncomment-region)

(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key "w" 'save-buffer)
  (evil-leader/set-key "q" 'save-buffers-kill-terminal)
  (evil-leader/set-key "f" 'dired)
  (evil-leader/set-key "F" 'fzf-git-files)
  (evil-leader/set-key "l" 'next-buffer)
  (evil-leader/set-key "h" 'previous-buffer)
  (evil-leader/set-key "j" 'next-window-any-frame)
  (evil-leader/set-key "k" 'previous-window-any-frame)
  (evil-leader/set-key "b" 'fzf-switch-buffer)
  (evil-leader/set-key "d" 'kill-this-buffer)
  (evil-leader/set-key "r" 'eval-buffer) 
  ; <leader>m prefix indicates a mode
  (evil-leader/set-key "mS" 'org-tree-slide-mode)
  (evil-leader/set-key "ms" 'eshell)
  (global-evil-leader-mode)
  )

(use-package evil-snipe
  :config
  (evil-snipe-mode)
  )

; org mode
(use-package org)

;; org remark
(use-package org-remark)

(define-key global-map (kbd "C-c n m") #'org-remark-mark)
(with-eval-after-load 'org-remark
  (define-key org-remark-mode-map (kbd "C-c n o") #'org-remark-open)
  (define-key org-remark-mode-map (kbd "C-c n ]") #'org-remark-view-next)
  (define-key org-remark-mode-map (kbd "C-c n [") #'org-remark-view-prev)
  (define-key org-remark-mode-map (kbd "C-c n r") #'org-remark-remove))

; org babel
(use-package ein :ensure nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ein . t)
   ))

(use-package evil-org
  :after org
  :hook (add-hook 'org-mode-hook 'evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  )

; org mode presnetation
(use-package org-tree-slide
  :ensure nil
  :config
  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree)

  (setq org-tree-slide-slide-in-effect nil)
  )

; posframe
;; (use-package posframe :ensure t)

(use-package flycheck)
(define-key evil-normal-state-map (kbd "C-n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "C-p") 'flycheck-previous-error)

; lsp mode
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-l")
  (setq lsp-signature-function 'lsp-signature-posframe)
  :config
  (lsp-enable-which-key-integration t)
  )
(use-package lsp-ui
  :config
  (setq lsp-lens-enable nil)
  (setq lsp-ui-sideline-enable 1)
  (setq lsp-ui-sideline-show-diagnostics 1)
  (lsp-ui-doc-mode))

(define-key evil-normal-state-map "Lr" 'lsp-find-references)
(define-key evil-normal-state-map "LR" 'lsp-rename)
(define-key evil-normal-state-map "Li" 'lsp-find-implementation)
(define-key evil-normal-state-map "Ld" 'lsp-find-definition)
(define-key evil-normal-state-map "Lx" 'lsp-execute-code-action)
(define-key evil-normal-state-map "Lf" 'lsp-format-buffer)
(define-key evil-normal-state-map "LF" 'lsp-format-region)
(define-key evil-normal-state-map "La" 'lsp-execute-code-action)
(define-key evil-normal-state-map "K" 'lsp-describe-thing-at-point)

(use-package company
  :hook ((emacs-lisp-mode . (lambda () (setq-local company-backends '(company-elisp))))
	 (emacs-lisp-mode . company-mode)
	 )
  :config
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-selection)
  (define-key company-active-map (kbd "RET") 'nil)
  )

;; TODO find out how to get rid of rust-analyzer buffers
(use-package rustic
  :ensure nil
  :hook ((rustic-mode) .
    (lambda ()
	(when (get-buffer "*rust-analyzer*")
	(kill-buffer "*rust-analyzer*")))
    )
)

;; (setq rustic-lsp-server 'rls)
;; (setq rustic-analyzer-command '("rustup run stable rust-analyzer"))
(use-package yaml-mode :ensure nil)
(use-package zig-mode :ensure nil)
(use-package just-mode :ensure nil)
(use-package go-mode :ensure nil)
(add-hook 'go-mode-hook #'lsp)
(use-package ccls
  :ensure nil
  :hook ((c-mode c++-mode) .
         (lambda () (require 'ccls) (lsp))))
(use-package elpy
  :ensure nil
  :init
  (elpy-enable))
(use-package lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

; command log mode
; (use-package command-log-mode)

(use-package fzf)

;; mode line
; (use-package mood-line
;     :config
;     (mood-line-mode)

;     :custom
;     (setq mood-line-glyph-alist mood-line-glyphs-unicode)
; )

; snippets
(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.config/emacs/snippets"))
  (yas-global-mode 1))

(yas-define-snippets 'latex-mode '(
    ("im" "\$$0\$" "inline math mode")
    ("sin" "\\sin($1)$0" "sin")
    ("sec" "\\section($1)$0" "section")
    ("ssec" "\\subsection($1)$0" "subsection")
    ("set" "\\{ $1 \\}$0" "set")
    (".." "\\ldots" "elipses")
))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("f149d9986497e8877e0bd1981d1bef8c8a6d35be7d82cba193ad7e46f0989f6a" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" default))
 '(ein:output-area-inlined-images t)
 '(fci-rule-color "#dadada")
 '(hl-sexp-background-color "#efebe9")
 '(ispell-dictionary nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f")))
 '(vc-annotate-very-old-color nil)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; language specific
(setq c-indentation-style 4)
