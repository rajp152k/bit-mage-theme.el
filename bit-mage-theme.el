;;; bit-mage-theme.el --- Cyber Medieval Sourceror's Cave -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 Raj Patil
;;
;; Author: Raj Patil <rajp152k@gmail.com>
;; Maintainer: Raj Patil <rajp152k@gmail.com>
;; Created: October 18, 2025
;; Modified: Jan 18, 2026
;; Version: 2.0.0
;; Keywords: faces themes
;; Homepage: https://github.com/rajp152k/bit-mage-theme
;; Package-Requires: ((emacs "28.1"))
;;
;; This file is not part of GNU Emacs.
;; SPDX-License-Identifier: GPL-3.0-or-later
;;
;;; Commentary:
;;
;;  Bit-Mage: Cyber Medieval Sourceror's Cave
;;
;;  A dark cyberpunk theme with neon green and slateblue accents.
;;  Designed for the hacker wizard aesthetic.
;;
;;; Code:

(deftheme bit-mage
  "Cyber Medieval Sourceror's Cave - A dark cyberpunk hacker theme.")

;;;; Color Palette
;; Define colors as variables for consistency and maintainability

(let* (;; Background shades
       (bg-void      "gray1")
       (bg-dark      "#101010")
       (bg-medium    "#151515")
       (bg-light     "#1a1a1a")
       (bg-highlight "#202020")
       (bg-selection "dark olive green")
       (bg-region    "purple4")

       ;; Foreground shades
       (fg-main      "green")
       (fg-dim       "dark green")
       (fg-bright    "#00FF00")
       (fg-muted     "#00CC00")

       ;; Primary accent: Greens (the hacker matrix vibe)
       (green-neon      "#00FF00")
       (green-bright    "#00CC00")
       (green-medium    "green")
       (green-spring    "spring green")
       (green-pale      "pale green")
       (green-forest    "ForestGreen")
       (green-dark      "dark green")
       (green-sea       "lightseagreen")

       ;; Secondary accent: Blues/Purples (the cyber wizard vibe)
       (blue-slate      "slateblue")
       (blue-light      "lightslateblue")
       (blue-dark       "darkslateblue")
       (blue-deep       "darkblue")

       ;; Tertiary accent: Purples (the arcane vibe)
       (purple-orchid   "DarkOrchid4")
       (purple-deep     "purple4")

       ;; Semantic colors
       (red-error       "#ff5f5f")
       (red-warning     "red")
       (orange-warning  "#ffaf00")
       (yellow-info     "#ffd700")
       (cyan-info       "cyan")

       ;; Neutrals
       (white           "white")
       (black           "#000000")
       (gray-light      "#606060")
       (gray-dark       "gray10"))

;;;; Face Definitions

  (custom-theme-set-faces
   'bit-mage

;;;;; Core Emacs Faces

   ;; Default
   `(default ((t (:background ,bg-void :foreground ,fg-main))))
   `(cursor ((t (:background ,white))))
   `(mouse ((t (:background ,black))))
   `(border ((t (:background ,green-medium))))

   ;; Basic faces
   `(bold ((t (:bold t :foreground ,blue-slate))))
   `(bold-italic ((t (:italic t :bold t :slant oblique :weight semi-bold))))
   `(italic ((t (:italic t :foreground ,green-neon :slant oblique))))
   `(underline ((t (:foreground ,green-bright :underline t))))
   `(fixed-pitch ((t (:inherit default))))
   `(variable-pitch ((t (:underline nil :foreground ,green-bright))))

   ;; Critical semantic faces (RELIABILITY)
   `(error ((t (:foreground ,red-error :bold t))))
   `(warning ((t (:foreground ,orange-warning :bold t))))
   `(success ((t (:foreground ,green-spring :bold t))))
   `(shadow ((t (:foreground ,gray-light))))
   `(link ((t (:foreground ,blue-light :underline t))))
   `(link-visited ((t (:foreground ,blue-dark :underline t))))
   `(match ((t (:background ,blue-dark :foreground ,white :bold t))))
   `(escape-glyph ((t (:foreground ,cyan-info))))
   `(homoglyph ((t (:foreground ,cyan-info))))
   `(nobreak-space ((t (:foreground ,cyan-info :underline t))))
   `(nobreak-hyphen ((t (:foreground ,cyan-info))))

   ;; Line numbers (RELIABILITY - display-line-numbers-mode)
   `(line-number ((t (:foreground ,green-dark :background ,bg-dark))))
   `(line-number-current-line ((t (:foreground ,green-neon :background ,bg-highlight :bold t))))
   `(line-number-major-tick ((t (:foreground ,green-bright :background ,bg-dark :bold t))))
   `(line-number-minor-tick ((t (:foreground ,green-forest :background ,bg-dark))))

   ;; Window/Frame
   `(fringe ((t (:foreground ,green-bright :background ,bg-medium))))
   `(vertical-border ((t (:foreground ,green-dark))))
   `(window-divider ((t (:foreground ,green-dark))))
   `(window-divider-first-pixel ((t (:foreground ,bg-dark))))
   `(window-divider-last-pixel ((t (:foreground ,bg-dark))))
   `(scroll-bar ((t (:foreground ,green-bright :background ,bg-dark))))
   `(tool-bar ((t (:box (:line-width 1 :style released-button)))))
   `(tooltip ((t (:background ,bg-light :foreground ,green-bright))))
   `(menu ((t (:bold t :foreground ,green-medium :weight semi-bold :box (:line-width -1 :color ,gray-light)))))
   `(header-line ((t (:background ,bg-dark :foreground ,green-bright :box (:line-width 1 :color ,green-dark)))))
   `(header-line-highlight ((t (:background ,bg-highlight :foreground ,green-neon))))

   ;; Mode line
   `(mode-line ((t (:bold t :foreground ,purple-orchid :weight semi-bold :box (:line-width 5 :color ,purple-orchid)))))
   `(mode-line-inactive ((t (:bold t :weight semi-bold :foreground ,green-medium :box (:line-width 5 :color ,green-dark)))))
   `(mode-line-buffer-id ((t (:bold t :foreground ,green-neon))))
   `(mode-line-emphasis ((t (:bold t :foreground ,green-spring))))
   `(mode-line-highlight ((t (:box (:line-width 2 :color ,green-bright)))))

   ;; Highlight faces
   `(highlight ((t (:bold t :foreground ,green-pale :background ,purple-deep))))
   `(region ((t (:bold t :background ,bg-selection :foreground ,white))))
   `(secondary-selection ((t (:background ,blue-dark :foreground ,white))))
   `(hl-line ((t (:background ,bg-highlight))))
   `(lazy-highlight ((t (:background ,blue-dark :foreground ,white))))
   `(trailing-whitespace ((t (:background ,green-sea :foreground ,white))))

   ;; Search
   `(isearch ((t (:background ,blue-light :foreground ,white :bold t))))
   `(isearch-fail ((t (:background ,red-error :foreground ,white))))
   `(isearch-lazy-highlight-face ((t (:background ,blue-dark :foreground ,white))))

   ;; Minibuffer/Completions
   `(minibuffer-prompt ((t (:foreground ,blue-light :bold t))))
   `(completions-annotations ((t (:foreground ,green-forest :italic t))))
   `(completions-common-part ((t (:foreground ,green-spring :bold t))))
   `(completions-first-difference ((t (:foreground ,green-neon :bold t))))
   `(completions-group-title ((t (:foreground ,blue-slate :bold t :underline t))))
   `(completions-group-separator ((t (:foreground ,green-dark :strike-through t))))

   ;; Help
   `(help-key-binding ((t (:foreground ,blue-light :background ,bg-dark :box (:line-width 1 :color ,green-dark)))))
   `(help-for-help-header ((t (:foreground ,green-bright :bold t :height 1.2))))
   `(describe-variable-value ((t (:foreground ,green-spring))))

   ;; Button
   `(button ((t (:underline t :foreground ,blue-light))))

;;;;; Font Lock (Syntax Highlighting)

   `(font-lock-builtin-face ((t (:foreground ,blue-slate))))
   `(font-lock-comment-face ((t (:foreground ,green-spring))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,green-forest))))
   `(font-lock-constant-face ((t (:foreground ,cyan-info))))
   `(font-lock-doc-face ((t (:bold t :foreground ,blue-light :weight semi-bold))))
   `(font-lock-function-name-face ((t (:bold t :foreground ,green-bright))))
   `(font-lock-keyword-face ((t (:bold t :foreground ,green-medium :underline t :weight semi-bold))))
   `(font-lock-negation-char-face ((t (:foreground ,red-error))))
   `(font-lock-preprocessor-face ((t (:foreground ,blue-slate))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,orange-warning :bold t))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,orange-warning :bold t))))
   `(font-lock-string-face ((t (:bold t :foreground ,blue-light :weight semi-bold))))
   `(font-lock-type-face ((t (:foreground ,blue-slate :italic t))))
   `(font-lock-variable-name-face ((t (:foreground ,green-pale))))
   `(font-lock-warning-face ((t (:bold t :foreground ,green-bright :background ,blue-deep :weight semi-bold))))

   ;; Emacs 29+ tree-sitter faces
   `(font-lock-bracket-face ((t (:foreground ,green-forest))))
   `(font-lock-delimiter-face ((t (:foreground ,green-forest))))
   `(font-lock-escape-face ((t (:foreground ,orange-warning))))
   `(font-lock-function-call-face ((t (:foreground ,green-bright))))
   `(font-lock-misc-punctuation-face ((t (:foreground ,green-forest))))
   `(font-lock-number-face ((t (:foreground ,cyan-info))))
   `(font-lock-operator-face ((t (:foreground ,green-medium))))
   `(font-lock-property-name-face ((t (:foreground ,green-pale))))
   `(font-lock-property-use-face ((t (:foreground ,green-pale))))
   `(font-lock-punctuation-face ((t (:foreground ,green-forest))))
   `(font-lock-variable-use-face ((t (:foreground ,green-pale))))

;;;;; Paren matching

   `(show-paren-match ((t (:foreground ,green-spring :background ,bg-highlight :bold t))))
   `(show-paren-match-expression ((t (:background ,bg-highlight))))
   `(show-paren-mismatch ((t (:foreground ,red-error :background ,bg-void :strike-through t))))
   `(paren-face ((t (:foreground ,green-dark))))
   `(paren-face-match ((t (:foreground ,green-spring))))
   `(paren-face-mismatch ((t (:foreground ,green-bright :strike-through t))))
   `(paren-face-no-match ((t (:foreground ,red-warning))))
   `(paren-match-face ((t (:foreground ,green-dark))))
   `(paren-mismatch-face ((t (:foreground ,white :strike-through t))))
   `(paren-no-match-face ((t (:foreground ,red-warning))))

;;;;; Ido

   `(ido-first-match-face ((t (:bold t :weight bold :foreground ,green-spring))))
   `(ido-indicator-face ((t (:background ,blue-slate :foreground ,white :width condensed))))
   `(ido-only-match-face ((t (:foreground ,green-forest :bold t))))
   `(ido-subdir-face ((t (:foreground ,blue-light))))
   `(ido-virtual ((t (:foreground ,green-dark))))
   `(ido-incomplete-regexp ((t (:foreground ,red-error))))

;;;;; Comint/Shell

   `(comint-highlight-input ((t (:foreground ,green-bright))))
   `(comint-highlight-prompt ((t (:bold t :foreground ,green-bright :weight bold))))

;;;;; Custom/Widget

   `(custom-button ((t (:bold t :foreground ,green-bright :box (:line-width 2 :style released-button)))))
   `(custom-button-pressed ((t (:foreground ,green-dark :box (:line-width 2 :style pressed-button)))))
   `(custom-button-mouse ((t (:foreground ,green-neon :box (:line-width 2 :style released-button)))))
   `(custom-changed ((t (:italic t :foreground ,orange-warning :slant oblique))))
   `(custom-comment ((t (:foreground ,green-forest))))
   `(custom-comment-tag ((t (:foreground ,green-dark))))
   `(custom-documentation ((t (:foreground ,green-pale))))
   `(custom-face-tag ((t (:foreground ,blue-light :bold t))))
   `(custom-group-tag ((t (:foreground ,blue-slate :bold t :height 1.2))))
   `(custom-group-tag-1 ((t (:foreground ,green-spring :bold t :height 1.1))))
   `(custom-invalid ((t (:foreground ,red-error :strike-through t))))
   `(custom-modified ((t (:foreground ,orange-warning))))
   `(custom-rogue ((t (:foreground ,red-warning :background ,bg-dark))))
   `(custom-saved ((t (:foreground ,green-spring :underline t))))
   `(custom-set ((t (:foreground ,green-bright))))
   `(custom-state ((t (:foreground ,green-spring))))
   `(custom-variable-button ((t (:foreground ,green-bright :underline t))))
   `(custom-variable-tag ((t (:foreground ,blue-slate :bold t))))
   `(custom-visibility ((t (:foreground ,blue-light :underline t))))

   `(widget-button ((t (:bold t :foreground ,green-bright))))
   `(widget-button-pressed ((t (:foreground ,green-dark))))
   `(widget-documentation ((t (:foreground ,green-pale))))
   `(widget-field ((t (:background ,bg-dark :foreground ,green-bright :box (:line-width 1 :color ,green-dark)))))
   `(widget-inactive ((t (:foreground ,gray-light))))
   `(widget-single-line-field ((t (:background ,bg-dark :foreground ,green-bright))))
   `(widget-mouse-face ((t (:bold t :foreground ,green-bright))))

;;;;; Message/Email

   `(message-cited-text ((t (:italic t :foreground ,green-bright :slant oblique))))
   `(message-cited-text-1 ((t (:foreground ,green-bright))))
   `(message-cited-text-2 ((t (:foreground ,green-forest))))
   `(message-cited-text-3 ((t (:foreground ,green-dark))))
   `(message-cited-text-4 ((t (:foreground ,gray-light))))
   `(message-header-cc ((t (:foreground ,green-spring))))
   `(message-header-name ((t (:foreground ,blue-slate :bold t))))
   `(message-header-newsgroups ((t (:bold t :foreground ,green-bright))))
   `(message-header-other ((t (:bold t :foreground ,green-bright))))
   `(message-header-subject ((t (:bold t :foreground ,green-neon))))
   `(message-header-to ((t (:bold t :foreground ,green-bright))))
   `(message-header-xheader ((t (:foreground ,blue-light))))
   `(message-mml ((t (:italic t :foreground ,green-bright :slant oblique))))
   `(message-separator ((t (:foreground ,green-dark))))

;;;;; Tabbar

   `(tabbar-button ((t (:foreground ,green-bright :box (:line-width 2 :color ,white :style released-button)))))
   `(tabbar-default ((t (:foreground ,green-bright :background ,bg-void))))
   `(tabbar-selected ((t (:foreground ,green-spring :box (:line-width 2 :color ,white :style released-button)))))
   `(tabbar-separator ((t (:foreground ,green-bright :box (:line-width 2 :color ,white :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,blue-light))))

;;;;; Tab-bar (built-in Emacs 27+)

   `(tab-bar ((t (:background ,bg-dark :foreground ,green-bright))))
   `(tab-bar-tab ((t (:background ,bg-void :foreground ,green-neon :box (:line-width 2 :color ,green-dark)))))
   `(tab-bar-tab-inactive ((t (:background ,bg-dark :foreground ,green-forest))))
   `(tab-bar-tab-ungrouped ((t (:background ,bg-dark :foreground ,green-dark))))
   `(tab-bar-tab-group-current ((t (:background ,bg-void :foreground ,green-spring :bold t))))
   `(tab-bar-tab-group-inactive ((t (:background ,bg-dark :foreground ,green-forest))))

;;;;; Tab-line (built-in Emacs 27+)

   `(tab-line ((t (:background ,bg-dark :foreground ,green-bright))))
   `(tab-line-tab ((t (:background ,bg-void :foreground ,green-neon))))
   `(tab-line-tab-current ((t (:background ,bg-void :foreground ,green-neon :bold t))))
   `(tab-line-tab-inactive ((t (:background ,bg-dark :foreground ,green-forest))))
   `(tab-line-highlight ((t (:background ,bg-highlight :foreground ,green-neon))))
   `(tab-line-close-highlight ((t (:foreground ,red-error))))

;;;;; LaTeX

   `(font-latex-string-face ((t (:bold t :weight semi-bold :foreground ,blue-light))))
   `(font-latex-warning-face ((t (:bold t :weight semi-bold :background ,blue-deep :foreground ,green-bright))))
   `(font-latex-bold-face ((t (:bold t :foreground ,green-bright))))
   `(font-latex-italic-face ((t (:italic t :foreground ,green-spring))))
   `(font-latex-math-face ((t (:foreground ,cyan-info))))
   `(font-latex-sectioning-0-face ((t (:foreground ,blue-slate :bold t :height 1.4))))
   `(font-latex-sectioning-1-face ((t (:foreground ,blue-slate :bold t :height 1.3))))
   `(font-latex-sectioning-2-face ((t (:foreground ,blue-slate :bold t :height 1.2))))
   `(font-latex-sectioning-3-face ((t (:foreground ,blue-slate :bold t :height 1.1))))
   `(font-latex-sectioning-4-face ((t (:foreground ,blue-slate :bold t))))
   `(font-latex-sectioning-5-face ((t (:foreground ,blue-slate))))

