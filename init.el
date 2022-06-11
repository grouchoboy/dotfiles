(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa". "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq custom-file (concat user-emacs-directory "custom.el"))

(eval-when-compile
  (require 'use-package))

(electric-pair-mode 1)
(setq mac-command-modifier 'meta)

(use-package nord-theme
  :ensure t
  :demand
  :config
  (load-theme 'nord t))

(defun font-exists? (font-to-test)
  (if (null (member font-to-test (font-family-list))) nil t))

(if (font-exists? "JetBrains Mono")
    (set-face-attribute 'default nil :font "JetBrains Mono Medium-15"))

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
;(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
;(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(show-paren-mode t)

;; keybindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :ensure t
  :demand
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC")))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package org
  :ensure t
  :config
  ;(setq org-ellipsis " ▾")
  (add-hook 'org-mode-hook (lambda () (company-mode -1)))
  (setq org-agenda-files '("~/Documents/org/"))
  (setq org-todo-keywords '((sequence "TODO" "IN-PROGRES" "|" "DONE"))))

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

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

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

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

;; languages
(use-package go-mode
  :ensure t
  :mode "\\.go\\'")

(use-package elixir-mode
  :ensure t)

;; LSP
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for:w
  ;;lsp-command-keymap (few alternatives - "C-l", "C-c l"))
  (setq lsp-keymap-prefix "C-c l")
  (add-to-list 'exec-path "~/Dev/elixir-ls")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (go-mode . lsp)
	 (elixir-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package company
  :ensure t 
  ;; :bind ("<tab>" . company-indent-or-complete-common)
  :config
  (add-hook 'after-init-hook 'global-company-mode))
  ;(global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(use-package lsp-ivy
  :ensure t)

(use-package lsp-ui
  :ensure t)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(defun open-init ()
  "Open the init file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

