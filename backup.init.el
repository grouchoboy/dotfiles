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

(defun font-exists? (font-to-test)
  (if (null (member font-to-test (font-family-list))) nil t))

(if (font-exists? "JetBrains Mono")
  (set-face-attribute 'default nil :font "JetBrains Mono Medium-19"))

(setq inhibit-startup-message t)
(if window-system (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq column-number-mode 1)
(setq-default fill-column 80)

;; Highligh the pair of the current parens
(show-paren-mode t)

;; encryption
(require 'epa-file)
(custom-set-variables '(epg-gpg-program "/usr/local/bin/gpg"))
(epa-file-enable)

;; keybindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :ensure t
  :demand
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC")))

(use-package org
  :ensure t
  :config
  (setq org-ellipsis " ▾")
  (setq org-agenda-files '("~/docs/org/"))
  (setq org-todo-keywords '((sequence "TODO" "IN-PROGRES" "|" "DONE"))))

(use-package magit
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package slime
  :ensure t)

(use-package lispy
  :ensure t
  :hook (emacs-lisp-mode . lispy-mode))

(use-package lispyville
  :ensure t
  :hook
  ((emacs-lisp-mode . lispyville-mode)
   (lispy-mode . lispyville-mode)
   (lisp-mode . lispyville-mode))
  :config
  (lispyville-set-key-theme
   '(operators
     c-w
     additional
     additional-insert
     additional-motions
     commentary
     slurp/barf-cp
     wrap
     prettify)))

(use-package rainbow-delimiters
  :ensure t
  :hook
  ((emacs-lisp-mode . rainbow-delimiters-mode)
   (lisp-mode . rainbow-delimiters-mode)))

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

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