;;;;; SGML/XML

   `(sgml-end-tag-face ((t (:foreground ,blue-light))))
   `(sgml-start-tag-face ((t (:foreground ,blue-light))))

;;;;; Semantic

   `(semantic-dirty-token-face ((t (:background ,gray-dark))))
   `(semantic-unmatched-syntax-face ((t (:underline ,red-warning))))
   `(semantic-highlight-func-current-tag-face ((t (:background ,bg-highlight))))

;;;;; Listing (matching lines)

   `(list-matching-lines-buffer-name-face ((t (:foreground ,green-bright :underline t))))
   `(list-matching-lines-face ((t (:bold t :foreground ,green-bright))))
   `(view-highlight-face ((t (:bold t :foreground ,green-bright))))

;;;;; Doom Dashboard

   `(doom-dashboard-banner ((t (:bold t :foreground ,blue-slate))))
   `(doom-dashboard-loaded ((t (:bold t :foreground ,blue-slate))))
   `(doom-dashboard-menu-desc ((t (:bold t :foreground ,blue-slate))))
   `(doom-dashboard-menu-title ((t (:bold t :foreground ,blue-slate))))
   `(doom-dashboard-footer-icon ((t (:bold t :foreground ,blue-slate))))

;;;;; Doom Modeline

   `(doom-modeline-bar ((t (:background ,green-bright))))
   `(doom-modeline-bar-inactive ((t (:background ,green-dark))))
   `(doom-modeline-buffer-file ((t (:foreground ,green-bright :bold t))))
   `(doom-modeline-buffer-major-mode ((t (:foreground ,blue-slate :bold t))))
   `(doom-modeline-buffer-minor-mode ((t (:foreground ,green-forest))))
   `(doom-modeline-buffer-modified ((t (:bold t :foreground ,green-medium))))
   `(doom-modeline-buffer-path ((t (:foreground ,green-forest))))
   `(doom-modeline-evil-normal-state ((t (:foreground ,blue-slate :bold t))))
   `(doom-modeline-evil-insert-state ((t (:foreground ,green-neon :bold t))))
   `(doom-modeline-evil-visual-state ((t (:foreground ,orange-warning :bold t))))
   `(doom-modeline-evil-replace-state ((t (:foreground ,red-error :bold t))))
   `(doom-modeline-evil-emacs-state ((t (:foreground ,purple-orchid :bold t))))
   `(doom-modeline-info ((t (:foreground ,green-spring))))
   `(doom-modeline-warning ((t (:foreground ,orange-warning))))
   `(doom-modeline-urgent ((t (:foreground ,red-error))))
   `(doom-modeline-project-dir ((t (:foreground ,blue-slate))))
   `(doom-modeline-project-root-dir ((t (:foreground ,blue-slate :bold t))))

