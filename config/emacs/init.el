; https://github.com/grouchoboy/dotfiles/blob/54791830457dbd3f87a369279c2fe6cb677d20a9/init.el

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-14")
(setq custom-file (concat user-emacs-directory "custom.el"))
(electric-pair-mode 1)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")
(if window-system (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)
;(setq column-number-mode 1)
;(setq display-line-numbers-type 'relative)
;(global-display-line-numbers-mode)
;(global-hl-line-mode 1)
(setq-default fill-column 80)
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(show-paren-mode t)
(blink-cursor-mode 0)
;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;(use-package evil
;:ensure t
;:config
;(evil-mode 1))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
 :ensure t
 :config
 (setq doom-themes-enable-bold nil
       doom-themes-enable-italic nil
       doom-gruvbox-light-variant "hard")
 (load-theme 'doom-gruvbox-light t)
 (doom-themes-org-config))

(set-face-attribute 'line-number nil
                    :background nil) 

(use-package magit
    :ensure t
    :bind (("C-x g" . magit-status))
    :config
    (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package eglot
  :ensure nil
  :bind
  (("C-c e f" . eglot-format-buffer))) ;; built-in

(use-package go-mode
  :ensure t
  :hook
  (go-mode . eglot-ensure))

;; custom functions

(defun open-init()
  "Open the init file"
  (interactive)
  (find-file "~/.config/emacs/init.el"))

(defun f ()
  "Format the current buffer using Eglot."
  (interactive)
  (when (bound-and-true-p eglot--managed-mode)
    (eglot-format-buffer)))
