;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "David Fagan"
      user-mail-address "Davida.fagan@proton.me")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 42 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 36))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; //////////////////////  Additions \\\\\\\\\\\\\\\\\\\\\

;;; Volta (Node version manager) - add to exec-path so LSP servers can find node
(add-to-list 'exec-path (expand-file-name "~/.volta/bin"))
(setenv "PATH" (concat (expand-file-name "~/.volta/bin") ":" (getenv "PATH")))

;; Transparency for GUI frame
(set-frame-parameter (selected-frame) 'alpha ' (75 . 75))
(add-to-list 'default-frame-alist '(alpha . (75 . 75)))

;;; Faster startup
(setq gc-cons-threshold 100000000)

;;; LSP performance tuning
(setq lsp-log-io nil
      lsp-idle-delay 0.5
      lsp-enable-symbol-highlighting nil
      lsp-enable-on-type-formatting nil)

;;; Large file handling (logs)
(setq doom-large-file-size 5)

;;; Better YAML + Terraform indentation
(setq yaml-indent-offset 2)

;;; Dockerfile mode
(after! dockerfile-mode
  (setq dockerfile-use-buildkit t))

 ;; Use system clipboard
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Journal
;; Test if this works: SPC n j n
(setq org-journal-dir "~/org/journal/")
(setq org-journal-file-type 'daily)

;; ESLint on Save
(after! lsp-mode
  (setq lsp-eslint-auto-fix-on-save t))

;; Tab indentation for JS/TS/Vue (matches project ESLint: @stylistic/indent ['error', 'tab'])
(add-hook! '(js-mode-hook js2-mode-hook typescript-mode-hook typescript-tsx-mode-hook
             web-mode-hook vue-mode-hook)
  (setq indent-tabs-mode t
        tab-width 4))

(after! web-mode
  (setq web-mode-markup-indent-offset 4
        web-mode-css-indent-offset 4
        web-mode-code-indent-offset 4))

(after! js2-mode
  (setq js2-basic-offset 4
        js-indent-level 4))