;;;;; Org-mode

   `(org-level-1 ((t (:foreground ,green-neon :bold t :height 1.3))))
   `(org-level-2 ((t (:foreground ,blue-slate :bold t :height 1.2))))
   `(org-level-3 ((t (:foreground ,green-spring :bold t :height 1.1))))
   `(org-level-4 ((t (:foreground ,blue-light :bold t))))
   `(org-level-5 ((t (:foreground ,green-bright))))
   `(org-level-6 ((t (:foreground ,green-forest))))
   `(org-level-7 ((t (:foreground ,blue-dark))))
   `(org-level-8 ((t (:foreground ,green-dark))))

   `(org-document-title ((t (:foreground ,green-neon :bold t :height 1.5))))
   `(org-document-info ((t (:foreground ,blue-light))))
   `(org-document-info-keyword ((t (:foreground ,green-forest))))

   `(org-todo ((t (:foreground ,red-error :bold t :box (:line-width 1 :color ,red-error)))))
   `(org-done ((t (:foreground ,green-spring :bold t :strike-through t))))
   `(org-headline-done ((t (:foreground ,green-dark :strike-through t))))

   `(org-date ((t (:foreground ,cyan-info :underline t))))
   `(org-time-grid ((t (:foreground ,green-forest))))
   `(org-scheduled ((t (:foreground ,green-bright))))
   `(org-scheduled-today ((t (:foreground ,green-neon :bold t))))
   `(org-scheduled-previously ((t (:foreground ,orange-warning))))
   `(org-upcoming-deadline ((t (:foreground ,orange-warning :bold t))))
   `(org-deadline-announce ((t (:foreground ,red-error))))

   `(org-agenda-date ((t (:foreground ,blue-slate))))
   `(org-agenda-date-today ((t (:foreground ,green-neon :bold t :underline t))))
   `(org-agenda-date-weekend ((t (:foreground ,blue-light))))
   `(org-agenda-done ((t (:foreground ,green-forest :strike-through t))))
   `(org-agenda-structure ((t (:foreground ,blue-slate :bold t))))
   `(org-agenda-current-time ((t (:foreground ,green-spring :bold t))))

   `(org-table ((t (:foreground ,green-bright))))
   `(org-formula ((t (:foreground ,cyan-info))))
   `(org-code ((t (:foreground ,green-spring :background ,bg-dark))))
   `(org-verbatim ((t (:foreground ,blue-light :background ,bg-dark))))
   `(org-block ((t (:background ,bg-dark :extend t))))
   `(org-block-begin-line ((t (:foreground ,green-forest :background ,bg-dark :extend t))))
   `(org-block-end-line ((t (:foreground ,green-forest :background ,bg-dark :extend t))))
   `(org-quote ((t (:foreground ,green-spring :italic t :background ,bg-dark :extend t))))

   `(org-link ((t (:foreground ,blue-light :underline t))))
   `(org-footnote ((t (:foreground ,cyan-info :underline t))))
   `(org-tag ((t (:foreground ,green-forest :bold t))))
   `(org-priority ((t (:foreground ,orange-warning :bold t))))
   `(org-checkbox ((t (:foreground ,green-bright :bold t))))
   `(org-checkbox-statistics-todo ((t (:foreground ,orange-warning))))
   `(org-checkbox-statistics-done ((t (:foreground ,green-spring))))

   `(org-special-keyword ((t (:foreground ,green-forest))))
   `(org-meta-line ((t (:foreground ,green-dark))))
   `(org-drawer ((t (:foreground ,blue-dark))))
   `(org-property-value ((t (:foreground ,green-pale))))

   `(org-ellipsis ((t (:foreground ,green-forest :underline nil))))
   `(org-hide ((t (:foreground ,bg-void))))

   `(org-warning ((t (:foreground ,orange-warning :bold t))))

;;;;; Magit

   `(magit-section-heading ((t (:foreground ,green-neon :bold t))))
   `(magit-section-heading-selection ((t (:foreground ,green-spring :bold t))))
   `(magit-section-highlight ((t (:background ,bg-highlight))))
   `(magit-section-secondary-heading ((t (:foreground ,blue-slate :bold t))))

   `(magit-branch-local ((t (:foreground ,green-spring :bold t))))
   `(magit-branch-remote ((t (:foreground ,blue-light :bold t))))
   `(magit-branch-remote-head ((t (:foreground ,blue-slate :bold t :box t))))
   `(magit-branch-current ((t (:foreground ,green-neon :bold t :box t))))
   `(magit-branch-upstream ((t (:foreground ,cyan-info))))

   `(magit-tag ((t (:foreground ,orange-warning :bold t))))
   `(magit-hash ((t (:foreground ,green-forest))))
   `(magit-head ((t (:foreground ,green-spring :bold t))))

   `(magit-log-author ((t (:foreground ,green-bright))))
   `(magit-log-date ((t (:foreground ,green-forest))))
   `(magit-log-graph ((t (:foreground ,blue-slate))))

   `(magit-diff-file-heading ((t (:foreground ,green-bright :bold t))))
   `(magit-diff-file-heading-highlight ((t (:background ,bg-highlight))))
   `(magit-diff-file-heading-selection ((t (:foreground ,green-spring))))
   `(magit-diff-hunk-heading ((t (:foreground ,blue-slate :background ,bg-dark))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,blue-light :background ,bg-highlight))))
   `(magit-diff-hunk-heading-selection ((t (:foreground ,green-spring :background ,bg-highlight))))
   `(magit-diff-context ((t (:foreground ,gray-light))))
   `(magit-diff-context-highlight ((t (:foreground ,gray-light :background ,bg-dark))))
   `(magit-diff-added ((t (:foreground ,green-spring :background "#002200"))))
   `(magit-diff-added-highlight ((t (:foreground ,green-neon :background "#003300"))))
   `(magit-diff-removed ((t (:foreground ,red-error :background "#220000"))))
   `(magit-diff-removed-highlight ((t (:foreground ,red-error :background "#330000"))))
   `(magit-diff-lines-heading ((t (:foreground ,bg-void :background ,green-bright))))

   `(magit-diffstat-added ((t (:foreground ,green-spring))))
   `(magit-diffstat-removed ((t (:foreground ,red-error))))

   `(magit-dimmed ((t (:foreground ,gray-light))))
   `(magit-filename ((t (:foreground ,green-pale))))

   `(magit-blame-heading ((t (:foreground ,green-forest :background ,bg-dark))))
   `(magit-blame-hash ((t (:foreground ,green-dark))))
   `(magit-blame-name ((t (:foreground ,green-bright))))
   `(magit-blame-date ((t (:foreground ,green-forest))))

   `(magit-reflog-commit ((t (:foreground ,green-spring))))
   `(magit-reflog-amend ((t (:foreground ,orange-warning))))
   `(magit-reflog-merge ((t (:foreground ,green-bright))))
   `(magit-reflog-checkout ((t (:foreground ,blue-light))))
   `(magit-reflog-reset ((t (:foreground ,red-error))))
   `(magit-reflog-rebase ((t (:foreground ,purple-orchid))))
   `(magit-reflog-cherry-pick ((t (:foreground ,green-spring))))
   `(magit-reflog-remote ((t (:foreground ,cyan-info))))
   `(magit-reflog-other ((t (:foreground ,blue-slate))))

   `(magit-bisect-good ((t (:foreground ,green-spring))))
   `(magit-bisect-skip ((t (:foreground ,orange-warning))))
   `(magit-bisect-bad ((t (:foreground ,red-error))))

   `(magit-cherry-equivalent ((t (:foreground ,purple-orchid))))
   `(magit-cherry-unmatched ((t (:foreground ,cyan-info))))

   `(magit-process-ok ((t (:foreground ,green-spring :bold t))))
   `(magit-process-ng ((t (:foreground ,red-error :bold t))))

   `(magit-signature-good ((t (:foreground ,green-spring))))
   `(magit-signature-bad ((t (:foreground ,red-error))))
   `(magit-signature-untrusted ((t (:foreground ,orange-warning))))
   `(magit-signature-expired ((t (:foreground ,orange-warning))))
   `(magit-signature-revoked ((t (:foreground ,red-error))))
   `(magit-signature-error ((t (:foreground ,red-error))))

