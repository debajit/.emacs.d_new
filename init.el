;; Save customizations in a separate file (custom.el)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror) ; Prevent errors if custom.el does not exist

;; Package setup
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)
(package-initialize)

;;----------------------------------------------------------------------
;; General Emacs Settings
;;----------------------------------------------------------------------

;; Regular scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Toolbar off
(tool-bar-mode 0)

;; Status bar
(line-number-mode t)                    ; Show line number
(column-number-mode t)                  ; Show column number

;; Highlight matching parentheses
(setq show-paren-delay 0)               ; Highlight instantly, no delay
(show-paren-mode 1)

;; Smart tab behavior - indent or complete
;; Commented out in favor of pabbrev mode.
;; (setq tab-always-indent 'complete)

;; Revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Desktop mode (Always save and restore the open buffers)
(desktop-save-mode 1)

;; Highlight the current line
(global-hl-line-mode +1)

;; Winner mode (undo and redo window layouts)
(winner-mode 1)
(global-set-key (kbd "s-y") 'winner-undo)
(global-set-key (kbd "s-Y") 'winner-redo)

;; Line number mode. Not enabled currently. To make this look good,
;; set the fringe color to the window background color.
(setq linum-format " %4d ")

;; Use spaces not tabs
(setq-default indent-tabs-mode nil)   ;; Don't use tabs to indent
(setq-default tab-width 4)            ;; Ensure tabs are aligned well

;; Whitespace
(setq require-final-newline t)          ; Add a newline at end of file

;; Narrowing and widening
(put 'narrow-to-region 'disabled nil)   ; Enable narrowing (disabled by default)

;; Show images by default
(setq auto-image-file-mode t)

;;----------------------------------------------------------------------
;; Autocomplete
;;----------------------------------------------------------------------

;; Configure hippie-expand

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(global-set-key (kbd "s-j") 'hippie-expand) ; Use an easy keystroke for this :)
(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "M-/") 'hippie-expand)


;; Configure the Tab key to autocomplete / indent / expand-snippet
;; depending on the position of the cursor. See
;; http://stackoverflow.com/questions/13576156/emacs-smart-tab-with-yasnippets
;;
;; Auto complete settings / tab settings
;; http://emacsblog.org/2007/03/12/tab-completion-everywhere/ <-- in the comments
;;
;; (global-set-key [(tab)] 'smart-tab)
;; (defun smart-tab ()
;;   "This smart tab is minibuffer compliant: it acts as usual in
;;     the minibuffer. Else, if mark is active, indents region. Else if
;;     point is at the end of a symbol, expands it. Else indents the
;;     current line."
;;   (interactive)
;;   (if (minibufferp)
;;       (unless (minibuffer-complete)
;;         (dabbrev-expand nil))
;;     (if mark-active
;;         (indent-region (region-beginning)
;;                        (region-end))
;;       (if (looking-at "\\_>")
;;           (let ((yas/fallback-behavior nil))
;;             (unless (yas/expand)
;;               (dabbrev-expand nil)))
;;         (indent-for-tab-command)))))


;;----------------------------------------------------------------------
;; General keyboard shortcuts
;;----------------------------------------------------------------------

;; Save file: s-s
(global-set-key (kbd "s-s") 'save-buffer)


;; Cut: s-x   (default: C-w)
(global-set-key (kbd "s-x") 'kill-region)

;; Copy: s-c   (default: M-w)
(global-set-key (kbd "s-c") 'kill-ring-save)

;; Paste: s-v   (default: C-y)
(global-set-key (kbd "s-v") 'yank)

;; Select all: s-a   (default: C-x h)
(global-set-key (kbd "s-a") 'mark-whole-buffer)


;;----------------------------------------------------------------------
;; View-related keys
;;----------------------------------------------------------------------

;; Zoom in to text (scale text up): s-=
(global-set-key (kbd "s-=") 'text-scale-increase)

;; Zoom out: s--
(global-set-key (kbd "s--") 'text-scale-decrease)

;; Reset zoom level: s-0
(global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-increase 0)))

;; Toggle truncate lines: s-p
(global-set-key (kbd "s-p") 'toggle-truncate-lines)


;;----------------------------------------------------------------------
;; Text editing
;;----------------------------------------------------------------------

;; Delete line: s-k   (default: C-k)
(global-set-key (kbd "s-k") 'kill-whole-line)

;; Replace selection with a single keystroke
(delete-selection-mode t)

;; Indent rigidly to tab stop (a la TextMate or Sublime Text)
(global-set-key (kbd "s-]") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "s-[") 'indent-rigidly-left-to-tab-stop)


;;----------------------------------------------------------------------
;; Navigation
;;----------------------------------------------------------------------

;; Go to line
(global-set-key (kbd "s-l") 'goto-line)


;;----------------------------------------------------------------------
;; Mouse shortcuts
;;----------------------------------------------------------------------

;; Open link at mouse pointer: s-click
(global-set-key [s-mouse-1] 'browse-url-at-mouse)


;;----------------------------------------------------------------------
;; Window management keys.
;; Windows => Emacs' frames
;; Panes   => Emacs' windows
;;----------------------------------------------------------------------

;; New window: s-n   (default: C-x 5 2)
(global-set-key (kbd "s-n") (lambda () (interactive) (find-file-other-frame "/tmp/scratch")))

;; Close buffer: s-w
(global-set-key (kbd "s-w") 'kill-this-buffer)

;; Close pane: s-W   (default: C-x 0)
(global-set-key (kbd "s-W") (lambda () (interactive) (delete-window) (balance-windows)))

;; Close window (Emacs' frame): s-q
(global-set-key (kbd "s-q") 'delete-frame)

;; Maximize window: s-m   (default: C-x 1)
(global-set-key (kbd "s-m") 'delete-other-windows)

;; Split horizontally: s-J   (default: C-x 3)
(global-set-key (kbd "s-J") (lambda () (interactive) (split-window-right) (windmove-right)))

;; Split horizontally: s-K   (default: C-x 2)
(global-set-key (kbd "s-K") (lambda () (interactive) (split-window-below) (windmove-down)))

;; Move to window on left
(global-set-key (kbd "s-U") 'windmove-left)

;; Move to window on right
(global-set-key (kbd "s-I") 'windmove-right)

;; Move to window above
(global-set-key (kbd "s-O") 'windmove-up)

;; Move to window below
(global-set-key (kbd "s-P") 'windmove-down)

;; Balance windows
(global-set-key (kbd "s-:") 'balance-windows)

;; Increase window size: s-]
(global-set-key (kbd "M-]") (lambda () (interactive) (enlarge-window-horizontally 20)))

;; Decrease window size: s-[
(global-set-key (kbd "M-[") (lambda () (interactive) (shrink-window-horizontally 20)))


;;----------------------------------------------------------------------
;; Typography
;;----------------------------------------------------------------------

;;
;; Typefaces
;;
;; Currently using Consolas for code, and Ideal Sans for longform text.
;;
(when (display-graphic-p)
  (when (member "Consolas" (font-family-list))
    (set-face-font 'default "Consolas-16")
    (copy-face 'default 'fixed-pitch))
  (when (member "Ideal Sans" (font-family-list))
    (set-face-font 'variable-pitch "Ideal Sans-18")))

;;
;; Variable-width font settings.
;;
;; Largely adapted from
;; http://www.xiangji.me/2015/07/13/a-few-of-my-org-mode-customizations/
;;
(defun set-buffer-variable-pitch ()
  (interactive)
  (variable-pitch-mode t)
  (setq line-spacing 3)
  (set-face-attribute 'markdown-pre-face nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block-background nil :inherit 'fixed-pitch))

(add-hook 'org-mode-hook 'set-buffer-variable-pitch)
(add-hook 'eww-mode-hook 'set-buffer-variable-pitch)
(add-hook 'markdown-mode-hook 'set-buffer-variable-pitch)
(add-hook 'Info-mode-hook 'set-buffer-variable-pitch)


;;----------------------------------------------------------------------
;; External Packages
;;----------------------------------------------------------------------

;; Setup use-package first. We will use this for everything else.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-verbose t)

;; Aggressive indent
(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :config
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'haml-mode))

;; Beacon --- Show little "animation" around cursor when switching
;; windows etc. to quickly indicate where the cursor is.
(use-package beacon
  :ensure t
  :diminish beacon-mode
  :config
  (beacon-mode 1))

;; Comments
(use-package comment-dwim-2
  :ensure t
  :bind ("s-;" . comment-dwim-2))

;; Company
(use-package company
  :ensure t)

;; Crux
(use-package crux
  :ensure t
  :bind (("s-d" . crux-duplicate-current-line-or-region)
         ("s-D" . crux-duplicate-and-comment-current-line-or-region)
         ("M-o" . crux-smart-open-line)
         ("s-o" . crux-smart-open-line-above)
         ;; ("s-j" . crux-top-join-line)
         ("C-j" . crux-top-join-line)
         ("s-<backspace>" . crux-kill-line-backwards)
         ("C-<backspace>" . crux-kill-line-backwards)))

;; Wrap text easily with delimiters (quotes etc.)
(use-package corral
  :ensure t
  :bind ("M-\"" . corral-double-quotes-forward))

(use-package css-mode
  :diminish aggressive-indent-mode
  :diminish helm-mode
  :init
  (setq css-indent-offset 2)
  :config
  (defun my-css-mode-hook ()
    (set-fill-column 72))
  (add-hook 'css-mode-hook 'my-css-mode-hook))

(use-package c++-mode
  :config
  (add-hook 'c++-mode-hook
            '(lambda ()
               (set-fill-column 72)
               (setq c-default-style "linux" ; Microsoft-style --- with { on new line
                     c-basic-offset 4)       ; Indent 4 spaces
               (c-subword-mode +1)
               )))

;; Easy kill -- Better copy and paste
(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill))

;; CTags
(use-package etags-select
  :ensure t
  :bind (("s-." . etags-select-find-tag-at-point)
         ("s->" . etags-select-find-tag)
         ("M-." . pop-tag-mark)))       ; Jump back from tag found

;; Dash-at-point (Lookup in Dash.app)
(use-package dash-at-point
  :ensure t
  :bind ("s-e" . dash-at-point))

;; Deft -- A note-taking system like Notational Velocity. The following
;; configuration is largely adapted from
;; http://pragmaticemacs.com/emacs/make-quick-notes-with-deft/
(use-package deft
  :ensure t
  :diminish deft-mode
  :bind ("<f6>" . deft)
  :init
  (setq deft-directory "/Users/debajita/Documents/org")
  (setq deft-extensions '("org" "txt" "md"))
  (setq deft-default-extension "org")
  (setq deft-recursive t)
  (setq deft-text-mode 'org-mode)
  (setq deft-use-filename-as-title t)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-auto-save-interval 0))

;; Elixir mode
(use-package elixir-mode
  :ensure t)

;; Elixir snippets
(use-package elixir-yasnippets
    :ensure t)

;; Emacs Lisp mode
(use-package emacs-lisp-mode
  :bind ("s-r" . eval-buffer))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
         ("M-h" . er/mark-paragraph)))

;; Fill column indicator (Print margin — Enable for all files)
(use-package fill-column-indicator
  :ensure t
  :config
  (add-hook 'after-change-major-mode-hook 'fci-mode))

;; Spellcheck with flyspell
(use-package flyspell
  :diminish flyspell-mode
  :config
  (when (eq system-type 'windows-nt)
    (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/"))
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--sug-mode=ultra"))
  (add-hook 'text-mode-hook #'flyspell-mode)
  (add-hook 'prog-mode-hook #'flyspell-prog-mode))

;; Customize fringes
(use-package fringe-mode
  :config
  (fringe-mode 32 32))                  ; Make fringes wider for more comfortable reading

;; HAML mode
(use-package haml-mode
  :ensure t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("s-SPC" . helm-mini)          ; List buffers, like C-x b
         ("s-i" . helm-semantic-or-imenu) ; Jump to method
         ("s-b" . helm-bookmarks))
  :init
  (setq helm-truncate-lines t)
  :config
  (helm-mode 1)
  (eval-after-load 'helm-mode '(diminish 'helm-mode)))

(use-package helm-git-grep
  :ensure t
  :bind ("s-F" . helm-git-grep-at-point))

(use-package helm-ls-git
  :ensure t
  :bind ("s-t" . helm-ls-git-ls))

(use-package ido-mode
  :bind ("C-x C-f" . ido-find-file))

;; Iedit --- easily rename variables + rectangle mode
(use-package iedit
  :ensure t
  :bind* ("C-;" . iedit-mode))

(use-package ivy
  :diminish ivy-mode)

(use-package helm-projectile
  :ensure t)

;; TODO: Add typesript mode
(use-package javascript-mode
  :init
  (setq js-indent-level 2)
  :config
  (defun my-javascript-mode-hook ()
    (set-fill-column 72))
  (add-hook 'javascript-mode-hook 'my-javascript-mode-hook))

;; Line numbers of left of buffer
(use-package linum-mode
  :bind ("<f8>" . linum-mode))

;; Markdown Mode
(use-package markdown-mode
  :ensure t)

;; Markdown mode
;; Use Octodown as Markdown parser
;; TODO: Organize this section
(defun markdown-mode-keyboard-shortcuts ()
  "Custom keys for Markdown mode."

  ;; Preview in browser: s-r, M-r
  (local-set-key (kbd "s-r") 'markdown-preview)
  (local-set-key (kbd "M-r") 'markdown-preview)

  ;; Super + B  =>  Bold
  (local-set-key (kbd "s-b") 'markdown-insert-bold)

  ;; Super + 1  =>  Insert heading 1
  (local-set-key (kbd "s-1") 'markdown-insert-header-setext-1)

  ;; Super + 2  =>  Insert heading 2
  (local-set-key (kbd "s-2") 'markdown-insert-header-setext-2)

  ;; Super + 3  =>  Insert heading 3
  (local-set-key (kbd "s-3") (lambda () (interactive) (markdown-insert-header-setext-dwim 3)))

  ;; Super + 4  =>  Insert heading 4
  (local-set-key (kbd "s-4") (lambda () (interactive) (markdown-insert-header-setext-dwim 4)))

  ;; Super + 5  =>  Insert heading 5
  (local-set-key (kbd "s-5") (lambda () (interactive) (markdown-insert-header-setext-dwim 5)))

  ;; Super + 6  =>  Insert heading 6
  (local-set-key (kbd "s-6") (lambda () (interactive) (markdown-insert-header-setext-dwim 6)))

  )
(add-hook 'markdown-mode-hook 'markdown-mode-keyboard-shortcuts)

;; Multiple cursors. Prefer to use iedit (even with M-{ or M-}) for
;; simple variable renames
(use-package multiple-cursors
  :ensure t
  :bind ("s-E" . mc/mark-next-word-like-this))

;; NeoTree file tree browser
(use-package neotree
  :ensure t
  :init
  (setq-default neo-smart-open t             ; Open file browser in current directory.
                neo-window-fixed-size nil)   ; Make file browser resizeable
  ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind ("<f7>" . neotree-toggle))

;; Org mode
(use-package org
  :ensure t
  :init
  (setq org-startup-indented t          ; Turn on org-indent-mode
        org-startup-folded nil)         ; Start expanded
  :config
  (custom-set-variables '(org-hide-emphasis-markers t)) ; Hide bold, italic markers
  (add-hook 'org-mode-hook
            '(lambda ()
               (auto-fill-mode)                     ; Hard wrap automatically
               (whitespace-mode 0)                  ; Do not show trailing whitespace
               (setq org-src-fontify-natively t)))  ; Syntax-highlight code snippets
  ;; Diminish org-indent-mode
  ;; see http://emacs.stackexchange.com/questions/22531/diminish-org-indent-mode
  (eval-after-load 'org-indent '(diminish 'org-indent-mode)))

;; Unicode Org-mode bullets for improved typography
(use-package org-bullets
  :ensure t
  :diminish org-bullets-mode
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Predictive text completion (Predictive Abbreviation mode)
(use-package pabbrev
  :ensure t
  :init
  (setq pabbrev-idle-timer-verbose nil
        pabbrev-read-only-error nil)
  :config
  (global-pabbrev-mode)
  (put 'yas-expand 'pabbrev-expand-after-command t)
  ;; Fix for pabbrev not working in org mode
  ;; http://lists.gnu.org/archive/html/emacs-orgmode/2016-02/msg00311.html
  (define-key pabbrev-mode-map [tab] 'pabbrev-expand-maybe)
  (add-hook 'text-mode-hook (lambda () (pabbrev-mode))))

;; Projectile -- Project management
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind ("s-P" . projectile-switch-project)
  :config
  (projectile-global-mode +1))

;; Rainbow mode
(use-package rainbow-mode
  :ensure t)

;; Ruby mode
(use-package ruby-mode
  :config
  (defun my-ruby-mode-hook ()
    (set-fill-column 72))
  (add-hook 'ruby-mode-hook 'my-ruby-mode-hook))

;; Ruby tools
;; Autocompletes string interpolations
(use-package ruby-tools
  :ensure t)

;; Smartparens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (smartparens-global-mode 1))

;; Smart tab. Auto-complete text + expand snippets with Tab. Outside of
;; (pabbrev + yasnippet completion) and (dabbrev + yasnippet using
;; regular Tab) (see configuration above), this is likely the third best
;; option for configuring auto-complete.
;;
;; (use-package smart-tab
;;   :ensure t
;;   :init
;;   (cons 'yas/hippie-try-expand 'hippie-expand-try-functions-list)
;;   (setq smart-tab-using-hippie-expand t)
;;   :config
;;   (global-smart-tab-mode +1))

;; Subword mode. This package is configured somewhat differently from
;; others. Enabling subword-mode in :config does not work with diminish.
;; The following, however appears to work. See also
;; https://github.com/fbergroth/.emacs.d/blob/master/init.el
;;
;; TODO: See if this is slowing down Emacs startup somewhat.
(use-package subword
  :init (global-subword-mode)
  :diminish subword-mode)

;; Swiper - A better helm-swoop (for incremental search)
;; http://oremacs.com/2015/03/10/no-swiping/
(use-package swiper
  :ensure t
  :bind ("s-f" . swiper))

;; TypeScript
(use-package typescript-mode
  :ensure t)

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("s-z" . undo-tree-undo)
         ("s-Z" . undo-tree-redo))
  :config
  (setq undo-tree-auto-save-history t)
  (global-undo-tree-mode))

(use-package visual-line
  :bind ("<f5>" . visual-line-mode))

;; VLF (Very large files) support
(use-package vlf
  :ensure t
  :config
  (custom-set-variables '(vlf-application 'dont-ask)))

;; Web mode
(use-package web-mode
  :ensure t
  :bind (:map web-mode-map
              ("s-r" . browse-url-of-buffer)))

;; Whitespace mode
(use-package whitespace
  :diminish whitespace-mode
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 72) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail)))

(use-package yaml-mode
  :ensure t)

;; Yard mode
(use-package yard-mode
  :ensure t
  :diminish yard-mode
  :config
  (add-hook 'ruby-mode-hook 'yard-mode))

;; Yasnippet
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

;;----------------------------------------------------------------------
;; Theme
;;----------------------------------------------------------------------

(use-package birds-of-paradise-plus-theme
  :ensure t)

(use-package gruvbox-theme
  :ensure t)

(if (display-graphic-p)
    ;; (load-theme 'apus t)
    ;; (load-theme 'gruvbox t)
    (load-theme 'two-firewatch-light t)
  (load-theme 'stygian t))
