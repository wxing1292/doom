;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Wenquan Xing"
      user-mail-address "wenquan.xing@gmail.com")

(setq doom-theme 'doom-one)
(setq doom-font (font-spec :size 16.0))
(setq display-line-numbers-type t)

(add-hook! 'window-setup-hook
  #'toggle-frame-maximized)

(when IS-MAC
  (add-hook! '(emacs-startup-hook server-after-make-frame-hook)
    (defun +local-focus-emacs ()
      (select-frame-set-input-focus (selected-frame)))))

(setq-default cursor-type '(bar . 1))
(setq confirm-kill-emacs nil)
(setq make-backup-files nil)

(remove-hook 'tty-setup-hook #'xterm-mouse-mode)  ;; make touchpad works
(setq mouse-wheel-progressive-speed nil)          ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                ;; scroll window under mouse

;; === Centaur Tabs ===

(after! centaur-tabs
  (setq centaur-tabs-style "bar"
        centaur-tabs-height 28
        centaur-tabs-set-icons t
        centaur-tabs-set-modified-marker t
        centaur-tabs-cycle-scope 'tabs)           ;; don't jump groups when cycling
  (centaur-tabs-mode 1))

(defun local-centaur-new-tab ()
  (interactive)
  (let ((buf (generate-new-buffer "*untitled*")))
    (switch-to-buffer buf)))

(defun local-centaur-close-buffer ()
  (interactive)
  (if (memq major-mode '(neotree-mode treemacs-mode))
      (message "cannot close sidebar buffer: %s" major-mode)
    (centaur-tabs--kill-this-buffer-dont-ask)))

(map! :g "s-{" #'centaur-tabs-backward
      :g "s-}" #'centaur-tabs-forward
      :g "s-w" #'local-centaur-close-buffer
      :g "s-t" #'local-centaur-new-tab)

;; === Centaur Tabs ===

;; === Vertico & Orderless & Marginalia & Consult & Embark ===

(use-package! vertico
  :init
  (vertico-mode +1)
  (setq vertico-count 10))

(use-package! orderless
  :init
  (setq completion-styles            '(orderless)
        completion-category-defaults  nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package! marginalia
  :init
  (marginalia-mode +1))

(use-package! consult
  :after vertico
  :init
  :bind
  ("C-x b"   . consult-buffer)
  ("C-s"     . consult-line)
  ("C-r"     . consult-line)
  ("C-x C-f" . consult-fd))

;; === Vertico & Orderless & Marginalia & Consult & Embark ===  

(load! "rust-analyzer.el")
