# (Bit-Mage)

[![CI](https://github.com/rajp152k/bit-mage-theme.el/actions/workflows/test.yml/badge.svg)](https://github.com/rajp152k/bit-mage-theme.el/actions/workflows/test.yml)

## **Cyber Medieval Sourceror's Cave**

A dark cyberpunk Emacs theme with neon green and slateblue accents, plus a Doom live-coding module inspired by emacs-live.

## Philosophy

**"Cyber Medieval Sourceror's Cave"**

Bit-Mage draws inspiration from:
- The neon-green Matrix aesthetic of terminal hacking
- Medieval grimoires and arcane study chambers
- Live coding environments like Emacs Live and Overtone
- The focused concentration of late-night coding sessions

### Design Principles

1. **Low-light optimized**: Deep blacks and muted backgrounds reduce eye strain
2. **Semantic color hierarchy**: Greens for code, blues for structure, purples for accents
3. **Live-coding focused**: Clear visual feedback for evaluation and debugging
4. **Keyboard-centric**: No UI chrome, maximum code visibility

## Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Background | void | gray1 | Main editing area |
| Foreground | neon green | #00FF00 | Primary text |
| Accent 1 | slateblue | slateblue | Structure, types |
| Accent 2 | spring green | spring green | Success, strings |
| Warning | orange | #ffaf00 | Warnings, modified |
| Error | red | #ff5f5f | Errors, failures |

> See the full palette (~30 color variables) in [`bit-mage-theme.el`](bit-mage-theme.el#L32-L78).

## Screenshots

### GUI

![](bit-mage.png)

### CLI (-nw)

![](bit-mage-nw.png)

### Cool Retro Term

![](bit-mage-crt.png)

## Installation

### Doom Emacs (recommended)

Add to `packages.el`:

```elisp
(package! bit-mage-theme.el
  :recipe (:host github :repo "rajp152k/bit-mage-theme.el"))
```

Add to `config.el`:

```elisp
(add-to-list 'custom-theme-load-path
             (file-name-as-directory
              (expand-file-name "bit-mage-theme.el"
                                (file-name-directory (straight--repos-dir "bit-mage-theme.el")))))

(setq doom-theme 'bit-mage)
(load-theme 'bit-mage t)
```

Then run `doom sync` and restart Emacs.

### Vanilla Emacs

Clone and add to your load path:

```sh
git clone https://github.com/rajp152k/bit-mage-theme.el.git ~/.emacs.d/themes/bit-mage
```

```elisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/bit-mage")
(load-theme 'bit-mage t)
```

## Live-Coding Module (Doom Emacs)

A Doom module inspired by [emacs-live](https://github.com/overtone/emacs-live) that adds visual feedback for live coding. Included in this repo under `modules/private/live-coding/`.

### Setup

1. Symlink the module into your Doom config:

```sh
mkdir -p ~/.config/doom/modules/private
ln -s /path/to/bit-mage-theme.el/modules/private/live-coding \
      ~/.config/doom/modules/private/live-coding
```

2. Add to your `init.el` (inside the `doom!` block):

```elisp
:private
(live-coding +flash +pulse +prettify +aggressive)
```

3. Run `doom sync` and restart.

### Flags

| Flag | Feature | Description |
|------|---------|-------------|
| `+flash` | eval-sexp-fu | Static overlay flash on evaluated s-expressions (0.4s) with CIDER integration |
| `+pulse` | pulse.el | Animated color-fade on eval — green tint fades back to background over ~0.4s |
| `+prettify` | prettify-symbols | Displays `fn` and `lambda` as `λ` in Lisp modes |
| `+aggressive` | aggressive-indent | Auto-reindent on every keystroke in Lisp modes |

`+flash` uses the `eval-sexp-fu` package which creates a brief overlay on the evaluated sexp. CIDER commands (`cider-eval-last-sexp`, `cider-eval-defun-at-point`, `cider-pprint-eval-last-sexp`) are automatically hooked.

`+pulse` uses Emacs built-in `pulse.el` for an animated fade effect. On eval, the sexp region flashes with a green tint (`#003300`) that gradually fades back to the background. Errors flash red (`#330000`).

Both `+flash` and `+pulse` can be enabled simultaneously.

## Package Coverage

The theme covers 300+ faces across these packages:

| Category | Packages |
|----------|----------|
| **Core** | Default, font-lock, tree-sitter, mode-line, minibuffer |
| **Clojure** | CIDER (36 faces), eval-sexp-fu, clojure-mode |
| **Completion** | Vertico, Marginalia, Orderless, Consult, Corfu, Company, Ivy |
| **VCS** | Magit (45+ faces), diff, ediff, git-gutter, git-commit |
| **Org** | Org-mode (50+ faces), org-roam |
| **File management** | Dired, Diredfl, Treemacs |
| **Editing** | Smartparens, hl-sexp, volatile-highlights, rainbow-delimiters |
| **Diagnostics** | Flycheck, Flymake, LSP Mode/UI |
| **UI** | Doom dashboard/modeline, which-key, hydra, avy, tab-bar |
| **Help** | Apropos, Info, helpful |
| **Other** | Elfeed, Eshell, ERC, LaTeX, Markdown, term |

## Customization

### Adjusting Colors

The theme uses `let*` binding for all colors. Fork and modify:

```elisp
(let* ((bg-void "gray1")        ; Change background here
       (fg-main "green")        ; Change foreground here
       ...)
```

### Recommended Complementary Packages

- `rainbow-delimiters` — Paren depth highlighting (themed with 4-color rotation)
- `eval-sexp-fu` — Flash on eval (included in live-coding module)
- `doom-modeline` — Themed modeline (faces included)
- `aggressive-indent` — Auto-reindent (included in live-coding module)