;;;;; Diff

   `(diff-added ((t (:foreground ,green-spring :background "#002200"))))
   `(diff-removed ((t (:foreground ,red-error :background "#220000"))))
   `(diff-changed ((t (:foreground ,orange-warning))))
   `(diff-header ((t (:foreground ,blue-slate :background ,bg-dark))))
   `(diff-file-header ((t (:foreground ,green-bright :background ,bg-dark :bold t))))
   `(diff-hunk-header ((t (:foreground ,blue-light :background ,bg-dark))))
   `(diff-context ((t (:foreground ,gray-light))))
   `(diff-indicator-added ((t (:foreground ,green-neon :bold t))))
   `(diff-indicator-removed ((t (:foreground ,red-error :bold t))))
   `(diff-indicator-changed ((t (:foreground ,orange-warning :bold t))))
   `(diff-refine-added ((t (:foreground ,green-neon :background "#003300" :bold t))))
   `(diff-refine-removed ((t (:foreground ,red-error :background "#330000" :bold t))))
   `(diff-refine-changed ((t (:foreground ,orange-warning :background "#332200" :bold t))))

;;;;; Ediff

   `(ediff-current-diff-A ((t (:background "#330000"))))
   `(ediff-current-diff-B ((t (:background "#003300"))))
   `(ediff-current-diff-C ((t (:background "#333300"))))
   `(ediff-fine-diff-A ((t (:background "#440000" :bold t))))
   `(ediff-fine-diff-B ((t (:background "#004400" :bold t))))
   `(ediff-fine-diff-C ((t (:background "#444400" :bold t))))
   `(ediff-odd-diff-A ((t (:background ,bg-dark))))
   `(ediff-odd-diff-B ((t (:background ,bg-dark))))
   `(ediff-odd-diff-C ((t (:background ,bg-dark))))
   `(ediff-even-diff-A ((t (:background ,bg-highlight))))
   `(ediff-even-diff-B ((t (:background ,bg-highlight))))
   `(ediff-even-diff-C ((t (:background ,bg-highlight))))

;;;;; Vertico

   `(vertico-current ((t (:background ,bg-highlight :foreground ,green-neon :bold t))))
   `(vertico-group-title ((t (:foreground ,blue-slate :bold t :underline t))))
   `(vertico-group-separator ((t (:foreground ,green-dark :strike-through t))))
   `(vertico-multiline ((t (:foreground ,green-forest))))

;;;;; Marginalia

   `(marginalia-key ((t (:foreground ,blue-light))))
   `(marginalia-value ((t (:foreground ,green-pale))))
   `(marginalia-documentation ((t (:foreground ,green-forest :italic t))))
   `(marginalia-file-name ((t (:foreground ,green-bright))))
   `(marginalia-file-owner ((t (:foreground ,green-dark))))
   `(marginalia-file-priv-dir ((t (:foreground ,blue-slate))))
   `(marginalia-file-priv-exec ((t (:foreground ,green-spring))))
   `(marginalia-file-priv-link ((t (:foreground ,cyan-info))))
   `(marginalia-file-priv-no ((t (:foreground ,gray-light))))
   `(marginalia-file-priv-other ((t (:foreground ,orange-warning))))
   `(marginalia-file-priv-rare ((t (:foreground ,red-error))))
   `(marginalia-file-priv-read ((t (:foreground ,green-bright))))
   `(marginalia-file-priv-write ((t (:foreground ,orange-warning))))
   `(marginalia-date ((t (:foreground ,green-forest))))
   `(marginalia-mode ((t (:foreground ,blue-slate))))
   `(marginalia-modified ((t (:foreground ,orange-warning))))
   `(marginalia-number ((t (:foreground ,cyan-info))))
   `(marginalia-size ((t (:foreground ,green-forest))))
   `(marginalia-type ((t (:foreground ,blue-light))))
   `(marginalia-installed ((t (:foreground ,green-spring))))
   `(marginalia-archive ((t (:foreground ,purple-orchid))))
   `(marginalia-char ((t (:foreground ,green-neon))))
   `(marginalia-lighter ((t (:foreground ,green-dark))))
   `(marginalia-list ((t (:foreground ,green-pale))))
   `(marginalia-null ((t (:foreground ,gray-light))))
   `(marginalia-off ((t (:foreground ,gray-light))))
   `(marginalia-on ((t (:foreground ,green-spring))))
   `(marginalia-string ((t (:foreground ,blue-light))))
   `(marginalia-symbol ((t (:foreground ,green-bright))))
   `(marginalia-version ((t (:foreground ,green-forest))))

;;;;; Orderless

   `(orderless-match-face-0 ((t (:foreground ,green-neon :bold t))))
   `(orderless-match-face-1 ((t (:foreground ,blue-light :bold t))))
   `(orderless-match-face-2 ((t (:foreground ,green-spring :bold t))))
   `(orderless-match-face-3 ((t (:foreground ,cyan-info :bold t))))

;;;;; Consult

   `(consult-preview-line ((t (:background ,bg-highlight))))
   `(consult-preview-match ((t (:background ,blue-dark :foreground ,white :bold t))))
   `(consult-preview-cursor ((t (:background ,green-bright))))
   `(consult-narrow-indicator ((t (:foreground ,orange-warning))))
   `(consult-async-running ((t (:foreground ,green-spring))))
   `(consult-async-finished ((t (:foreground ,green-bright))))
   `(consult-async-failed ((t (:foreground ,red-error))))
   `(consult-async-split ((t (:foreground ,orange-warning))))
   `(consult-key ((t (:foreground ,blue-light))))
   `(consult-file ((t (:foreground ,green-bright))))
   `(consult-bookmark ((t (:foreground ,blue-slate))))
   `(consult-buffer ((t (:foreground ,green-pale))))
   `(consult-line-number ((t (:foreground ,green-forest))))
   `(consult-line-number-prefix ((t (:foreground ,green-dark))))
   `(consult-grep-context ((t (:foreground ,green-forest))))
   `(consult-highlight-match ((t (:foreground ,green-neon :bold t))))
   `(consult-highlight-mark ((t (:foreground ,orange-warning))))
   `(consult-imenu-prefix ((t (:foreground ,green-dark))))
   `(consult-separator ((t (:foreground ,green-dark))))

