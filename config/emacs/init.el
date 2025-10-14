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

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;(use-package doom-themes
;;  :ensure t
;;  :config
;;  (setq doom-themes-enable-bold nil
;;	doom-themes-enable-italic nil)
;;  (load-theme 'doom-gruvbox-light t)
;;  (doom-themes-org-config))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-light-hard t))

(set-face-attribute 'line-number nil
                    :background nil) 

;; custom functions

(defun open-init()
  "Open the init file"
  (interactive)
  (find-file "~/.config/emacs/init.el"))
