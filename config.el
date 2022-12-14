;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
;; (setq doom-font (font-spec :family "Fira Mono" :size 16))
;;(setq doom-font (font-spec :family "Fira Mono" :size 16))
;;(menu-bar-mode t)

(setq org-roam-v2-ack t)
(setq org-roam-directory "/home/al/org-roam/")
(setq org-roam-complete-everywhere t)

(global-visual-line-mode 1)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alexandr Maslov"
      user-mail-address "maslov314@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;

(setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 16))

;; (set-frame-font "Fira Code Retina 12")
;; (set-frame-font "Fira Code Retina 14")
(set-frame-font "Fira Code Retina 16")


;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-1337)
;;(setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-flatwhite)
;; (setq doom-theme 'doom-gruvbox-light)
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-dark+)
;; (setq doom-theme 'doom-1337)
;; (setq doom-theme 'doom-ayu-light)
(setq doom-theme 'doom-ayu-dark)


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

(map! :leader
      :desc "Save buffer"
      "l" #'save-buffer)

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Find file"
      "f" #'org-roam-find-file))

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Insert"
      "i" #'org-roam-insert))

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Graph"
      "g" #'org-roam-graph))

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Capture"
      "c" #'org-roam-capture))

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Daily"
      "d" #'org-roam-dailies-find-today))

(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-k") 'evil-normal-state)
;;(definekey evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package! python-black
  :demand t
  :after python)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)
;; Feel free to throw your own personal keybindings here
(map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
(map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
(map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement)