;;;;; Corfu (completion popup)

   `(corfu-default ((t (:background ,bg-dark :foreground ,green-bright))))
   `(corfu-current ((t (:background ,bg-highlight :foreground ,green-neon :bold t))))
   `(corfu-bar ((t (:background ,green-dark))))
   `(corfu-border ((t (:background ,green-dark))))
   `(corfu-annotations ((t (:foreground ,green-forest :italic t))))
   `(corfu-deprecated ((t (:foreground ,gray-light :strike-through t))))
   `(corfu-echo ((t (:foreground ,green-pale))))

;;;;; Company

   `(company-tooltip ((t (:background ,bg-dark :foreground ,green-bright))))
   `(company-tooltip-common ((t (:foreground ,green-neon :bold t))))
   `(company-tooltip-common-selection ((t (:foreground ,green-neon :bold t))))
   `(company-tooltip-selection ((t (:background ,bg-highlight :foreground ,green-neon))))
   `(company-tooltip-annotation ((t (:foreground ,green-forest))))
   `(company-tooltip-annotation-selection ((t (:foreground ,green-spring))))
   `(company-tooltip-scrollbar-track ((t (:background ,bg-dark))))
   `(company-tooltip-scrollbar-thumb ((t (:background ,green-dark))))
   `(company-preview ((t (:foreground ,green-forest))))
   `(company-preview-common ((t (:foreground ,green-spring :bold t))))
   `(company-preview-search ((t (:foreground ,blue-light))))
   `(company-scrollbar-bg ((t (:background ,bg-dark))))
   `(company-scrollbar-fg ((t (:background ,green-dark))))
   `(company-echo ((t (:foreground ,green-pale))))
   `(company-echo-common ((t (:foreground ,green-neon))))

;;;;; Flycheck

   `(flycheck-error ((t (:underline (:style wave :color ,red-error)))))
   `(flycheck-warning ((t (:underline (:style wave :color ,orange-warning)))))
   `(flycheck-info ((t (:underline (:style wave :color ,green-spring)))))
   `(flycheck-fringe-error ((t (:foreground ,red-error :bold t))))
   `(flycheck-fringe-warning ((t (:foreground ,orange-warning :bold t))))
   `(flycheck-fringe-info ((t (:foreground ,green-spring :bold t))))
   `(flycheck-error-list-error ((t (:foreground ,red-error))))
   `(flycheck-error-list-warning ((t (:foreground ,orange-warning))))
   `(flycheck-error-list-info ((t (:foreground ,green-spring))))
   `(flycheck-error-list-filename ((t (:foreground ,green-bright))))
   `(flycheck-error-list-id ((t (:foreground ,blue-slate))))
   `(flycheck-error-list-id-with-explainer ((t (:foreground ,blue-light :underline t))))
   `(flycheck-error-list-checker-name ((t (:foreground ,green-forest))))
   `(flycheck-error-list-highlight ((t (:background ,bg-highlight))))
   `(flycheck-verify-select-checker ((t (:foreground ,blue-light :underline t))))

;;;;; Flymake

   `(flymake-error ((t (:underline (:style wave :color ,red-error)))))
   `(flymake-warning ((t (:underline (:style wave :color ,orange-warning)))))
   `(flymake-note ((t (:underline (:style wave :color ,green-spring)))))

;;;;; Dired

   `(dired-header ((t (:foreground ,green-neon :bold t))))
   `(dired-directory ((t (:foreground ,blue-slate :bold t))))
   `(dired-symlink ((t (:foreground ,cyan-info))))
   `(dired-broken-symlink ((t (:foreground ,red-error :strike-through t))))
   `(dired-special ((t (:foreground ,purple-orchid))))
   `(dired-perm-write ((t (:foreground ,orange-warning))))
   `(dired-ignored ((t (:foreground ,gray-light))))
   `(dired-flagged ((t (:foreground ,red-error :bold t))))
   `(dired-marked ((t (:foreground ,green-spring :bold t))))
   `(dired-mark ((t (:foreground ,green-neon :bold t))))
   `(dired-warning ((t (:foreground ,orange-warning))))
   `(dired-set-id ((t (:foreground ,orange-warning))))

;;;;; Diredfl (enhanced dired faces)

   `(diredfl-dir-name ((t (:foreground ,blue-slate :bold t))))
   `(diredfl-dir-heading ((t (:foreground ,green-neon :bold t))))
   `(diredfl-file-name ((t (:foreground ,green-bright))))
   `(diredfl-file-suffix ((t (:foreground ,green-forest))))
   `(diredfl-symlink ((t (:foreground ,cyan-info))))
   `(diredfl-compressed-file-name ((t (:foreground ,purple-orchid))))
   `(diredfl-compressed-file-suffix ((t (:foreground ,purple-orchid))))
   `(diredfl-ignored-file-name ((t (:foreground ,gray-light))))
   `(diredfl-deletion ((t (:foreground ,red-error :bold t))))
   `(diredfl-deletion-file-name ((t (:foreground ,red-error))))
   `(diredfl-flag-mark ((t (:foreground ,green-spring :bold t))))
   `(diredfl-flag-mark-line ((t (:background ,bg-highlight))))
   `(diredfl-date-time ((t (:foreground ,green-forest))))
   `(diredfl-number ((t (:foreground ,cyan-info))))
   `(diredfl-no-priv ((t (:foreground ,gray-light))))
   `(diredfl-dir-priv ((t (:foreground ,blue-slate))))
   `(diredfl-read-priv ((t (:foreground ,green-bright))))
   `(diredfl-write-priv ((t (:foreground ,orange-warning))))
   `(diredfl-exec-priv ((t (:foreground ,green-spring))))
   `(diredfl-link-priv ((t (:foreground ,cyan-info))))
   `(diredfl-rare-priv ((t (:foreground ,red-error))))
   `(diredfl-other-priv ((t (:foreground ,orange-warning))))

;;;;; Treemacs

   `(treemacs-root-face ((t (:foreground ,green-neon :bold t :height 1.2))))
   `(treemacs-directory-face ((t (:foreground ,blue-slate))))
   `(treemacs-directory-collapsed-face ((t (:foreground ,blue-slate))))
   `(treemacs-file-face ((t (:foreground ,green-bright))))
   `(treemacs-git-added-face ((t (:foreground ,green-spring))))
   `(treemacs-git-modified-face ((t (:foreground ,orange-warning))))
   `(treemacs-git-untracked-face ((t (:foreground ,gray-light))))
   `(treemacs-git-ignored-face ((t (:foreground ,gray-light))))
   `(treemacs-git-conflict-face ((t (:foreground ,red-error :bold t))))
   `(treemacs-git-renamed-face ((t (:foreground ,cyan-info))))
   `(treemacs-tags-face ((t (:foreground ,green-forest))))
   `(treemacs-help-column-face ((t (:foreground ,green-forest))))
   `(treemacs-help-title-face ((t (:foreground ,green-neon :bold t))))
   `(treemacs-on-success-pulse-face ((t (:background ,green-dark))))
   `(treemacs-on-failure-pulse-face ((t (:background "#330000"))))
   `(treemacs-fringe-indicator-face ((t (:foreground ,green-bright))))

