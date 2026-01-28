# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- eval-sexp-fu flash faces for evaluating Lisp expressions
- Comprehensive CIDER faces for Clojure development (36 faces)
- ERT tests for eval-sexp-fu and CIDER faces with WCAG AA contrast validation
- Smartparens faces (pair, wrap, tag overlays)
- git-commit faces (summary, heading, branch, action, file, second-line)
- hl-sexp face for s-expression highlighting
- volatile-highlights face for recently changed regions
- Apropos faces (symbol, function/variable/misc buttons, keybinding, plist, property)
- ERT tests for all new gap faces (5 new test groups, total 25 tests)

- Doom +live-coding module with emacs-live-inspired features:
  - `+flash`: eval-sexp-fu integration with CIDER hooks (0.4s flash duration)
  - `+pulse`: built-in pulse.el animated color-fade on eval (green tint)
  - `+prettify`: lambda prettification in Lisp modes (fn/lambda → λ)
  - `+aggressive`: aggressive auto-indentation for Lisp modes

### Changed
- Rainbow-delimiters now use 4-color rotation (green → blue → cyan → purple) instead of green-heavy progression

## [2.0.0] - 2024-01-28

### Added
- Expanded face coverage for comprehensive syntax highlighting
- Support for additional Emacs modes and packages
- Enhanced color palette for improved visual consistency

### Changed
- Major rewrite of theme architecture for better maintainability
- Refactored face definitions for improved organization
- Updated color values for better contrast and readability

### Fixed
- Improved compatibility with various Emacs versions
- Corrected color inconsistencies across different modes

[Unreleased]: https://github.com/rajp152k/bit-mage-theme.el/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/rajp152k/bit-mage-theme.el/releases/tag/v2.0.0
