(global-set-key (kbd "C-?") 'help)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(setq visible-bell 1)

(setq-default indent-tabs-mode nil)

(require 'package)

(setq package-list '(
                     cherry-blossom-theme
                     auto-complete
                     flycheck
                     flycheck-pyflakes
                     
                     ))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(ac-config-default)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq inhibit-splash-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" default)))
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(fringe-mode 6 nil (fringe))
 '(global-linum-mode t)
 '(linum-format (quote dynamic))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Unifont" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
