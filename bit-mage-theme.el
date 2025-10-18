;;; bit-mage-theme.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 Raj Patil
;;
;; Author: Raj Patil <rajp152k@gmail.com>
;; Maintainer: Raj Patil <rajp152k@gmail.com>
;; Created: October 18, 2025
;; Modified: October 18, 2025
;; Version: 0.0.0
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/rp152k/bit-mage-theme
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;  Cyber Medieval Sourceror's Cave 
;;
;;; Code:


(deftheme bit-mage
  "(Bit-Mage)")


(custom-theme-set-faces
 'bit-mage
 '(mouse ((t (:background "#000000"))))
 '(cursor ((t (:background "white"))))
 '(border ((t (:background "green"))))
 '(list-matching-lines-buffer-name-face ((t (:foreground "#00CC00" :background "black" :underline t))))
 '(list-matching-lines-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(paren-match-face ((t (:background "black" :foreground "darkgreen"))))
 '(paren-mismatch-face ((t (:foreground "#FFFFFF" :background "slate blue" :strike-through t))))
 '(paren-no-match-face ((t (:background "black" :foreground "red"))))
 '(view-highlight-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(widget-mouse-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(Buffer-menu-buffer-face ((t (:bold t :weight bold))))
 '(bold ((t (:bold t :foreground "slate blue" :background "black"))))
 '(bold-italic ((t (:italic t :bold t :slant oblique :weight semi-bold))))
 '(button ((t (:underline t))))
 '(comint-highlight-input ((t (nil))))
 '(comint-highlight-prompt ((t (:bold t :foreground "#00CC00" :background "black" :weight bold))))
 '(custom-button-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(custom-button-pressed-face ((t (nil))))
 '(custom-changed-face ((t (:italic t :foreground "#00CC00" :background "black" :slant oblique))))
 '(custom-comment-face ((t (nil))))
 '(custom-comment-tag-face ((t (nil))))
 '(custom-documentation-face ((t (nil))))
 '(custom-face-tag-face ((t (nil))))
 '(custom-group-tag-face ((t (nil))))
 '(custom-group-tag-face-1 ((t (nil))))
 '(custom-invalid-face ((t (:foreground "#00CC00" :background "black" :strike-through t))))
 '(custom-modified-face ((t (nil))))
 '(custom-rogue-face ((t (nil))))
 '(custom-saved-face ((t (nil))))
 '(custom-set-face ((t (nil))))
 '(custom-state-face ((t (nil))))
 '(custom-variable-button-face ((t (nil))))
 '(custom-variable-tag-face ((t (nil))))
 '(fixed-pitch ((t (nil))))
 '(font-latex-string-face ((t (:bold t :weight semi-bold :foreground "seagreen" :background "black"))))
 '(font-latex-warning-face ((t (:bold t :weight semi-bold :background "darkblue" :foreground "#00CC00"))))
 '(font-lock-builtin-face ((t (:foreground "seagreen1"))))
 '(font-lock-comment-face ((t (:background "black" :foreground "medium spring green"))))
 '(font-lock-constant-face ((t (nil))))
 '(font-lock-doc-face ((t (:bold t :background "black" :foreground "seagreen" :weight semi-bold))))
 '(font-lock-function-name-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(font-lock-keyword-face ((t (:bold t :background "black" :foreground "green" :underline t :weight semi-bold))))
 '(font-lock-preprocessor-face ((t (:foreground "slate blue"))))
 '(font-lock-string-face ((t (:bold t :background "black" :foreground "seagreen" :weight semi-bold))))
 '(font-lock-type-face ((t (nil))))
 '(font-lock-variable-name-face ((t (nil))))
 '(font-lock-warning-face ((t (:bold t :foreground "#00CC00" :background "darkblue" :weight semi-bold))))
 '(fringe ((t (:foreground "#00CC00" :background "#151515"))))
 '(header-line ((t (nil))))
 '(highlight ((t (:bold t :foreground "pale green" :background "purple4"))))
 '(ido-first-match-face ((t (:bold t :weight bold))))
 '(ido-indicator-face ((t (:background "slate blue" :foreground "#FFFFFF" :width condensed))))
 '(ido-only-match-face ((t (:foreground "ForestGreen"))))
 '(ido-subdir-face ((t (:foreground "red"))))
 '(isearch ((t (:background "seagreen" :foreground "black"))))
 '(isearch-lazy-highlight-face ((t (:background "darkseagreen" :foreground "black"))))
 '(italic ((t (:italic t :foreground "#00FF00" :background "black" :slant oblique))))
 '(menu ((t (:bold t :background "black" :foreground "green" :weight semi-bold :box (:line-width -1 :color "#606060")))))
 '(message-cited-text-face ((t (:italic t :foreground "#00CC00" :background "black" :slant oblique))))
 '(message-header-cc-face ((t (nil))))
 '(message-header-name-face ((t (nil))))
 '(message-header-newsgroups-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(message-header-other-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(message-header-subject-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(message-header-to-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(message-header-xheader-face ((t (nil))))
 '(message-mml-face ((t (:italic t :foreground "#00CC00" :background "black" :slant oblique))))
 '(message-separator-face ((t (nil))))
 '(minibuffer-prompt ((t (:background "black" :foreground "seagreen"))))
 '(mode-line ((t (:bold t :background "black" :foreground "DarkOrchid4" :weight semi-bold :box (:line-width 5 :color "DarkOrchid4")))))
 '(mode-line-inactive ((t (:bold t :weight semi-bold :foreground "green" :box (:line-width 5 :color "dark green") :background "black"))))
 '(paren-face ((t (:background "black" :foreground "darkgreen"))))
 '(paren-face-match ((t (:background "black" :foreground "springgreen"))))
 '(paren-face-mismatch ((t (:foreground "#00CC00" :background "black" :strike-through t))))
 '(paren-face-no-match ((t (:background "black" :foreground "red"))))
 '(region ((t (:bold t :background "dark olive green" :foreground "white"))))
 '(scroll-bar ((t (nil))))
 '(secondary-selection ((t (:background "darkseagreen" :foreground "black"))))
 '(semantic-dirty-token-face ((t (:background "gray10"))))
 '(semantic-unmatched-syntax-face ((t (:underline "red"))))
 '(sgml-end-tag-face ((t (:foreground "seagreen"))))
 '(sgml-start-tag-face ((t (:foreground "seagreen"))))
 '(tabbar-button-face ((t (:background "black" :foreground "#00cc00" :box (:line-width 2 :color "black" :style released-button)))))
 '(tabbar-default-face ((t (:background "black" :foreground "#00cc00"))))
 '(tabbar-selected-face ((t (:background "black" :foreground "springgreen" :box (:line-width 2 :color "black" :style released-button)))))
 '(tabbar-separator-face ((t (:foreground "#00cc00" :background "black" :box (:line-width 2 :color "black" :style pressed-button)))))
 '(tabbar-unselected-face ((t (:background "black" :foreground "seagreen"))))
 '(tool-bar ((t (:box (:line-width 1 :style released-button)))))
 '(tooltip ((t (nil))))
 '(trailing-whitespace ((t (:background "lightseagreen" :foreground "black"))))
 '(underline ((t (:foreground "#00CC00" :background "black" :underline t))))
 '(variable-pitch ((t (:underline nil :foreground "#00CC00" :background "black"))))
 '(widget-button-face ((t (:bold t :foreground "#00CC00" :background "black"))))
 '(widget-button-pressed-face ((t (nil))))
 '(widget-documentation-face ((t (nil))))
 '(widget-field-face ((t (:italic t :foreground "#00CC00" :background "black" :slant oblique))))
 '(widget-inactive-face ((t (nil))))
 '(widget-single-line-field-face ((t (nil))))
 '(default ((t (:background "black" :foreground "green")))))

(provide 'bit-mage)
;;; bit-mage-theme.el ends here
