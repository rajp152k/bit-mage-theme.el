;;; private/live-coding/config.el -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Doom module for live-coding, inspired by emacs-live.
;;
;; Flags:
;;   +flash      - Flash evaluated s-expressions (eval-sexp-fu + CIDER integration)
;;   +pulse      - Use built-in pulse.el for animated fade instead of static flash
;;   +prettify   - Lambda prettification in Lisp modes
;;   +aggressive - Aggressive auto-indentation in Lisp modes

;;;; Flash-on-eval (+flash)

(when (modulep! +flash)
  (use-package! eval-sexp-fu
    :defer t
    :init
    ;; emacs-live uses 0.5s; default is 0.15s. Split the difference.
    (setq eval-sexp-fu-flash-duration 0.4
          eval-sexp-fu-flash-error-duration 0.6)
    :config
    (turn-on-eval-sexp-fu-flash-mode))

  ;; CIDER integration: flash on cider-eval-* commands
  (use-package! cider-eval-sexp-fu
    :when (modulep! :lang clojure)
    :after cider))

;;;; Pulse-based flash (+pulse)
;;
;; Uses Emacs built-in pulse.el for a color-fade animation effect
;; on evaluated s-expressions. Animated purple fade for all eval commands.

(when (modulep! +pulse)
  (require 'pulse)

  (setq pulse-flag t
        pulse-iterations 12
        pulse-delay 0.03)

  ;; Emacs Lisp
  (after! elisp-mode
    (advice-add #'eval-last-sexp :around #'+live-coding-pulse-on-eval-a)
    (advice-add #'eval-defun :around #'+live-coding-pulse-on-eval-a))

  ;; CIDER
  (after! cider
    (advice-add #'cider-eval-last-sexp :around #'+live-coding-pulse-on-eval-a)
    (advice-add #'cider-eval-defun-at-point :around #'+live-coding-pulse-defun-a)
    (advice-add #'cider-pprint-eval-last-sexp :around #'+live-coding-pulse-on-eval-a)))

;;;; Lambda prettification (+prettify)

(when (modulep! +prettify)
  (defun +live-coding-setup-prettify-h ()
    "Prettify fn/lambda as λ in Lisp modes."
    (push '("fn" . ?λ) prettify-symbols-alist)
    (push '("lambda" . ?λ) prettify-symbols-alist)
    (prettify-symbols-mode 1))

  (add-hook 'clojure-mode-hook #'+live-coding-setup-prettify-h)
  (add-hook 'clojure-ts-mode-hook #'+live-coding-setup-prettify-h)
  (add-hook 'emacs-lisp-mode-hook #'+live-coding-setup-prettify-h))

;;;; Aggressive indentation (+aggressive)

(use-package! aggressive-indent
  :when (modulep! +aggressive)
  :hook ((clojure-mode . aggressive-indent-mode)
         (clojure-ts-mode . aggressive-indent-mode)
         (emacs-lisp-mode . aggressive-indent-mode)
         (lisp-mode . aggressive-indent-mode)
         (scheme-mode . aggressive-indent-mode)))
