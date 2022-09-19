(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq custom-file (concat user-emacs-directory "custom.el"))

(eval-when-compile
  (require 'use-package))

(set-face-attribute 'default nil :font "JetBrains Mono Medium-15")

(electric-pair-mode 1)
(setq mac-command-modifier 'meta)

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))

(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")
(if window-system (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq column-number-mode 1)
(setq-default fill-column 80)
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(show-paren-mode t)

(use-package evil
  :ensure t
  :demand
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC")))

(use-package org
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (company-mode -1)))
  (setq setq-agenda-files '("~/Documents/org/")))

(use-package magit
  :ensure t
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (setq magit-status-buffer-switch-function 'switch-to-buffer))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "<f2> j") 'counsel-set-variable)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view))

(use-package company
  :ensure t 
  :config
  (add-hook 'org-mode-hook (lambda () (company-mode -1)))
  (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package lispy
  :ensure t)

;; Languages

(use-package elixir-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  (add-to-list 'exec-path "~/Dev/elixir-ls")
  :hook
  ((elixir-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
  

;; keybindings

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; custom functions

(defun open-init()
  "Open the init file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (when mark-active
      (if (> (point) (mark))
          (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
        (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
    (if (eq last-command 'copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-ring-save beg end)))
  (kill-append "\n" nil)
  (beginning-of-line (or (and arg (1+ arg)) 2))
  (if (and arg (not (= 1 arg))) (message "%d lines copied" )))

(global-set-key "\C-c\C-k" 'copy-line)
