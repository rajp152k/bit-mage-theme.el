;;; private/live-coding/autoload.el -*- lexical-binding: t; -*-

;;;; Pulse-based eval flash

(defface +live-coding-pulse-face
  '((((background dark))
     :background "#2a0040" :extend t)
    (t
     :background "#DDAAFF" :extend t))
  "Face for pulse flash on eval. Purple tint matching bit-mage theme."
  :group 'live-coding)

(defface +live-coding-pulse-error-face
  '((((background dark))
     :background "#330000" :extend t)
    (t
     :background "#FFAAAA" :extend t))
  "Face for pulse flash on eval error."
  :group 'live-coding)

;;;###autoload
(defun +live-coding-pulse-on-eval-a (orig-fn &rest args)
  "Advice to pulse the last sexp before/after evaluation.
Wraps eval-last-sexp, cider-eval-last-sexp, etc."
  (let ((end (point))
        (start (save-excursion
                 (backward-sexp)
                 (point))))
    (condition-case err
        (prog1 (apply orig-fn args)
          (pulse-momentary-highlight-region
           start end '+live-coding-pulse-face))
      (error
       (pulse-momentary-highlight-region
        start end '+live-coding-pulse-error-face)
       (signal (car err) (cdr err))))))

;;;###autoload
(defun +live-coding-pulse-defun-a (orig-fn &rest args)
  "Advice to pulse the current defun before/after evaluation.
Wraps eval-defun, cider-eval-defun-at-point, etc."
  (let (start end)
    (save-excursion
      (beginning-of-defun)
      (setq start (point))
      (end-of-defun)
      (setq end (point)))
    (condition-case err
        (prog1 (apply orig-fn args)
          (pulse-momentary-highlight-region
           start end '+live-coding-pulse-face))
      (error
       (pulse-momentary-highlight-region
        start end '+live-coding-pulse-error-face)
       (signal (car err) (cdr err))))))

;;;; REPL helpers

;;;###autoload
(defun +live-coding/send-region-to-repl (start end)
  "Send region to CIDER REPL and evaluate."
  (interactive "r")
  (when (fboundp 'cider-insert-region-in-repl)
    (cider-insert-region-in-repl start end)
    (cider-repl-return)))
