(setq user-full-name "Manuel Pascual Luna")

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

(electric-pair-mode 1)

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))

(set-face-attribute 'default nil :font "Monaco-18")

(setq inhibit-startup-message t)
(if window-system (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq column-number-mode 1)
(setq-default fill-column 80)

;; keybindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :ensure t
  :demand
  :config
  (evil-mode 1))

(use-package org
  :ensure t
  :config
  (setq org-ellipsis " ▾")
  (setq org-agenda-files '("~/docs/org/"))
  (setq org-todo-keywords '((sequence "TODO" "IN-PROGRES" "|" "DONE"))))

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-c h" . helm-command-prefix)
	 ("C-x b" . helm-mini))
  :config
  (require 'helm-config)
  (helm-mode 1)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t)
  (global-unset-key (kbd "C-x c")))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; (use-package evil-lispy
;;    :ensure t
;;    :hook (emacs-lisp-mode . evil-lispy-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package slime
  :ensure t)

(use-package lispy
  :ensure t
  :hook (emacs-lisp-mode . lispy-mode)
  )

(use-package lispyville
  :ensure t
  :hook
  ((emacs-lisp-mode . lispyville-mode)
   (lispy-mode . lispyville-mode)
   (lisp-mode . lispyville-mode))
  :config
  (lispyville-set-key-theme
   '(operators c-w additional additional-insert commentary slurp/barf-cp wrap)))

(use-package rainbow-delimiters
  :ensure t)

(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x))

; M-x all-the-icons-install-fonts
(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(defun open-init ()
  "Open the init file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; Configure SBCL as the Lisp program for SLIME.
(add-to-list 'exec-path "/usr/local/bin")
(setq inferior-lisp-program "sbcl")