;;;;; Which-key

   `(which-key-key-face ((t (:foreground ,green-neon :bold t))))
   `(which-key-separator-face ((t (:foreground ,green-forest))))
   `(which-key-note-face ((t (:foreground ,green-dark))))
   `(which-key-command-description-face ((t (:foreground ,green-bright))))
   `(which-key-local-map-description-face ((t (:foreground ,blue-light))))
   `(which-key-group-description-face ((t (:foreground ,blue-slate :bold t))))
   `(which-key-special-key-face ((t (:foreground ,orange-warning :bold t))))
   `(which-key-docstring-face ((t (:foreground ,green-forest :italic t))))
   `(which-key-highlighted-command-face ((t (:foreground ,green-spring :underline t))))

;;;;; Markdown

   `(markdown-header-face ((t (:foreground ,green-neon :bold t))))
   `(markdown-header-face-1 ((t (:foreground ,green-neon :bold t :height 1.4))))
   `(markdown-header-face-2 ((t (:foreground ,blue-slate :bold t :height 1.3))))
   `(markdown-header-face-3 ((t (:foreground ,green-spring :bold t :height 1.2))))
   `(markdown-header-face-4 ((t (:foreground ,blue-light :bold t :height 1.1))))
   `(markdown-header-face-5 ((t (:foreground ,green-bright :bold t))))
   `(markdown-header-face-6 ((t (:foreground ,green-forest :bold t))))
   `(markdown-header-delimiter-face ((t (:foreground ,green-dark))))
   `(markdown-header-rule-face ((t (:foreground ,green-dark))))
   `(markdown-bold-face ((t (:foreground ,green-spring :bold t))))
   `(markdown-italic-face ((t (:foreground ,green-pale :italic t))))
   `(markdown-link-face ((t (:foreground ,blue-light))))
   `(markdown-url-face ((t (:foreground ,blue-dark :underline t))))
   `(markdown-link-title-face ((t (:foreground ,green-bright))))
   `(markdown-code-face ((t (:foreground ,green-spring :background ,bg-dark))))
   `(markdown-inline-code-face ((t (:foreground ,green-spring :background ,bg-dark))))
   `(markdown-pre-face ((t (:foreground ,green-spring :background ,bg-dark))))
   `(markdown-language-keyword-face ((t (:foreground ,blue-slate))))
   `(markdown-language-info-face ((t (:foreground ,green-forest))))
   `(markdown-blockquote-face ((t (:foreground ,green-forest :italic t))))
   `(markdown-list-face ((t (:foreground ,green-bright))))
   `(markdown-markup-face ((t (:foreground ,green-dark))))
   `(markdown-metadata-key-face ((t (:foreground ,blue-slate))))
   `(markdown-metadata-value-face ((t (:foreground ,green-pale))))
   `(markdown-footnote-marker-face ((t (:foreground ,cyan-info))))
   `(markdown-footnote-text-face ((t (:foreground ,green-pale))))
   `(markdown-gfm-checkbox-face ((t (:foreground ,green-bright))))
   `(markdown-highlight-face ((t (:background ,bg-highlight))))
   `(markdown-hr-face ((t (:foreground ,green-dark))))
   `(markdown-html-attr-name-face ((t (:foreground ,blue-slate))))
   `(markdown-html-attr-value-face ((t (:foreground ,green-spring))))
   `(markdown-html-entity-face ((t (:foreground ,cyan-info))))
   `(markdown-html-tag-delimiter-face ((t (:foreground ,green-forest))))
   `(markdown-html-tag-name-face ((t (:foreground ,blue-light))))
   `(markdown-line-break-face ((t (:underline t))))
   `(markdown-math-face ((t (:foreground ,cyan-info))))
   `(markdown-missing-link-face ((t (:foreground ,red-error :bold t))))
   `(markdown-plain-url-face ((t (:foreground ,blue-light :underline t))))
   `(markdown-reference-face ((t (:foreground ,blue-slate))))
   `(markdown-strike-through-face ((t (:foreground ,gray-light :strike-through t))))
   `(markdown-table-face ((t (:foreground ,green-bright))))

;;;;; Xref

   `(xref-file-header ((t (:foreground ,green-neon :bold t))))
   `(xref-line-number ((t (:foreground ,green-forest))))
   `(xref-match ((t (:foreground ,green-spring :bold t))))

;;;;; Compilation

   `(compilation-error ((t (:foreground ,red-error :bold t))))
   `(compilation-warning ((t (:foreground ,orange-warning :bold t))))
   `(compilation-info ((t (:foreground ,green-spring))))
   `(compilation-mode-line-exit ((t (:foreground ,green-spring :bold t))))
   `(compilation-mode-line-fail ((t (:foreground ,red-error :bold t))))
   `(compilation-mode-line-run ((t (:foreground ,orange-warning))))
   `(compilation-line-number ((t (:foreground ,green-forest))))
   `(compilation-column-number ((t (:foreground ,green-dark))))

;;;;; Info

   `(info-title-1 ((t (:foreground ,green-neon :bold t :height 1.4))))
   `(info-title-2 ((t (:foreground ,blue-slate :bold t :height 1.3))))
   `(info-title-3 ((t (:foreground ,green-spring :bold t :height 1.2))))
   `(info-title-4 ((t (:foreground ,blue-light :bold t :height 1.1))))
   `(info-header-node ((t (:foreground ,green-bright :bold t))))
   `(info-header-xref ((t (:foreground ,blue-light :underline t))))
   `(info-menu-header ((t (:foreground ,green-bright :bold t))))
   `(info-menu-star ((t (:foreground ,green-neon))))
   `(info-node ((t (:foreground ,green-neon :bold t))))
   `(info-xref ((t (:foreground ,blue-light :underline t))))
   `(info-xref-visited ((t (:foreground ,blue-dark :underline t))))

;;;;; Elfeed

   `(elfeed-search-date-face ((t (:foreground ,green-forest))))
   `(elfeed-search-feed-face ((t (:foreground ,blue-slate))))
   `(elfeed-search-filter-face ((t (:foreground ,green-spring))))
   `(elfeed-search-last-update-face ((t (:foreground ,green-dark))))
   `(elfeed-search-tag-face ((t (:foreground ,green-bright))))
   `(elfeed-search-title-face ((t (:foreground ,green-pale))))
   `(elfeed-search-unread-count-face ((t (:foreground ,orange-warning))))
   `(elfeed-search-unread-title-face ((t (:foreground ,green-neon :bold t))))
   `(elfeed-log-debug-level-face ((t (:foreground ,gray-light))))
   `(elfeed-log-error-level-face ((t (:foreground ,red-error))))
   `(elfeed-log-info-level-face ((t (:foreground ,green-spring))))
   `(elfeed-log-warn-level-face ((t (:foreground ,orange-warning))))

;;;;; ERC (IRC)

   `(erc-action-face ((t (:foreground ,blue-slate))))
   `(erc-bold-face ((t (:bold t))))
   `(erc-current-nick-face ((t (:foreground ,green-neon :bold t))))
   `(erc-dangerous-host-face ((t (:foreground ,red-error))))
   `(erc-default-face ((t (:foreground ,green-bright))))
   `(erc-direct-msg-face ((t (:foreground ,orange-warning))))
   `(erc-error-face ((t (:foreground ,red-error))))
   `(erc-fool-face ((t (:foreground ,gray-light))))
   `(erc-header-line ((t (:foreground ,green-bright :background ,bg-dark))))
   `(erc-input-face ((t (:foreground ,green-spring))))
   `(erc-keyword-face ((t (:foreground ,orange-warning :bold t))))
   `(erc-my-nick-face ((t (:foreground ,green-spring :bold t))))
   `(erc-nick-default-face ((t (:foreground ,blue-light))))
   `(erc-nick-msg-face ((t (:foreground ,cyan-info))))
   `(erc-notice-face ((t (:foreground ,green-forest))))
   `(erc-pal-face ((t (:foreground ,green-spring))))
   `(erc-prompt-face ((t (:foreground ,green-neon :bold t))))
   `(erc-timestamp-face ((t (:foreground ,green-dark))))
   `(erc-underline-face ((t (:underline t))))

;;;;; Term/Ansi-term/Vterm

   `(term ((t (:foreground ,green-bright :background ,bg-void))))
   `(term-color-black ((t (:foreground ,bg-void :background ,bg-highlight))))
   `(term-color-red ((t (:foreground ,red-error :background ,red-error))))
   `(term-color-green ((t (:foreground ,green-spring :background ,green-spring))))
   `(term-color-yellow ((t (:foreground ,yellow-info :background ,yellow-info))))
   `(term-color-blue ((t (:foreground ,blue-slate :background ,blue-slate))))
   `(term-color-magenta ((t (:foreground ,purple-orchid :background ,purple-orchid))))
   `(term-color-cyan ((t (:foreground ,cyan-info :background ,cyan-info))))
   `(term-color-white ((t (:foreground ,white :background ,white))))

   `(vterm-color-black ((t (:foreground ,bg-void :background ,bg-highlight))))
   `(vterm-color-red ((t (:foreground ,red-error :background ,red-error))))
   `(vterm-color-green ((t (:foreground ,green-spring :background ,green-spring))))
   `(vterm-color-yellow ((t (:foreground ,yellow-info :background ,yellow-info))))
   `(vterm-color-blue ((t (:foreground ,blue-slate :background ,blue-slate))))
   `(vterm-color-magenta ((t (:foreground ,purple-orchid :background ,purple-orchid))))
   `(vterm-color-cyan ((t (:foreground ,cyan-info :background ,cyan-info))))
   `(vterm-color-white ((t (:foreground ,white :background ,white))))

