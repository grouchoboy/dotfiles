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

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

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

(defun my/consult-find-file-in-current-dir ()
  "Recursively find files"
  (interactive)
  (consult-fd default-directory))

(use-package general
  :ensure t
  :config
  ;; Set up 'SPC' as the global leader key
  (general-create-definer my/leader-def
    :states '(normal visual)
    :prefix "SPC"
    :non-normal-prefix "M-SPC")

  ;; Define your leader keybindings here
  (my/leader-def
    "s b" #'consult-buffer)
  (my/leader-def
    "s f" #'my/consult-find-file-in-current-dir))

(global-set-key (kbd "C-c f") #'my/consult-find-file-in-current-dir)
(global-set-key (kbd "C-c b") #'consult-buffer)

(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

(use-package consult
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
	      ; ("C-c f" . projectile-find-file)
              ("C-c p" . projectile-command-map))
  :config
  (setq projectile-completion-system 'default))

(use-package consult-projectile
  :ensure t
  :after (consult projectile)
  :bind (;; Jump to any file or buffer in the current project with live preview:
         ("C-c p p" . consult-projectile)
         ;; Or find file specifically:
         ("C-c p f" . consult-projectile-find-file)
         ;; Or project buffer specifically:
         ("C-c p b" . consult-projectile-switch-to-buffer)))

(use-package eglot
  :ensure nil
  :hook
  (go-mode . eglot-ensure)
  :bind
  (("C-c e f" . eglot-format-buffer))) ;; built-in

; (use-package go-mode
;    :ensure t
;    :hook
;    (go-mode . eglot-ensure))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)                 ; Enable auto popup completion
  (corfu-auto-delay 0.1)         ; Delay before popup shows
  (corfu-auto-prefix 2)          ; Characters to type before completion triggers
  (corfu-cycle t)                ; Wrap around selections
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous)))

;; Optional: Documentation popups next to completion candidate
(use-package corfu-popupinfo
  :after corfu
  :hook (corfu-mode . corfu-popupinfo-mode)
  :custom
  (corfu-popupinfo-delay '(0.2 . 0.1)))

;; Enable terminal popups when not running in a GUI frame
(use-package corfu-terminal
  :ensure t
  :after corfu
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode +1)))

;; custom functions

(defun open-init()
  "Open the init file"
  (interactive)
  (find-file "~/.config/emacs/init.el"))
