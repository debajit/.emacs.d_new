(use-package treemacs-projectile
  :ensure t
  :bind ("M-T" . treemacs))

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "s-u") 'dired-up-directory)
  )

;; From https://emacs.stackexchange.com/a/41502/12922

(defun ska-point-to-register ()
  "Store cursorposition _fast_ in a register. Use ska-jump-to-register
to jump back to the stored position."
  (interactive)
  (point-to-register 8))

(defun ska-jump-to-register ()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

(global-set-key (kbd "C-.") 'ska-point-to-register)
;; From https://emacs.stackexchange.com/a/41502/12922

(defun ska-point-to-register ()
  "Store cursorposition _fast_ in a register. Use ska-jump-to-register
to jump back to the stored position."
  (interactive)
  (point-to-register 8))

(defun ska-jump-to-register ()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

(global-set-key (kbd "C-.") 'ska-point-to-register)
(global-set-key (kbd "C-,") 'ska-jump-to-register)

;; Taken from https://www.reddit.com/r/emacs/comments/43b42y/i_just_realized_emacs_has_a_fast_infix_calculator/
(defun calc-eval-region (beg end)
  "Eval the arithmetic expression in the region and replace it with the result"
  (interactive "r")
  (let ((val (calc-eval (buffer-substring beg end))))
    (delete-region beg end)
    (insert val)))

(global-set-key (kbd "M-+") 'calc-eval-region)

(defhydra hydra-switch-mode (:color blue
                                    :hint nil
                                    )
  "
 ^Writing^          ^Programming^         ^Other^                 ^Formatting
-------------    ---------------    -----------------     -------------
 _o_: Org           _e_: Elixir           _c_: Conf Mode        _Q_: Electric Quotes
 _m_: Markdown      _r_: Ruby             _f_: Fundamental      _a_: Auto-fill Mode
 ^ ^                _j_: JavaScript       _y_: YAML
 ^ ^                _g_: GraphQL
 ^ ^                _l_: Emacs-Lisp
 ^ ^                _s_: Shell-Script
"
  ("Q" electric-quote-mode)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("a" auto-fill-mode)
  ("c" conf-mode)
  ("e" elixir-mode)
  ("f" fundamental-mode)
  ("g" graphql-mode)
  ("j" js2-mode)
  ("l" emacs-lisp-mode)
  ("m" gfm-mode)
  ("o" org-mode)
  ("r" ruby-mode)
  ("s" shell-script-mode)
  ("y" yaml-mode)

  ("q" nil "Quit")
  ;; ("q" quit-window "quit" :color blue)
  )

;; (Key chord) - What the key does
(global-set-key (kbd "M-M") 'hydra-switch-mode/body)

(setq ispell-program-name (executable-find "hunspell")
      ispell-dictionary "en_US")
