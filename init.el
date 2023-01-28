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

(if (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-12"))

(if (eq system-type 'darwin) 
    (set-face-attribute 'default nil :font "JetBrains Mono Medium-15"))

(electric-pair-mode 1)
(setq mac-command-modifier 'meta)

;; (use-package dracula-theme
;;   :ensure t
;;   :config
;;   (load-theme 'dracula t))

;; (use-package nano-theme
;;     :ensure t
;;     :config
;;     (nano-light))

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
(blink-cursor-mode 0)

(use-package evil
  :ensure t
  :demand
  :config
  (evil-mode 1))

(use-package general
  :ensure t
  :config
  (general-create-definer my-leader-def
    :states 'normal
    :prefix "SPC"))

;; keybindings
(my-leader-def
  :states 'normal
  :keymaps 'override
  ;; window management
  "x 1" 'delete-other-windows
  "x 3" 'split-window-right
  "x o" 'other-window
  "x x" 'kill-buffer-and-window

  ;; buffers
  "x k" 'kill-buffer

  ;; find file
  "x f" 'find-file

  ;; eval
  "x e" 'eval-last-sexp)

(use-package org
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (company-mode -1)))
  (setq setq-agenda-files '("~/Documents/org/")))

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold nil
	doom-themes-enable-italic nil)
  (load-theme 'doom-spacegrey t)
  (doom-themes-org-config))

(use-package magit
  :ensure t
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (setq magit-status-buffer-switch-function 'switch-to-buffer))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (my-leader-def
    :states 'normal
    :keymaps 'override
    "p" 'projectile-command-map
    "f" 'projectile-find-file
    "b" 'projectile-switch-to-buffer)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))


(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (my-leader-def
    :states 'normal
    :keymaps 'override
    "s" 'swiper-isearch
    "x b" 'ivy-switch-buffer)
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

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

;; Languages
(use-package elixir-mode
  :ensure t

  :hook
  ((elixir-mode . company-mode)
   (elixir-mode . yas-minor-mode))

  :config
  (setq-local company-backends '(company-capf))
  (setq-local company-transformers nil))

  ;:config
  ;(add-hook 'elixir-mode-hook (lambda () (company-mode 1))))

(use-package racket-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package yasnippet
  :ensure t

  :custom
  (yas-verbosity 2)
  (yas-wrap-around-region t)
  
  :config
  (yas-reload-all)
  (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package company
  :ensure t 
  :after yasnippet

  :hook
  (after-init . global-company-mode)

  :init
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  (setq company-backend '((company-capf :with company-yasnippet)))

  :bind
  (("C-c y" . company-yasnippet))

  :config
  ;(add-hook 'org-mode-hook (lambda () (company-mode -1))))
  )

(use-package eglot
  :ensure t
  :after yasnippet
  :config
  (setq eglot-ignored-server-capabilites '(:documentHighlightProvider)))

(add-hook 'elixir-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs 'elixir-mode "~/.emacs.d/elixir-ls/release/language_server.sh")


;; keybindings

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; custom functions

(defun open-init()
  "Open the init file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))
