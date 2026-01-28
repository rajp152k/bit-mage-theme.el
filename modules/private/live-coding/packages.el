;; -*- no-byte-compile: t; -*-
;;; private/live-coding/packages.el

;; Flash-on-eval: highlight evaluated s-expressions
(when (modulep! +flash)
  (package! eval-sexp-fu
    :recipe (:host github :repo "npostavs/eval-sexp-fu")
    :pin "36d2fe3bcf602e15ca10a7f487da103515ef391a")
  (when (modulep! :lang clojure)
    (package! cider-eval-sexp-fu
      :recipe (:host github :repo "clojure-emacs/cider-eval-sexp-fu")
      :pin "7fd229f1441356866aedba611fd0cf4e89b50921")))

;; Aggressive indentation for Lisp modes
(when (modulep! +aggressive)
  (package! aggressive-indent
    :pin "a437a45868f94b486571b3272e8a03f0082074d2"))
