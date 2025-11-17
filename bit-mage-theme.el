;;; bit-mage-theme.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 Raj Patil
;;
;; Author: Raj Patil <rajp152k@gmail.com>
;; Maintainer: Raj Patil <rajp152k@gmail.com>
;; Created: October 18, 2025
;; Modified: Nov 17, 2025
;; Version: 1.1.0
;; Keywords: theme bit-mage dark
;; Homepage: https://github.com/rp152k/bit-mage-theme
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;  Cyber Medieval Sourceror's Cave
;;
;;  Description:
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
 '(list-matching-lines-buffer-name-face ((t (:foreground "#00CC00"  :underline t))))
 '(list-matching-lines-face ((t (:bold t :foreground "#00CC00" ))))
 '(paren-match-face ((t ( :foreground "darkgreen"))))
 '(paren-mismatch-face ((t (:foreground "#FFFFFF" :strike-through t))))
 '(paren-no-match-face ((t ( :foreground "red"))))
 '(view-highlight-face ((t (:bold t :foreground "#00CC00" ))))
 '(widget-mouse-face ((t (:bold t :foreground "#00CC00" ))))
 '(Buffer-menu-buffer-face ((t (:bold t :weight bold))))
 '(bold ((t (:bold t :foreground "slate blue" ))))
 '(bold-italic ((t (:italic t :bold t :slant oblique :weight semi-bold))))
 '(button ((t (:underline t))))
 '(comint-highlight-input ((t (nil))))
 '(comint-highlight-prompt ((t (:bold t :foreground "#00CC00"  :weight bold))))
 '(custom-button-face ((t (:bold t :foreground "#00CC00" ))))
 '(custom-button-pressed-face ((t (nil))))
 '(custom-changed-face ((t (:italic t :foreground "#00CC00"  :slant oblique))))
 '(custom-comment-face ((t (nil))))
 '(custom-comment-tag-face ((t (nil))))
 '(custom-documentation-face ((t (nil))))
 '(custom-face-tag-face ((t (nil))))
 '(custom-group-tag-face ((t (nil))))
 '(custom-group-tag-face-1 ((t (nil))))
 '(custom-invalid-face ((t (:foreground "#00CC00"  :strike-through t))))
 '(custom-modified-face ((t (nil))))
 '(custom-rogue-face ((t (nil))))
 '(custom-saved-face ((t (nil))))
 '(custom-set-face ((t (nil))))
 '(custom-state-face ((t (nil))))
 '(custom-variable-button-face ((t (nil))))
 '(custom-variable-tag-face ((t (nil))))
 '(fixed-pitch ((t (nil))))
 '(font-latex-string-face ((t (:bold t :weight semi-bold :foreground "lightslateblue" ))))
 '(font-latex-warning-face ((t (:bold t :weight semi-bold :background "darkblue" :foreground "#00CC00"))))
 '(font-lock-builtin-face ((t (:foreground "slateblue"))))
 '(font-lock-comment-face ((t ( :foreground "medium spring green"))))
 '(font-lock-constant-face ((t (nil))))
 '(font-lock-doc-face ((t (:bold t  :foreground "lightslateblue" :weight semi-bold))))
 '(font-lock-function-name-face ((t (:bold t :foreground "#00CC00" ))))
 '(font-lock-keyword-face ((t (:bold t  :foreground "green" :underline t :weight semi-bold))))
 '(font-lock-preprocessor-face ((t (:foreground "slate blue"))))
 '(font-lock-string-face ((t (:bold t  :foreground "lightslateblue" :weight semi-bold))))
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
 '(isearch ((t (:background "lightslateblue" :foreground "gray1"))))
 '(isearch-lazy-highlight-face ((t (:background "darkslateblue" :foreground "gray1"))))
 '(italic ((t (:italic t :foreground "#00FF00"  :slant oblique))))
 '(menu ((t (:bold t  :foreground "green" :weight semi-bold :box (:line-width -1 :color "#606060")))))
 '(message-cited-text-face ((t (:italic t :foreground "#00CC00"  :slant oblique))))
 '(message-header-cc-face ((t (nil))))
 '(message-header-name-face ((t (nil))))
 '(message-header-newsgroups-face ((t (:bold t :foreground "#00CC00" ))))
 '(message-header-other-face ((t (:bold t :foreground "#00CC00" ))))
 '(message-header-subject-face ((t (:bold t :foreground "#00CC00" ))))
 '(message-header-to-face ((t (:bold t :foreground "#00CC00" ))))
 '(message-header-xheader-face ((t (nil))))
 '(message-mml-face ((t (:italic t :foreground "#00CC00"  :slant oblique))))
 '(message-separator-face ((t (nil))))
 '(minibuffer-prompt ((t ( :foreground "lightslateblue"))))
 '(mode-line ((t (:bold t  :foreground "DarkOrchid4" :weight semi-bold :box (:line-width 5 :color "DarkOrchid4")))))
 '(mode-line-inactive ((t (:bold t :weight semi-bold :foreground "green" :box (:line-width 5 :color "dark green") ))))
 '(paren-face ((t ( :foreground "darkgreen"))))
 '(paren-face-match ((t ( :foreground "springgreen"))))
 '(paren-face-mismatch ((t (:foreground "#00CC00"  :strike-through t))))
 '(paren-face-no-match ((t ( :foreground "red"))))
 '(region ((t (:bold t :background "dark olive green" :foreground "white"))))
 '(scroll-bar ((t (nil))))
 '(secondary-selection ((t (:background "darkslateblue" :foreground "gray1"))))
 '(semantic-dirty-token-face ((t (:background "gray10"))))
 '(semantic-unmatched-syntax-face ((t (:underline "red"))))
 '(sgml-end-tag-face ((t (:foreground "lightslateblue"))))
 '(sgml-start-tag-face ((t (:foreground "lightslateblue"))))
 '(tabbar-button-face ((t ( :foreground "#00cc00" :box (:line-width 2 :color "gray1" :style released-button)))))
 '(tabbar-default-face ((t ( :foreground "#00cc00"))))
 '(tabbar-selected-face ((t ( :foreground "springgreen" :box (:line-width 2 :color "gray1" :style released-button)))))
 '(tabbar-separator-face ((t (:foreground "#00cc00"  :box (:line-width 2 :color "gray1" :style pressed-button)))))
 '(tabbar-unselected-face ((t ( :foreground "lightslateblue"))))
 '(tool-bar ((t (:box (:line-width 1 :style released-button)))))
 '(tooltip ((t (nil))))
 '(trailing-whitespace ((t (:background "lightseagreen" :foreground "gray1"))))
 '(underline ((t (:foreground "#00CC00"  :underline t))))
 '(variable-pitch ((t (:underline nil :foreground "#00CC00" ))))
 '(widget-button-face ((t (:bold t :foreground "#00CC00" ))))
 '(widget-button-pressed-face ((t (nil))))
 '(widget-documentation-face ((t (nil))))
 '(widget-field-face ((t (:italic t :foreground "#00CC00"  :slant oblique))))
 '(widget-inactive-face ((t (nil))))
 '(widget-single-line-field-face ((t (nil))))

 '(doom-dashboard-banner ((t (:bold t :foreground "slateblue"))))
 '(doom-dashboard-loaded ((t (:bold t :foreground "slateblue"))))
 '(doom-dashboard-menu-desc ((t (:bold t :foreground "slateblue"))))
 '(doom-dashboard-menu-title ((t (:bold t :foreground "slateblue"))))
 '(doom-dashboard-footer-icon ((t (:bold t :foreground "slateblue"))))

 '(doom-modeline-evil-normal-state ((t (:foreground "slateblue"))))

 '(doom-modeline-buffer-modified ((t (:bold t :foreground "green"))))

 '(default ((t (:background "gray1" :foreground "green")))))

(provide 'bit-mage)
;;; bit-mage-theme.el ends here
