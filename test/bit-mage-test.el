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

(provide 'bit-mage-test)
;;; bit-mage-test.el ends here