;;;;; LSP Mode

   `(lsp-face-highlight-read ((t (:background ,bg-highlight :underline t))))
   `(lsp-face-highlight-write ((t (:background ,bg-highlight :underline t :bold t))))
   `(lsp-face-highlight-textual ((t (:background ,bg-highlight))))
   `(lsp-face-semhl-comment ((t (:foreground ,green-spring))))
   `(lsp-face-semhl-constant ((t (:foreground ,cyan-info))))
   `(lsp-face-semhl-deprecated ((t (:strike-through t))))
   `(lsp-face-semhl-enum ((t (:foreground ,blue-slate))))
   `(lsp-face-semhl-function ((t (:foreground ,green-bright))))
   `(lsp-face-semhl-keyword ((t (:foreground ,green-medium :bold t))))
   `(lsp-face-semhl-macro ((t (:foreground ,purple-orchid))))
   `(lsp-face-semhl-method ((t (:foreground ,green-bright))))
   `(lsp-face-semhl-namespace ((t (:foreground ,blue-light))))
   `(lsp-face-semhl-number ((t (:foreground ,cyan-info))))
   `(lsp-face-semhl-operator ((t (:foreground ,green-medium))))
   `(lsp-face-semhl-parameter ((t (:foreground ,green-pale :italic t))))
   `(lsp-face-semhl-property ((t (:foreground ,green-pale))))
   `(lsp-face-semhl-regexp ((t (:foreground ,orange-warning))))
   `(lsp-face-semhl-static ((t (:foreground ,cyan-info :italic t))))
   `(lsp-face-semhl-string ((t (:foreground ,blue-light))))
   `(lsp-face-semhl-struct ((t (:foreground ,blue-slate))))
   `(lsp-face-semhl-type ((t (:foreground ,blue-slate))))
   `(lsp-face-semhl-type-parameter ((t (:foreground ,blue-light :italic t))))
   `(lsp-face-semhl-variable ((t (:foreground ,green-pale))))

   `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,green-forest))))
   `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,red-error :underline t))))
   `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground ,orange-warning :underline t))))
   `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,green-spring :underline t))))
   `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,green-forest))))
   `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground ,blue-slate :bold t))))
   `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,green-dark))))
   `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,green-bright))))
   `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground ,red-error))))
   `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground ,orange-warning))))
   `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground ,green-spring))))
   `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground ,green-forest))))
   `(lsp-headerline-breadcrumb-unknown-project-prefix-face ((t (:foreground ,gray-light))))

;;;;; LSP UI

   `(lsp-ui-doc-background ((t (:background ,bg-dark))))
   `(lsp-ui-doc-header ((t (:foreground ,green-neon :background ,bg-highlight :bold t))))
   `(lsp-ui-doc-highlight-hover ((t (:background ,bg-highlight))))
   `(lsp-ui-doc-url ((t (:foreground ,blue-light :underline t))))
   `(lsp-ui-peek-filename ((t (:foreground ,green-bright))))
   `(lsp-ui-peek-header ((t (:foreground ,green-neon :background ,bg-dark :bold t))))
   `(lsp-ui-peek-footer ((t (:foreground ,green-forest :background ,bg-dark))))
   `(lsp-ui-peek-highlight ((t (:foreground ,green-neon :background ,bg-highlight))))
   `(lsp-ui-peek-line-number ((t (:foreground ,green-forest))))
   `(lsp-ui-peek-list ((t (:background ,bg-dark))))
   `(lsp-ui-peek-peek ((t (:background ,bg-dark))))
   `(lsp-ui-peek-selection ((t (:foreground ,green-neon :background ,bg-highlight))))
   `(lsp-ui-sideline-code-action ((t (:foreground ,orange-warning))))
   `(lsp-ui-sideline-current-symbol ((t (:foreground ,green-spring :bold t))))
   `(lsp-ui-sideline-symbol ((t (:foreground ,green-forest))))
   `(lsp-ui-sideline-symbol-info ((t (:foreground ,green-forest :italic t))))

;;;;; Eshell

   `(eshell-prompt ((t (:foreground ,green-neon :bold t))))
   `(eshell-ls-archive ((t (:foreground ,purple-orchid))))
   `(eshell-ls-backup ((t (:foreground ,gray-light))))
   `(eshell-ls-clutter ((t (:foreground ,gray-light))))
   `(eshell-ls-directory ((t (:foreground ,blue-slate :bold t))))
   `(eshell-ls-executable ((t (:foreground ,green-spring))))
   `(eshell-ls-missing ((t (:foreground ,red-error))))
   `(eshell-ls-product ((t (:foreground ,green-pale))))
   `(eshell-ls-readonly ((t (:foreground ,cyan-info))))
   `(eshell-ls-special ((t (:foreground ,purple-orchid))))
   `(eshell-ls-symlink ((t (:foreground ,cyan-info))))
   `(eshell-ls-unreadable ((t (:foreground ,gray-light))))

;;;;; Ivy/Swiper/Counsel

   `(ivy-current-match ((t (:background ,bg-highlight :foreground ,green-neon :bold t))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,green-spring))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,green-neon :bold t))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,blue-light))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground ,cyan-info))))
   `(ivy-confirm-face ((t (:foreground ,green-spring))))
   `(ivy-match-required-face ((t (:foreground ,red-error))))
   `(ivy-remote ((t (:foreground ,blue-light))))
   `(ivy-virtual ((t (:foreground ,gray-light))))
   `(ivy-action ((t (:foreground ,blue-slate))))
   `(ivy-subdir ((t (:foreground ,blue-slate :bold t))))
   `(ivy-modified-buffer ((t (:foreground ,orange-warning))))
   `(ivy-modified-outside-buffer ((t (:foreground ,red-error))))
   `(ivy-grep-info ((t (:foreground ,green-forest))))
   `(ivy-grep-line-number ((t (:foreground ,green-dark))))
   `(ivy-highlight-face ((t (:foreground ,green-spring))))
   `(ivy-prompt-match ((t (:foreground ,green-neon :bold t))))
   `(ivy-separator ((t (:foreground ,green-dark))))

   `(swiper-line-face ((t (:background ,bg-highlight))))
   `(swiper-match-face-1 ((t (:foreground ,green-spring))))
   `(swiper-match-face-2 ((t (:foreground ,green-neon :bold t))))
   `(swiper-match-face-3 ((t (:foreground ,blue-light))))
   `(swiper-match-face-4 ((t (:foreground ,cyan-info))))
   `(swiper-background-match-face-1 ((t (:background ,bg-highlight))))
   `(swiper-background-match-face-2 ((t (:background ,bg-highlight))))
   `(swiper-background-match-face-3 ((t (:background ,bg-highlight))))
   `(swiper-background-match-face-4 ((t (:background ,bg-highlight))))

;;;;; Hydra

   `(hydra-face-red ((t (:foreground ,red-error :bold t))))
   `(hydra-face-blue ((t (:foreground ,blue-slate :bold t))))
   `(hydra-face-amaranth ((t (:foreground ,purple-orchid :bold t))))
   `(hydra-face-pink ((t (:foreground ,purple-orchid :bold t))))
   `(hydra-face-teal ((t (:foreground ,cyan-info :bold t))))

;;;;; Avy

   `(avy-lead-face ((t (:foreground ,bg-void :background ,green-neon :bold t))))
   `(avy-lead-face-0 ((t (:foreground ,bg-void :background ,blue-slate :bold t))))
   `(avy-lead-face-1 ((t (:foreground ,bg-void :background ,green-spring :bold t))))
   `(avy-lead-face-2 ((t (:foreground ,bg-void :background ,cyan-info :bold t))))
   `(avy-background-face ((t (:foreground ,gray-light))))
   `(avy-goto-char-timer-face ((t (:foreground ,bg-void :background ,orange-warning))))

