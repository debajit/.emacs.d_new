;; Title Case Support. See
;;
;; - “Title Case in Emacs”
;;   https://jblevins.org/log/titlecase
;;
;; - A refactoring of John Gruber’s Title Case Program
;;   https://github.com/ap/titlecase
;;
;; - “Title Case” by John Gruber
;;   https://daringfireball.net/2008/05/title_case
;;
;; Melpa’s titlecase is a possibly better implementation that can
;; still use external programs.
;; https://codeberg.org/acdw/titlecase.el
;;
(require 'titlecase)

(global-set-key (kbd "s-z") 'undo)

;; Jump out of strings, parens, brackets etc.
(global-set-key (kbd "C-o") 'up-list)

(global-set-key (kbd "M-K") 'clear-sexp)
