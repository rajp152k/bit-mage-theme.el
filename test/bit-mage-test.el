;;; bit-mage-test.el --- Tests for bit-mage-theme -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Raj Patil

;; Author: Raj Patil <rajp152k@gmail.com>
;; Maintainer: Raj Patil <rajp152k@gmail.com>

;; This file is not part of GNU Emacs.

;;; Commentary:

;; ERT tests for bit-mage-theme validation.
;; Tests theme loading, face definitions, and WCAG AA contrast compliance.

;;; Code:

(require 'ert)
(require 'bit-mage-theme)

;;;; Helper Functions

(defun bit-mage-test--relative-luminance (color)
  "Calculate relative luminance for COLOR using WCAG formula."
  (let* ((rgb (color-name-to-rgb color))
         (r (nth 0 rgb))
         (g (nth 1 rgb))
         (b (nth 2 rgb)))
    (+ (* 0.2126 (if (<= r 0.03928) (/ r 12.92) (expt (/ (+ r 0.055) 1.055) 2.4)))
       (* 0.7152 (if (<= g 0.03928) (/ g 12.92) (expt (/ (+ g 0.055) 1.055) 2.4)))
       (* 0.0722 (if (<= b 0.03928) (/ b 12.92) (expt (/ (+ b 0.055) 1.055) 2.4))))))

(defun bit-mage-test--contrast-ratio (color1 color2)
  "Calculate contrast ratio between COLOR1 and COLOR2."
  (let ((l1 (bit-mage-test--relative-luminance color1))
        (l2 (bit-mage-test--relative-luminance color2)))
    (/ (+ (max l1 l2) 0.05)
       (+ (min l1 l2) 0.05))))

;;;; Theme Loading Tests

(ert-deftest bit-mage-test-theme-loads ()
  "Test that bit-mage theme loads without error."
  (should (load-theme 'bit-mage t)))

(ert-deftest bit-mage-test-theme-enabled ()
  "Test that bit-mage theme is enabled after loading."
  (load-theme 'bit-mage t)
  (should (custom-theme-enabled-p 'bit-mage)))

;;;; Face Definition Tests

(ert-deftest bit-mage-test-default-face ()
  "Test that default face has foreground and background."
  (load-theme 'bit-mage t)
  (should (face-attribute 'default :foreground))
  (should (face-attribute 'default :background))
  (should-not (eq (face-attribute 'default :foreground) 'unspecified))
  (should-not (eq (face-attribute 'default :background) 'unspecified)))

(ert-deftest bit-mage-test-cursor-face ()
  "Test that cursor face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'cursor :background))
  (should-not (eq (face-attribute 'cursor :background) 'unspecified)))

(ert-deftest bit-mage-test-font-lock-keyword-face ()
  "Test that font-lock-keyword-face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'font-lock-keyword-face :foreground))
  (should-not (eq (face-attribute 'font-lock-keyword-face :foreground) 'unspecified)))

(ert-deftest bit-mage-test-font-lock-string-face ()
  "Test that font-lock-string-face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'font-lock-string-face :foreground))
  (should-not (eq (face-attribute 'font-lock-string-face :foreground) 'unspecified)))

(ert-deftest bit-mage-test-font-lock-comment-face ()
  "Test that font-lock-comment-face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'font-lock-comment-face :foreground))
  (should-not (eq (face-attribute 'font-lock-comment-face :foreground) 'unspecified)))

(ert-deftest bit-mage-test-error-face ()
  "Test that error face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'error :foreground))
  (should-not (eq (face-attribute 'error :foreground) 'unspecified)))

(ert-deftest bit-mage-test-warning-face ()
  "Test that warning face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'warning :foreground))
  (should-not (eq (face-attribute 'warning :foreground) 'unspecified)))

(ert-deftest bit-mage-test-success-face ()
  "Test that success face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'success :foreground))
  (should-not (eq (face-attribute 'success :foreground) 'unspecified)))

(ert-deftest bit-mage-test-mode-line-face ()
  "Test that mode-line face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'mode-line :foreground))
  (should-not (eq (face-attribute 'mode-line :foreground) 'unspecified)))

(ert-deftest bit-mage-test-region-face ()
  "Test that region face is defined."
  (load-theme 'bit-mage t)
  (should (face-attribute 'region :background))
  (should-not (eq (face-attribute 'region :background) 'unspecified)))

;;;; WCAG Contrast Tests

(ert-deftest bit-mage-test-wcag-aa-contrast ()
  "Test that default face meets WCAG AA contrast ratio (4.5:1)."
  (load-theme 'bit-mage t)
  (let* ((fg (face-attribute 'default :foreground))
         (bg (face-attribute 'default :background))
         (contrast (bit-mage-test--contrast-ratio fg bg)))
    (should (>= contrast 4.5))))

;;;; eval-sexp-fu Tests

(ert-deftest bit-mage-test-eval-sexp-fu-faces ()
  "Test eval-sexp-fu flash faces are properly defined."
  ;; Pre-create faces (normally done by eval-sexp-fu package)
  (unless (facep 'eval-sexp-fu-flash)
    (defface eval-sexp-fu-flash '((t)) "Test face"))
  (unless (facep 'eval-sexp-fu-flash-error)
    (defface eval-sexp-fu-flash-error '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'eval-sexp-fu-flash :background nil t) 'unspecified))
  (should-not (equal (face-attribute 'eval-sexp-fu-flash :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'eval-sexp-fu-flash-error :foreground nil t) 'unspecified)))

;;;; CIDER Tests

(ert-deftest bit-mage-test-cider-overlay-faces ()
  "Test CIDER result overlay faces are properly defined."
  (unless (facep 'cider-result-overlay-face)
    (defface cider-result-overlay-face '((t)) "Test face"))
  (unless (facep 'cider-error-overlay-face)
    (defface cider-error-overlay-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'cider-result-overlay-face :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-error-overlay-face :foreground nil t) 'unspecified)))

(ert-deftest bit-mage-test-cider-repl-faces ()
  "Test CIDER REPL faces are properly defined."
  (unless (facep 'cider-repl-prompt-face)
    (defface cider-repl-prompt-face '((t)) "Test face"))
  (unless (facep 'cider-repl-result-face)
    (defface cider-repl-result-face '((t)) "Test face"))
  (unless (facep 'cider-repl-stderr-face)
    (defface cider-repl-stderr-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'cider-repl-prompt-face :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-repl-result-face :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-repl-stderr-face :foreground nil t) 'unspecified)))

(ert-deftest bit-mage-test-cider-test-faces ()
  "Test CIDER test result faces are properly defined."
  (unless (facep 'cider-test-success-face)
    (defface cider-test-success-face '((t)) "Test face"))
  (unless (facep 'cider-test-failure-face)
    (defface cider-test-failure-face '((t)) "Test face"))
  (unless (facep 'cider-test-error-face)
    (defface cider-test-error-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'cider-test-success-face :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-test-failure-face :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-test-error-face :foreground nil t) 'unspecified)))

(ert-deftest bit-mage-test-cider-debug-faces ()
  "Test CIDER debug faces are properly defined."
  (unless (facep 'cider-debug-code-overlay-face)
    (defface cider-debug-code-overlay-face '((t)) "Test face"))
  (unless (facep 'cider-enlightened-face)
    (defface cider-enlightened-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'cider-debug-code-overlay-face :background nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-enlightened-face :foreground nil t) 'unspecified)))

(ert-deftest bit-mage-test-cider-stacktrace-faces ()
  "Test CIDER stacktrace faces are properly defined."
  (unless (facep 'cider-stacktrace-error-class-face)
    (defface cider-stacktrace-error-class-face '((t)) "Test face"))
  (unless (facep 'cider-stacktrace-fn-face)
    (defface cider-stacktrace-fn-face '((t)) "Test face"))
  (unless (facep 'cider-stacktrace-ns-face)
    (defface cider-stacktrace-ns-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'cider-stacktrace-error-class-face :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-stacktrace-fn-face :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'cider-stacktrace-ns-face :foreground nil t) 'unspecified)))

(ert-deftest bit-mage-test-eval-flash-wcag-contrast ()
  "Test that eval-sexp-fu-flash has sufficient WCAG AA contrast."
  (unless (facep 'eval-sexp-fu-flash)
    (defface eval-sexp-fu-flash '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (let* ((fg (face-attribute 'eval-sexp-fu-flash :foreground nil t))
         (bg (face-attribute 'eval-sexp-fu-flash :background nil t))
         (contrast (bit-mage-test--contrast-ratio fg bg)))
    (should (>= contrast 4.5))))

(ert-deftest bit-mage-test-smartparens-faces ()
  "Test smartparens faces are properly defined."
  (unless (facep 'sp-pair-overlay-face)
    (defface sp-pair-overlay-face '((t)) "Test face"))
  (unless (facep 'sp-wrap-overlay-face)
    (defface sp-wrap-overlay-face '((t)) "Test face"))
  (unless (facep 'sp-wrap-tag-overlay-face)
    (defface sp-wrap-tag-overlay-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'sp-pair-overlay-face :background nil t) 'unspecified))
  (should-not (equal (face-attribute 'sp-wrap-overlay-face :background nil t) 'unspecified))
  (should-not (equal (face-attribute 'sp-wrap-tag-overlay-face :background nil t) 'unspecified)))

(ert-deftest bit-mage-test-git-commit-faces ()
  "Test git-commit faces are properly defined."
  (unless (facep 'git-commit-summary)
    (defface git-commit-summary '((t)) "Test face"))
  (unless (facep 'git-commit-comment-heading)
    (defface git-commit-comment-heading '((t)) "Test face"))
  (unless (facep 'git-commit-comment-branch-local)
    (defface git-commit-comment-branch-local '((t)) "Test face"))
  (unless (facep 'git-commit-nonempty-second-line)
    (defface git-commit-nonempty-second-line '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'git-commit-summary :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'git-commit-comment-heading :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'git-commit-comment-branch-local :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'git-commit-nonempty-second-line :foreground nil t) 'unspecified)))

(ert-deftest bit-mage-test-hl-sexp-face ()
  "Test hl-sexp face is properly defined."
  (unless (facep 'hl-sexp-face)
    (defface hl-sexp-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'hl-sexp-face :background nil t) 'unspecified)))

(ert-deftest bit-mage-test-volatile-highlights-face ()
  "Test volatile-highlights face is properly defined."
  (unless (facep 'vhl/default-face)
    (defface vhl/default-face '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'vhl/default-face :background nil t) 'unspecified)))

(ert-deftest bit-mage-test-apropos-faces ()
  "Test apropos faces are properly defined."
  (unless (facep 'apropos-symbol)
    (defface apropos-symbol '((t)) "Test face"))
  (unless (facep 'apropos-function-button)
    (defface apropos-function-button '((t)) "Test face"))
  (unless (facep 'apropos-variable-button)
    (defface apropos-variable-button '((t)) "Test face"))
  (unless (facep 'apropos-misc-button)
    (defface apropos-misc-button '((t)) "Test face"))
  (load-theme 'bit-mage t)
  (should-not (equal (face-attribute 'apropos-symbol :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'apropos-function-button :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'apropos-variable-button :foreground nil t) 'unspecified))
  (should-not (equal (face-attribute 'apropos-misc-button :foreground nil t) 'unspecified)))

(provide 'bit-mage-test)
;;; bit-mage-test.el ends here