;;;;; Ace-window

   `(aw-leading-char-face ((t (:foreground ,bg-void :background ,green-neon :bold t :height 2.0))))
   `(aw-background-face ((t (:foreground ,gray-light))))
   `(aw-mode-line-face ((t (:foreground ,green-neon :bold t))))
   `(aw-key-face ((t (:foreground ,green-neon :bold t))))
   `(aw-minibuffer-leading-char-face ((t (:foreground ,green-neon :bold t))))

;;;;; Rainbow delimiters

   ;; 4-color rotation: green → blue → cyan → purple (repeat with variants)
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,green-neon))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue-slate))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,cyan-info))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,purple-orchid))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,green-spring))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,blue-light))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,cyan-info))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,purple-orchid))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,orange-warning))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,red-error :bold t :underline t))))
   `(rainbow-delimiters-mismatched-face ((t (:foreground ,red-error :bold t :underline t))))
   `(rainbow-delimiters-base-error-face ((t (:foreground ,red-error :bold t))))

;;;;; Git-gutter

   `(git-gutter:added ((t (:foreground ,green-spring :bold t))))
   `(git-gutter:deleted ((t (:foreground ,red-error :bold t))))
   `(git-gutter:modified ((t (:foreground ,orange-warning :bold t))))
   `(git-gutter:unchanged ((t (:foreground ,gray-light))))
   `(git-gutter:separator ((t (:foreground ,green-dark))))

;;;;; Diff-hl

   `(diff-hl-insert ((t (:foreground ,green-spring :background "#003300"))))
   `(diff-hl-delete ((t (:foreground ,red-error :background "#330000"))))
   `(diff-hl-change ((t (:foreground ,orange-warning :background "#332200"))))

;;;;; Highlight-indent-guides

   `(highlight-indent-guides-odd-face ((t (:background ,bg-dark))))
   `(highlight-indent-guides-even-face ((t (:background ,bg-highlight))))
   `(highlight-indent-guides-character-face ((t (:foreground ,green-dark))))
   `(highlight-indent-guides-stack-odd-face ((t (:background ,bg-dark))))
   `(highlight-indent-guides-stack-even-face ((t (:background ,bg-highlight))))
   `(highlight-indent-guides-stack-character-face ((t (:foreground ,green-forest))))
   `(highlight-indent-guides-top-odd-face ((t (:background ,bg-dark))))
   `(highlight-indent-guides-top-even-face ((t (:background ,bg-highlight))))
   `(highlight-indent-guides-top-character-face ((t (:foreground ,green-bright))))

;;;;; Yasnippet

   `(yas-field-highlight-face ((t (:background ,bg-highlight))))

;;;;; eval-sexp-fu

   `(eval-sexp-fu-flash ((t (:foreground "#e0b0ff" :background "#2a0040" :bold t))))
   `(eval-sexp-fu-flash-error ((t (:foreground ,red-error :background ,bg-highlight :bold t))))

;;;;; CIDER

   ;; Result overlays
   `(cider-result-overlay-face ((t (:foreground ,green-spring :background ,bg-dark :box (:line-width 1 :color ,green-dark)))))
   `(cider-error-overlay-face ((t (:foreground ,red-error :background ,bg-dark :box (:line-width 1 :color ,red-error)))))
   `(cider-fragile-button-face ((t (:foreground ,orange-warning :box (:line-width 1 :color ,orange-warning)))))
   `(cider-fringe-good-face ((t (:foreground ,green-spring))))

   ;; REPL
   `(cider-repl-prompt-face ((t (:foreground ,green-neon :bold t))))
   `(cider-repl-input-face ((t (:foreground ,green-bright))))
   `(cider-repl-result-face ((t (:foreground ,green-spring))))
   `(cider-repl-stdout-face ((t (:foreground ,green-pale))))
   `(cider-repl-stderr-face ((t (:foreground ,red-error))))

   ;; Test results
   `(cider-test-success-face ((t (:foreground ,green-spring :bold t))))
   `(cider-test-failure-face ((t (:foreground ,red-error :bold t))))
   `(cider-test-error-face ((t (:foreground ,orange-warning :bold t))))

   ;; Debug
   `(cider-debug-code-overlay-face ((t (:background ,bg-highlight :foreground ,green-neon))))
   `(cider-debug-prompt-face ((t (:foreground ,orange-warning :bold t))))
   `(cider-enlightened-face ((t (:foreground ,green-spring :background ,bg-highlight :bold t))))
   `(cider-enlightened-local-face ((t (:foreground ,cyan-info :background ,bg-highlight))))

   ;; Code annotations
   `(cider-deprecated-face ((t (:foreground ,gray-light :strike-through t))))
   `(cider-instrumented-face ((t (:foreground ,orange-warning :background ,bg-dark :box (:line-width 1 :color ,orange-warning)))))
   `(cider-traced-face ((t (:foreground ,cyan-info :background ,bg-dark :box (:line-width 1 :color ,cyan-info)))))
   `(cider-reader-conditional-face ((t (:foreground ,gray-light))))

   ;; Eval highlights
   `(cider-error-highlight-face ((t (:underline (:style wave :color ,red-error)))))
   `(cider-warning-highlight-face ((t (:underline (:style wave :color ,orange-warning)))))

   ;; Stacktrace
   `(cider-stacktrace-face ((t (:foreground ,green-bright))))
   `(cider-stacktrace-error-class-face ((t (:foreground ,red-error :bold t))))
   `(cider-stacktrace-error-message-face ((t (:foreground ,orange-warning))))
   `(cider-stacktrace-fn-face ((t (:foreground ,green-neon))))
   `(cider-stacktrace-ns-face ((t (:foreground ,blue-slate))))
   `(cider-stacktrace-filter-active-face ((t (:foreground ,green-spring :underline t))))
   `(cider-stacktrace-filter-inactive-face ((t (:foreground ,gray-light))))
   `(cider-stacktrace-promoted-button-face ((t (:foreground ,green-bright :box (:line-width 1 :color ,green-dark)))))
   `(cider-stacktrace-suppressed-button-face ((t (:foreground ,gray-light :box (:line-width 1 :color ,gray-dark)))))

   ;; Documentation viewer
   `(cider-docview-emphasis-face ((t (:foreground ,green-spring :italic t))))
   `(cider-docview-literal-face ((t (:foreground ,green-bright :background ,bg-dark))))
   `(cider-docview-strong-face ((t (:foreground ,green-neon :bold t))))
   `(cider-docview-table-border-face ((t (:foreground ,green-dark))))

   ;; Namespace browser
   `(cider-browse-ns-extra-info-face ((t (:foreground ,green-forest :italic t))))

;;;;; Smartparens

   `(sp-pair-overlay-face ((t (:background ,bg-highlight))))
   `(sp-wrap-overlay-face ((t (:background ,green-dark))))
   `(sp-wrap-tag-overlay-face ((t (:background ,bg-highlight))))

;;;;; git-commit

   `(git-commit-summary ((t (:foreground ,green-bright))))
   `(git-commit-comment-heading ((t (:foreground ,green-neon :bold t))))
   `(git-commit-comment-branch-local ((t (:foreground ,green-spring :bold t))))
   `(git-commit-comment-branch-remote ((t (:foreground ,blue-light :bold t))))
   `(git-commit-comment-action ((t (:foreground ,blue-slate :bold t))))
   `(git-commit-comment-file ((t (:foreground ,green-pale))))
   `(git-commit-nonempty-second-line ((t (:foreground ,orange-warning))))

;;;;; hl-sexp

   `(hl-sexp-face ((t (:background ,bg-highlight))))

;;;;; volatile-highlights

   `(vhl/default-face ((t (:background ,bg-highlight))))

;;;;; Apropos

   `(apropos-symbol ((t (:foreground ,green-neon :bold t))))
   `(apropos-function-button ((t (:foreground ,blue-light :underline t))))
   `(apropos-variable-button ((t (:foreground ,green-pale :underline t))))
   `(apropos-misc-button ((t (:foreground ,blue-slate :underline t))))
   `(apropos-user-option-button ((t (:foreground ,green-spring :underline t))))
   `(apropos-plist ((t (:foreground ,green-forest :italic t))))
   `(apropos-property ((t (:foreground ,cyan-info))))
   `(apropos-keybinding ((t (:foreground ,blue-light :bold t))))

;;;;; Backward compatibility aliases

   `(custom-button-face ((t (:bold t :foreground ,green-bright))))
   `(custom-button-pressed-face ((t (:foreground ,green-dark))))
   `(tabbar-button-face ((t (:foreground ,green-bright :box (:line-width 2 :color ,white :style released-button)))))
   `(tabbar-default-face ((t (:foreground ,green-bright))))
   `(tabbar-selected-face ((t (:foreground ,green-spring :box (:line-width 2 :color ,white :style released-button)))))
   `(tabbar-separator-face ((t (:foreground ,green-bright :box (:line-width 2 :color ,white :style pressed-button)))))
   `(tabbar-unselected-face ((t (:foreground ,blue-light))))

   )) ;; End of let* and custom-theme-set-faces

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'bit-mage)

;;; bit-mage-theme.el ends here
