(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package delight :ensure t)
(use-package use-package-ensure-system-package :ensure t)

(defvar xdg-bin (getenv "XDG_BIN_HOME")
  "The XDG bin base directory.")

(defvar xdg-cache (getenv "XDG_CACHE_HOME")
  "The XDG cache base directory.")

(defvar xdg-config (getenv "XDG_CONFIG_HOME")
  "The XDG config base directory.")

(defvar xdg-data (getenv "XDG_DATA_HOME")
  "The XDG data base directory.")

(defvar xdg-lib (getenv "XDG_LIB_HOME")
  "The XDG lib base directory.")

(setq-default
 auto-save-list-file-name (expand-file-name (format "%s/emacs/auto-save-list" xdg-data))
 custom-file (expand-file-name (format "%s/emacs/custom.el" xdg-data)))
(when (file-exists-p custom-file)
  (load custom-file t))

(defvar my/emacshome "~/Google Drive/Clean Install Mac/emacs/old_conf/" "emacs configuration files")
;; (defvar my/emacslib "~/configuration/library/" "emacs libraries")
;; (defvar my/local "~/local/" "Local libraries")
;; (defvar my/localbin (concat my/local "bin/") "Primary binary path")
;; (defvar my/localscript (concat my/emacslib "../scripts/") "Primary script path")

(defvar my/fullname "Angelos Ikonomakis" "Full name")
(defvar my/email "angelos.ikonomakis@gmail.com" "Personal email")
(defvar my/homepage "https://oikonang.github.io/" "Personal homepage")
(defvar my/project-home "~/Documents/" "Personal projects directory")
(defvar my/phd (concat my/project-home "DTU/PhD/") "PhD project directory")
(setq phd-home my/phd)
(setq phd-profile (concat my/phd "Projects.org"))
(defvar my/base-directory "~/" "Base directory")
(defvar my/orgfiles "~/Dropbox/orgfiles")
(defvar my/backup_conf "~/Google Drive/Clean Install Mac/emacs/old_conf/" "Back of configuration files")
(defvar my/snippets "~/Google Drive/Snippets/" "Code snippets directory")
(defvar my/bibliography-directory "~/Google Drive/DTU/PhD/Work in Progress/References/" "Bibliography default path")
(defvar my/bibliography (concat my/bibliography-directory "huge.bib") "Primary bibtex file")
(defvar my/notes (concat my/bibliography-directory "notes.org") "Notes on references file")
(defvar my/PDFs '("~/Google Drive/DTU/PhD/Work in Progress/References/Articles/Conferences"
"~/Google Drive/DTU/PhD/Work in Progress/References/Articles/Journals"
"~/Google Drive/DTU/PhD/Work in Progress/References/Articles/Journals/DVL"
"~/Google Drive/DTU/PhD/Work in Progress/References/Books"
"~/Google Drive/DTU/PhD/Work in Progress/References/Manuals"
"~/Google Drive/DTU/PhD/Work in Progress/References/Presentations"
"~/Google Drive/DTU/PhD/Work in Progress/References/Theses"))
(setq scimax-directory "~/.emacs.d/scimax")
(add-to-list 'load-path "~/.emacs.d/scimax")

;; Copy emacs dot files into the cloud
    (copy-file "~/.emacs.d/myinit.org" "~/Google Drive/Clean Install Mac/emacs/old_conf/myinit.org" t)
    (copy-file "~/.emacs.d/init.el" "~/Google Drive/Clean Install Mac/emacs/old_conf/init.el" t)

    ;; (add-to-list 'load-path "~/.emacs.d/lisp/")
    ;; (load "multi-sdc")
    ;; (sdc-copy-directory 'hindcast
    ;;        "~/Documents/DTU/PhD/data/"
    ;;        "/"
    ;;        "~/Dropbox/phd_data_backup/"
    ;;      ) 

   ;; (async-start
   ;;      `(lambda()
   ;;          (copy-directory ,"~/Documents/DTU/PhD/data/" ,"~/Dropbox/phd_data_backup/" t t t)
   ;;          ,"~/Documents/DTU/PhD/data/")
   ;;      (lambda(return-path)
   ;;          (message "Upload '%s' finished" return-path)))

    ;; Copy PhD data directory asynchronously into the cloud
 ;;   (defun oikonang/data-backup (from_path to_path keep-time parents copy-contents)
;;     (async-start
;;         `(lambda()
;;             (copy-directory ,from_path ,to_path keep-time parents copy-contents)
;;             ,from_path)
;;         (lambda(return-path)
;;             (message "Upload '%s' finished" return-path))))

;;   (defun oikonang/data-backup-ignore (from_path to_path &optional ignore_path keep-time parents copy-contents)
;;   (interactive)
;;     (cl-letf (((symbol-function 'oikonang/data-backup) (symbol-function 'copy-directory))
;;               ((symbol-function 'copy-directory)
;;                (lambda (from_path to_path &optional ignore_path keep-time parents copy-contents)
;;                  (if (string=ignore_path)
;;                      (message "skipping: %s" ignore_path)
;;                    (oikonang/data-backup from_path to_path keep-time parents copy-contents)))))
;;       (copy-directory from_path to_path keep-time parents copy-contents)))

;; ignore_path = "~/Documents/DTU/PhD/data/hindcast_data"
;; from_path = "~/Documents/DTU/PhD/data/"
;; to_path = "~/Dropbox/phd_data_backup/"

(setq-default
  inhibit-startup-message t                        ; hide the startup message
  ad-redefinition-action 'accept                   ; Silence warnings for redefinition
  cursor-in-non-selected-windows t                 ; Hide the cursor in inactive windows
  display-time-default-load-average nil            ; Don't display load average
  fill-column 80                                   ; Set width for automatic line breaks
  help-window-select t                             ; Focus new help windows when opened
  indent-tabs-mode nil                             ; Prefers spaces over tabs
  inhibit-startup-screen t                         ; Disable start-up screen
  initial-scratch-message ""                       ; Empty the initial *scratch* buffer
  kill-ring-max 128                                ; Maximum length of kill ring
  load-prefer-newer t                              ; Prefers the newest version of a file
  mark-ring-max 128                                ; Maximum length of mark ring
  scroll-conservatively most-positive-fixnum       ; Always scroll by one line
  select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
  tab-width 4                                      ; Set width for tabs
 ; use-package-always-ensure t                      ; Avoid the :ensure keyword for each package
  vc-follow-symlinks t                             ; Always follow the symlinks
  view-read-only t                                 ; Always open read-only buffers in view-mode
  save-interprogram-paste-before-kill t)           ; Save to clipboard before killing

 (cd "~/")                                         ; Move to the user directory
 (column-number-mode 1)                            ; Show the column number
 (fset 'yes-or-no-p 'y-or-n-p)                     ; Change yes or no trigger to y or n
 (global-hl-line-mode)                             ; Hightlight current line
 (set-default-coding-systems 'utf-8)               ; Default to utf-8 encoding
 (show-paren-mode 1)                               ; Show the parent
 (global-visual-line-mode 1)                       ; wrap lines at word boundary
 (global-linum-mode t)                             ; enable line numbers globally

(message "Better defaults finished")

(when window-system
 (menu-bar-mode -1)              ; Disable the menu bar
 (scroll-bar-mode -1)            ; Disable the scroll bar
 (tool-bar-mode -1))              ; Disable the tool bar
; (tooltip-mode -1))              ; Disable the tooltips
 (message "Turn off mouse interface finished")

;;(set-frame-font "Hack Nerd Font 13" nil t) ;; Set the font similar to iTerm2 to load icons
 (set-face-attribute 'default nil :font "Source Code Pro")
 (set-fontset-font t 'latin "Noto Sans")
(message "Fonts finished")

;; install theme dracula and load it on startup
  (use-package dracula-theme
    :ensure t
    :config (load-theme 'dracula t))

;; (use-package nord-theme
;; :config
;; (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
;; (load-theme 'nord t))

(use-package doom-modeline
:defer 0.1
:config (doom-modeline-mode))

(use-package fancy-battery
:after doom-modeline
:hook (after-init . fancy-battery-mode))

;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)
(message "Themes and Modelines finished")

(use-package dashboard
  :after    org
  :straight t
  :bind
  ;; https://github.com/rakanalh/emacs-dashboard/issues/45
  (:map dashboard-mode-map
        ("<down-mouse-1>" . nil)
        ("<mouse-1>"      . widget-button-click)
        ("<mouse-2>"      . widget-button-click)
        ("<up>"           . widget-backward)
        ("<down>"         . widget-forward))
  :diminish (dashboard-mode page-break-lines-mode)
  :hook ((dashboard-mode . (lambda () (setq-local tab-width 1))))
  :init
  (setq  dashboard-startup-banner 'official
         dashboard-banner-logo-title "With Great Power Comes Great Responsibility"
         dashboard-center-content t
         show-week-agenda-p       t
         dashboard-items '((recents   . 10)
                           (bookmarks . 5)
                           (projects  . 5)))
                           ;; (agenda    . 5 )
                           ;; (registers . 5 )
        

  (dashboard-setup-startup-hook)
  :config
  ;; Thanks https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-dashboard.el
  ;; Add heading icons
  (defun dashboard-insert-heading-icon (heading &optional _shortcut)
    "Add heading icons to dashboard."
    (when (display-graphic-p)
      ;; Load `all-the-icons' if it's unavailable
      (unless (featurep 'all-the-icons)
        (require 'all-the-icons nil t))

      (insert (cond
               ((string-equal heading "Recent Files:")
                (all-the-icons-octicon "history" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))
               ((string-equal heading "Bookmarks:")
                (all-the-icons-octicon "bookmark" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))
               ((string-equal heading "Projects:")
                (all-the-icons-octicon "file-directory" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))))
      (insert " ")))
  (advice-add #'dashboard-insert-heading :before #'dashboard-insert-heading-icon)

  ;; Add file icons
  ;; MUST redefine the sections because of the macro `dashboard-insert-section-list'
  (defmacro dashboard-insert-section-list (section-name list action &rest rest)
    "Insert into SECTION-NAME a LIST of items, expanding ACTION and passing REST to widget creation."
    `(when (car ,list)
       (mapc (lambda (el)
               (let ((widget nil))
                 (insert "\n    ")
                 (when (display-graphic-p)
                   (insert (when-let ((path (car (last (split-string ,@rest " - ")))))
                             (if (file-directory-p path)
                                 (cond
                                  ((and (fboundp 'tramp-tramp-file-p)
                                      (tramp-tramp-file-p default-directory))
                                   (all-the-icons-octicon "file-directory" :height 1.0 :v-adjust 0.01))
                                  ((file-symlink-p path)
                                   (all-the-icons-octicon "file-symlink-directory" :height 1.0 :v-adjust 0.01))
                                  ((all-the-icons-dir-is-submodule path)
                                   (all-the-icons-octicon "file-submodule" :height 1.0 :v-adjust 0.01))
                                  ((file-exists-p (format "%s/.git" path))
                                   (all-the-icons-octicon "repo" :height 1.1 :v-adjust 0.01))
                                  (t (let ((matcher (all-the-icons-match-to-alist path all-the-icons-dir-icon-alist)))
                                       (apply (car matcher) (list (cadr matcher) :v-adjust 0.01)))))
                               (all-the-icons-icon-for-file (file-name-nondirectory path)))))
                   (insert "\t"))
                 (setq widget
                       (widget-create 'push-button
                                      :action ,action
                                      :mouse-face 'highlight
                                      :button-prefix ""
                                      :button-suffix ""
                                      :format "%[%t%]"
                                      ,@rest))))
             ,list)))


  (defmacro dashboard-insert-shortcut (shortcut-char
                                         search-label
                                         &optional no-next-line)
      "Insert a shortcut SHORTCUT-CHAR for a given SEARCH-LABEL.
Optionally, provide NO-NEXT-LINE to move the cursor forward a line."
      `(progn
         (eval-when-compile (defvar dashboard-mode-map))
         (let ((sym (make-symbol (format "Jump to \"%s\"" ,search-label))))
           (fset sym (lambda ()
                       (interactive)
                       (unless (search-forward ,search-label (point-max) t)
                         (search-backward ,search-label (point-min) t))
                       ,@(unless no-next-line
                           '((forward-line 1)))
                       (back-to-indentation)
                       (if (display-graphic-p) (widget-forward 1))))
           (eval-after-load 'dashboard
             (define-key dashboard-mode-map ,shortcut-char sym)))))


  ;; Recentf
  (defun dashboard-insert-recents (list-size)
    "Add the list of LIST-SIZE items from recently edited files."
    (recentf-mode)
    (dashboard-insert-section
     "Recent Files:"
     recentf-list
     list-size
     "r"
     `(lambda (&rest ignore) (find-file-existing ,el))
     (abbreviate-file-name el)))

  ;; Bookmarks
  (defun dashboard-insert-bookmarks (list-size)
    "Add the list of LIST-SIZE items of bookmarks."
    (require 'bookmark)
    (dashboard-insert-section
     "Bookmarks:"
     (dashboard-subseq (bookmark-all-names)
                       0 list-size)
     list-size
     "m"
     `(lambda (&rest ignore) (bookmark-jump ,el))
     (let ((file (bookmark-get-filename el)))
       (if file
           (format "%s - %s" el (abbreviate-file-name file))
         el))))

  ;; Projectile
  (defun dashboard-insert-projects (list-size)
    "Add the list of LIST-SIZE items of projects."
    (require 'projectile)
    (projectile-load-known-projects)
    (dashboard-insert-section
     "Projects:"
     (dashboard-subseq (projectile-relevant-known-projects)
                       0 list-size)
     list-size
     "p"
     `(lambda (&rest ignore) (projectile-switch-project-by-name ,el))
     (abbreviate-file-name el))))
  (message "Dashboard finished")

;; counsel is a requirement for swiper
  (use-package counsel
 :ensure t
   :bind
   (("M-y" . counsel-yank-pop)
    :map ivy-minibuffer-map
    ("M-y" . ivy-next-line)))

   (autoload 'ivy-bibtex "ivy-bibtex" "" t)
   ;; ivy-bibtex requires ivy's `ivy--regex-ignore-order` regex builder, which
   ;; ignores the order of regexp tokens when searching for matching candidates.
   ;; Add something like this to your init file:
   (setq ivy-re-builders-alist
     '((ivy-bibtex . ivy--regex-ignore-order)
       (t . ivy--regex-plus)))

(use-package ivy
 :ensure t
 :diminish (ivy-mode)
 :bind (
 ("C-x b" . ivy-switch-buffer)
 ("<f9>" . ivy-bibtex))
 :config
 (ivy-mode 1)
 (setq ivy-use-virtual-buffers t)
 (setq ivy-count-format "%d/%d ")
 (setq ivy-display-style 'fancy))

 ;; Intuitive search results with C-s
 (use-package swiper
   :ensure try
   :bind (("C-s" . swiper-isearch)
          ("C-r" . swiper-isearch)
          ("C-c C-r" . ivy-resume)
          ("M-x" . counsel-M-x)
          ("C-x C-f" . counsel-find-file))
   :config
   (progn
     (ivy-mode 1)
     (setq ivy-use-virtual-buffers t)
     (setq ivy-display-style 'fancy)
     (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
     ))

;; latex
(use-package tex
:ensure auctex)

(use-package auctex
:mode (("\\.tex\\'" . latex-mode) ("\\.bib\\'" . bibtex-mode))
:commands (latex-mode LaTeX-mode plain-tex-mode ivy-bibtex)
:ensure t
:init
  (setq ivy-bib-pdf-file "pdf")
  (setq bibtex-completion-pdf-field "File")
:bind
  ("<C-f9>" . ivy-bibtex))

(require 'ivy-bibtex)

  ;; (setq ivy-bibtex-bibliography `(, my/bibliography)) ;; where your references are stored
  ;; (setq ivy-bibtex-library-path `(, my/PDFs))         ;; where your pdfs etc are stored
  ;; (setq ivy-bibtex-notes-path  (concat my/bibliography-directory "notes.org")) ;; where your notes are stored   

  (setq bibtex-completion-bibliography `(, my/bibliography)) ;; writing completion)
  (setq bibtex-completion-library-path `(, my/PDFs))
  (setq bibtex-completion-notes-path  (concat my/bibliography-directory "notes.org"))
  (setq bibtex-completion-additional-search-fields '(tags)) ;; search by tags keyword. It is mandatory in order for the next argument to work
  (setq bibtex-completion-display-formats '(
    (article       . "${author:36} ${title:*} ${journal:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:7} ${tags:6}")
    (inbook        . "${author:36} ${title:*} Chapter ${chapter:32} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:7} ${tags:6}")
    (incollection  . "${author:36} ${title:*} ${booktitle:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:7} ${tags:6}")
    (inproceedings . "${author:36} ${title:*} ${booktitle:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:7} ${tags:6}")
    (t             . "${author:36} ${title:*} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:6} ${tags:7}")))

  (use-package reftex
  :after (auctex)
  :commands turn-on-reftex
  :ensure t
  :config
  (setq reftex-file-extensions
  '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
  (setq reftex-try-all-extensions t)
  (setq reftex
-plug-into-AUCTeX t)
  (setq reftex-default-bibliography `(,my/bibliography))
  (setq reftex-texpath-environment-variables
  `(,(concat ".:" my/bibliography-directory)))
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
  (add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
         )

  (use-package org-ref
    :after org
    :init)
  (setq reftex-default-bibliography `(, my/bibliography))
  (setq org-ref-bibliography-notes `(, my/notes))
  (setq org-ref-default-bibliography `(, my/bibliography))
  (setq org-ref-pdf-directory `(, my/PDFs))
  (setq org-ref-default-citation-link "supercite")

(use-package bibtex
:after (reftex)
:mode ("\\.bib" . bibtex-mode)
:init
  (progn
    (setq bibtex-align-at-equal-sign t)
    (setq  bibtex-autokey-year-length 4)
    (setq  bibtex-autokey-name-year-separator "")
    (setq  bibtex-autokey-year-title-separator "")
    (setq  bibtex-autokey-titleword-separator "")
    (setq  bibtex-autokey-titlewords 0)
    (setq  bibtex-autokey-titlewords-stretch 0)
    (setq  bibtex-autokey-titleword-length 0)
    (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120)))))

(use-package preview
  :commands LaTeX-preview-setup
  :after (auctex)
  :init   
    (progn
      (setq-default preview-scale 1.4
          preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))))

;; (setq org-latex-pdf-process
;;     '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;       "bibtex %b"
;;       "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;       "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; (setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pygtex" "pygstyle")))


;; (setq TeX-source-correlate-start-server t)
;; (setq TeX-shell "/bin/bash")
;; (setq TeX-file-extensions
;;       '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))
;; (setq TeX-auto-local "tmp/auto")
;; (setq TeX-auto-save t
;;       TeX-parse-self t
;;       TeX-save-query nil)
;; ;;      TeX-PDF-mode t)
;; (make-variable-buffer-local 'TeX-master) ;; I think this is need because the variable is not buffer local until Auctex is active
;;         ;; Make emacs aware of multi-file projects
;; (setq TeX-master nil) ; Query for master file.
;; (setq TeX-master-file-ask nil) ; Query for master file.

;; (add-hook 'LaTeX-mode-hook (lambda ()
;;                              (local-set-key "\C-ct" 'beamer-insert-frame)
;;                              (local-set-key "\C-cs" 'ivy-insert-latex-math)
;;                              (setq TeX-source-specials-mode t)
;;                              (LaTeX-preview-setup) ;; Preview-LaTeX-mode:
;;                              (autoload 'LaTeX-preview-setup "preview")                             
;;                              (TeX-PDF-mode t) ;; Use PDF mode by default
;;                              (local-set-key "\C-c\C-a" 'TeX-view)
;;                              (local-set-key "\C-ce" 'TeX-next-error)
;;                              ;;Turn on autofill (linewrap) in (La)Tex modes
;;                              (turn-on-auto-fill)
;;                              ))

;; (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;; (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
;; (add-hook 'LaTeX-mode-hook #'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
;; (add-hook 'tex-mode-hook 'turn-on-auto-fill)
;; (add-hook 'LaTeX-mode-hook (lambda ()
;;                              (push
;;                               '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;;                                 :help "Run latexmk on file")
;;                               TeX-command-list)))
;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; ;; Insert frame
;; (defun my/beamer-insert-frame (title)
;;   "Insert frame"
;;   (interactive "sTitle of frame: ")
;;   (insert (concat "%{{{ " title "\n\\begin{frame}\n\t\\frametitle{" title "}\n\\end{frame}\n%}}} " title "\n"))
;; )

;; (autoload 'bibfind "bibfind" "Search for BibTeX entries on the web" t)

(require 'scimax-ob)
(require 'scimax-org-babel-ipython-upstream)

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package conda
  :ensure t
  :config
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell)
  (conda-env-autoactivate-mode t)
  (setq venv-location "~/miniconda3/envs/"))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package paradox
  :defer 1
  :custom
  (paradox-column-width-package 27)
  (paradox-column-width-version 13)
  (paradox-execute-asynchronously t)
  (paradox-hide-wiki-packages t)
  :config
  (paradox-enable)
  (remove-hook 'paradox-after-execute-functions #'paradox--report-buffer-print))

(use-package rainbow-mode
  :ensure t
  :delight
  :hook (prog-mode))

(use-package try
  :ensure t
  :defer 5)

(use-package which-key
  :ensure t
  :defer 0.2
  :delight
  :config (which-key-mode))

; flashes the cursor's line when you scroll
 (use-package beacon
 :ensure t
 :config
 (beacon-mode 1)
 (setq beacon-color "#666600"))

(use-package hungry-delete
:ensure t
:config
(global-hungry-delete-mode))

(use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package all-the-icons 
:ensure t
:defer 0.5)

(use-package all-the-icons-ivy
:ensure t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switche-buffer-other-window ivy-switch-buffer))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))


(use-package all-the-icons-dired
:ensure t
)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package eyebrowse
:ensure t
:config 
(eyebrowse-mode)
)

(use-package ox-hugo
  :ensure t            ;Auto-install the package from Melpa (optional)
  :config
  ;; (add-hook 'ox-hugo-hook        
  ;;         (eval . (org-hugo-auto-export-mode)))
  :after ox)

;; wrapper for save-buffer ignoring arguments
     (defun oikonang/save-buffer-no-args ()
     "Save buffer ignoring arguments"
     (save-buffer))

     (use-package pdf-tools
      :pin manual ;; manually update
      :config
       (pdf-tools-install) ;; initialize
       (setq-default pdf-view-display-size 'fit-page) ;; open pdfs scaled to fit page
       (setq pdf-annot-activate-created-annootations t) ;; automatically annotate highlights
       (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward) ;; use normal isearch
       (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0))) ;; turn off cua so that copy works
       (add-hook 'pdf-view-mode-hook (lambda () (linum-mode -1))) ;; turn off numbering on pdf view
       (setq pdf-view-resize-factor 1.1)
       ;; keyboard shortcuts
       (define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
       (define-key pdf-view-mode-map (kbd "t") 'pdf-annot-add-text-annotation)
       (define-key pdf-view-mode-map (kbd "D") 'pdf-annot-delete)
       ;; wait until map is available
       (with-eval-after-load "pdf-annot"
       (define-key pdf-annot-edit-contents-minor-mode-map (kbd "<return>") 'pdf-annot-edit-contents-commit)
       (define-key pdf-annot-edit-contents-minor-mode-map (kbd "<S-return>") 'newline)
       ;; save after adding comment
       (advice-add 'pdf-annot-edit-contents-commit :after 'oikonang/save-buffer-no-args)))


     (use-package org-pdfview
      :ensure t)
(message "pdf tools finished")

(global-set-key [remap kill-buffer] #'kill-this-buffer)

(use-package window
  :ensure nil
  :bind (("C-x 3" . hsplit-last-buffer)
         ("C-x 2" . vsplit-last-buffer))
  :preface
  (defun hsplit-last-buffer ()
    "Gives the focus to the last created horizontal window."
    (interactive)
    (split-window-horizontally)
    (other-window 1))

  (defun vsplit-last-buffer ()
    "Gives the focus to the last created vertical window."
    (interactive)
    (split-window-vertically)
    (other-window 1)))

(use-package ace-window
  :defer    t
  :straight t
  :bind (("M-o" . ace-window))
  :config
  (set-face-attribute
   'aw-leading-char-face nil
   :foreground "deep sky blue"
   :weight 'bold
   :height 3.0)
  (set-face-attribute
   'aw-mode-line-face nil
   :inherit 'mode-line-buffer-id
   :foreground "lawn green")
  (setq-default cursor-in-non-selected-windows 'hollow)
  (setq aw-reverse-frame-list t
         aw-keys '(?a ?s ?d ?f ?j ?k ?l)
         aw-dispatch-always t
         aw-dispatch-alist
         '((?w hydra-window-size/body)
           (?o hydra-window-scroll/body)
           (?\; hydra-frame-window/body)
           (?0 delete-frame)
           (?1 delete-other-frames)
           (?2 make-frame)
           (?x aw-delete-window "Ace - Delete Window")
           (?c aw-swap-window "Ace - Swap Window")
           (?n aw-flip-window)
           (?v aw-split-window-vert "Ace - Split Vert Window")
           (?h aw-split-window-horz "Ace - Split Horz Window")
           (?\- aw-split-window-vert "Ace - Split Vert Window")
           (?\| aw-split-window-horz "Ace - Split Horz Window")
           (?m delete-other-windows "Ace - Maximize Window")
           (?g delete-other-windows)
           (?b balance-windows)
           (?u (lambda ()
                 (progn
                   (winner-undo)
                   (setq this-command 'winner-undo)))
               (?r winner-redo))))
  (with-eval-after-load 'hydra
    (defhydra hydra-window-size (:color violet)
      "Windows size M-o-w"
      ("h" shrink-window-horizontally "shrink horizontal")
      ("j" shrink-window "shrink vertical")
      ("k" enlarge-window "enlarge vertical")
      ("l" enlarge-window-horizontally "enlarge horizontal"))
    (defhydra hydra-window-scroll (:color violet)
      "Scroll other window M-o-o"

      ("n" joe-scroll-other-window "scroll")
      ("p" joe-scroll-other-window-down "scroll down"))
    (defhydra hydra-frame-window (:color violet :hint nil)
      "
^Delete^                       ^Frame resize^             ^Window^                Window Size^^^^^^   ^Text^                         (__)
_0_: delete-frame              _g_: resize-frame-right    _t_: toggle               ^ ^ _k_ ^ ^        _K_                           (oo)
_1_: delete-other-frames       _H_: resize-frame-left     _e_: ace-swap-win         _h_ ^+^ _l_        ^+^                     /------\\/
_2_: make-frame                _F_: fullscreen            ^ ^                       ^ ^ _j_ ^ ^        _J_                    / |    ||
_d_: kill-and-delete-frame     _n_: new-frame-right       _w_: ace-delete-window    _b_alance^^^^      ^ ^                   *  /\\---/\\  ~~  C-x f ;
"
      ("0" delete-frame :exit t)
      ("1" delete-other-frames :exit t)
      ("2" make-frame  :exit t)
      ("b" balance-windows)
      ("d" kill-buffer-and-window :exit t)
      ("e" ace-swap-window)
      ("n" new-frame-right :exit t)
      ("F" toggle-frame-fullscreen)   ;; is <f11>
      ("g" resize-frame-right :exit t)
      ("H" resize-frame-left :exit t)  ;; aw-dispatch-alist uses h, I rebind here so hjkl can be used for size      ("n" new-frame-right :exit t)
      ("r" reverse-windows)
      ("t" toggle-window-spilt)
      ("w" ace-delete-window :exit t)
      ("x" delete-frame :exit t)
      ("K" text-scale-decrease)
      ("J" text-scale-increase)
      ("h" shrink-window-horizontally)
      ("k" shrink-window)
      ("j" enlarge-window)
      ("l" enlarge-window-horizontally)))
  (ace-window-display-mode t))

(windmove-default-keybindings)   ;; Move among windows with Shift+arrows
(winner-mode 1)                  ;; Go back and forward on window configuration with C-c+arrows

(use-package switch-window
  :ensure t
  :bind (("C-x o" . switch-window)
         ("C-x w" . switch-window-then-swap-buffer)))

(use-package org
  :ensure t
  :pin org)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
     '(org-directory "~/Google Drive/orgfiles")
     '(org-export-html-postamble nil)
     '(org-hide-leading-stars t)
     '(org-startup-folded (quote overview))
     '(org-startup-indented t)
     '(org-confirm-babel-evaluate nil)
     '(org-src-fontify-natively t))

(setq org-file-apps
          (append '(
                    ("\\.pdf\\'" . default)   ;; "evince %s"
                    ("\\.x?html?\\'" . "/usr/bin/chromium-browser %s")
                    ) org-file-apps ))

(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list "~/Dropbox/orgfiles/gcal.org"
                             "~/Dropbox/orgfiles/i.org"
                             "~/Dropbox/orgfiles/meeting-notes.org"
                             "~/Dropbox/orgfiles/vessel-notes.org"))
(setq ;; org-use-speed-commands t
      ;; org-return-follows-link t
      ;; org-hide-emphasis-markers t
      ;; org-completion-use-ido t
      ;; org-outline-path-complete-in-steps nil
      ;; org-src-fontify-natively t   ;; Pretty code blocks
      ;; org-src-tab-acts-natively t 
      ;; org-confirm-babel-evaluate nil
      org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "|" "DONE(d)")
                          (sequence "|" "CANCELED(c)"))
      org-todo-keyword-faces
      '(("TODO" . "khaki2")
      ("DOING" . "orange")
      ("DONE" . "green")
      ("CANCELED" . "OrangeRed1")))

(font-lock-add-keywords            ; A bit silly but my headers are now
 'org-mode `(("^\\*+ \\(TODO\\) "  ; shorter, and that is nice canceled
              (1 (progn (compose-region (match-beginning 1) (match-end 1) "⚑")
                        nil)))
             ("^\\*+ \\(DOING\\) "
              (1 (progn (compose-region (match-beginning 1) (match-end 1) "⚐")
                        nil)))
             ("^\\*+ \\(CANCELED\\) "
              (1 (progn (compose-region (match-beginning 1) (match-end 1) "✘")
                        nil)))
             ("^\\*+ \\(DONE\\) "
              (1 (progn (compose-region (match-beginning 1) (match-end 1) "✔")
                        nil)))))

(setq org-capture-templates
          '(("a" "Appointment" entry (file  "~/Dropbox/orgfiles/gcal.org" )
             "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
            ("w" "Work" entry (file+datetree "~/Dropbox/orgfiles/i.org" "Work")
            "* TODO %^{Description}  %^g \n%?" :tree-type week)
            ("p" "Personal" entry (file+datetree "~/Dropbox/orgfiles/i.org" "Personal")
            "* TODO %^{Description}  %^g \n%?" :tree-type week)
            ("b" "AirBnB" entry (file+headline "~/Dropbox/orgfiles/i.org" "AirBnB")
            "* TODO %^{Name} \n Whole Ammount:%^{Total Income} \n Manager Ammount:%^{Ammount to be paid to Manager} \n AFM:%^{AFM} \n Arrival:%^T \n Departure:%^T \n -[]Manager payment \n -[]Review \n%?" :prepend t)
            ("m" "Maersk-meeting" entry (file+headline "~/Dropbox/orgfiles/meeting-notes.org" "Maersk") "* TODO %^T \n**  %?" :prepend t)
            ("d" "DTU-meeting" entry (file+headline "~/Dropbox/orgfiles/meeting-notes.org" "DTU") "* TODO %^T \n**  %?" :prepend t)
            ))

(defadvice org-capture-finalize 
        (after delete-capture-frame activate)  
      "Advise capture-finalize to close the frame"  
      (if (equal "capture" (frame-parameter nil 'name))  
          (delete-frame)))
(defadvice org-capture-destroy 
        (after delete-capture-frame activate)  
      "Advise capture-destroy to close the frame"  
      (if (equal "capture" (frame-parameter nil 'name))  
          (delete-frame)))

(use-package noflet
      :ensure t )
    (defun make-capture-frame ()
      "Create a new frame and run org-capture."
      (interactive)
      (make-frame '((name . "capture")))
      (select-frame-by-name "capture")
      (delete-other-windows)
      (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
        (org-capture)))

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

(org-babel-do-load-languages
 'org-babel-load-languages
    '((emacs-lisp . t)
         (org . t)
         (latex . t)	
         (octave . t)
         (python . t)
         (C . t)
         (R . t)
         (sql . t)
         (sqlite . t)
        ; (julia . t)			
         (shell . t)
         ))

;; Taking meeting notes
  (defun meeting-notes ()
  "Call this after creating an org-mode heading for where the notes for the meeting
should be. After calling this function, call 'meeting-done' to reset the environment."
    (interactive)
    (outline-mark-subtree)                              ;; Select org-mode section
    (narrow-to-region (region-beginning) (region-end))  ;; Only show that region
    (deactivate-mark)
    (delete-other-windows)                              ;; Get rid of other windows
    (text-scale-set 2)                                  ;; Text is now readable by others
    (fringe-mode 0)
    (message "When finished taking your notes, run meeting-done."))

  (defun meeting-done ()
  "Attempt to 'undo' the effects of taking meeting notes."
    (interactive)
    (widen)                                       ;; Opposite of narrow-to-region
    (text-scale-set 0)                            ;; Reset the font size increase
    (fringe-mode 1)
    (winner-undo))                                ;; Put the windows back in place

(setq package-check-signature nil)

(use-package org-gcal
:ensure t
:config
(setq org-gcal-client-id "485573544331-ac4uiggi2061ijq9anue4ho2of0m4iln.apps.googleusercontent.com"
org-gcal-client-secret "8Q05Y-3hW9XgbMSHmCDKiULP"
org-gcal-file-alist '(("angelos.ikonomakis@gmail.com" .  "~/Dropbox/orgfiles/gcal.org"))))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

;; (defalias 'list-buffers 'ibuffer) ;; show buffer list in cool way
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))
               ("magit" (mode . magit-mode))
               ("IRC" (or (mode . circe-channel-mode) (mode . circe-server-mode)))
               ("web" (or (mode . web-mode) (mode . js2-mode)))
               ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
               ("mu4e" (or

                        (mode . mu4e-compose-mode)
                        (name . "\*mu4e\*")
                        ))
               ("programming" (or
                               (mode . clojure-mode)
                               (mode . clojurescript-mode)
                               (mode . python-mode)
                               (mode . c++-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

;; don't show these
                                        ;(add-to-list 'ibuffer-never-show-predicates "zowie")
;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)

(setq indo-enable-flex-matching t) ;; suggest buffer
(setq ido-everywhere t)
(ido-mode 1) ;; relevant information on buffer line

; wiki melpa problem
;; (use-package dired+
;;  :ensure t
;;  :config (require 'dired+)
;;  )

(setq dired-dwim-target t)

(use-package dired-narrow
:ensure t
:config
(bind-key "C-c C-n" #'dired-narrow)
(bind-key "C-c C-f" #'dired-narrow-fuzzy)
(bind-key "C-x C-N" #'dired-narrow-regexp)
)

(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

(use-package avy
       :ensure t
       :bind("M-s" . avy-goto-word-1)) ;; changed from char as per jcs

;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode t))

(use-package flycheck
  :defer 2
  :diminish
  :init (global-flycheck-mode)
  :custom
  (flycheck-display-errors-delay .3)
  (flycheck-stylelintrc "~/.stylelintrc.json"))

(use-package exec-path-from-shell
   :ensure t
   :init
   ;;This sets $MANPATH, $PATH and exec-path from your shell, but only on OS X and Linux
   (when (memq window-system '(mac ns x))
   (exec-path-from-shell-initialize)))

(use-package yasnippet
   :ensure t
   :init
   (yas-global-mode 1))

; mark and edit all copies of the marked region simultaniously with C-; 
(use-package iedit
:ensure t)

; if you're windened, narrow to the region, if you're narrowed, widen
; bound to C-x n
(defun narrow-or-widen-dwim (p)
"If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
(interactive "P")
(declare (interactive-only))
(cond ((and (buffer-narrowed-p) (not p)) (widen))
((region-active-p)
(narrow-to-region (region-beginning) (region-end)))
((derived-mode-p 'org-mode)
;; `org-edit-src-code' is not a real narrowing command.
;; Remove this first conditional if you don't want it.
(cond ((ignore-errors (org-edit-src-code))
(delete-other-windows))
((org-at-block-p)
(org-narrow-to-block))
(t (org-narrow-to-subtree))))
(t (narrow-to-defun))))

;; (define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

;; (defun load-if-exists (f)
;;   "load the elisp filee only if it exists and is readable"
 ;;  (if (file-readable-p f)
;;       (load-file f)))

;; (load-if-exists "~/Google Drive/Clean Install Mac/myinit.el")

(use-package hydra 
    :ensure hydra
    :init 
    (global-set-key
    (kbd "C-x t")
	    (defhydra toggle (:color blue)
	      "toggle"
	      ("a" abbrev-mode "abbrev")
	      ("s" flyspell-mode "flyspell")
	      ("d" toggle-debug-on-error "debug")
	      ("c" fci-mode "fCi")
	      ("f" auto-fill-mode "fill")
	      ("t" toggle-truncate-lines "truncate")
	      ("w" whitespace-mode "whitespace")
	      ("q" nil "cancel")))
    (global-set-key
     (kbd "C-x j")
     (defhydra gotoline 
       ( :pre (linum-mode 1)
	      :post (linum-mode -1))
       "goto"
       ("t" (lambda () (interactive)(move-to-window-line-top-bottom 0)) "top")
       ("b" (lambda () (interactive)(move-to-window-line-top-bottom -1)) "bottom")
       ("m" (lambda () (interactive)(move-to-window-line-top-bottom)) "middle")
       ("e" (lambda () (interactive)(end-of-buffer)) "end")
       ("c" recenter-top-bottom "recenter")
       ("n" next-line "down")
       ("p" (lambda () (interactive) (forward-line -1))  "up")
       ("g" goto-line "goto-line")
       )))

(use-package projectile
      :ensure t
      :bind ("C-c p" . projectile-command-map)
      :config
      (projectile-global-mode)
    (setq projectile-completion-system 'ivy))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
   (setq dumb-jump-selector 'helm)  ;; (setq dumb-jump-selector 'ivy)
:init
(dumb-jump-mode)
  :ensure
)

(defun org-agenda-show-agenda-and-todo (&optional arg)
   (interactive "P")
   (org-agenda arg "c")
   (org-agenda-fortnight-view)) 

 (defun oikonang/swap-windows ()
 (interactive )
 (ace-swap-window)
 (aw-flip-window)
 )

 (defun oikonang/load-iorg ()
 (interactive )
 (find-file "~/Dropbox/orgfiles/i.org"))

 (defun oikonang/load-meetings ()
 (interactive )
 (find-file "~/Dropbox/orgfiles/meeting-notes.org"))

(defun oikonang/load-vessels ()
 (interactive )
 (find-file "~/Dropbox/orgfiles/vessel-notes.org"))

 (defun oikonang/load-myinit ()
 (interactive )
 (find-file "~/.emacs.d/myinit.org"))

  (defun oikonang/load-bib ()
 (interactive )
 (find-file my/bibliography))

  (defun oikonang/split-window-horizontally-instead ()
     "Kill any other windows and re-split such that the current window is on the top half of the frame."
     (interactive)
     (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
       (delete-other-windows)
       (split-window-horizontally)
       (when other-buffer
         (set-window-buffer (next-window) other-buffer))))

   (defun oikonang/split-window-vertically-instead ()
     "Kill any other windows and re-split such that the current window is on the left half of the frame."
     (interactive)
     (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
       (delete-other-windows)
       (split-window-vertically)
       (when other-buffer
         (set-window-buffer (next-window) other-buffer))))

   ;; Borrowed from http://postmomentum.ch/blog/201304/blog-on-emacs
   (defun oikonang/split-window()
     "Split the window to see the most recent buffer in the other window.
   Call a second time to restore the original window configuration."
     (interactive)
     (if (eq last-command 'oikonang-split-window)
         (progn
           (jump-to-register :oikonang-split-window)
           (setq this-command 'oikonang-unsplit-window))
       (window-configuration-to-register :oikonang/split-window)
       (switch-to-buffer-other-window nil)))


 ;; set up my own map
 (define-prefix-command 'oikonang-map)
 (global-set-key (kbd "C-z") 'oikonang-map) ;; was C-1
 (define-key oikonang-map (kbd "k") 'compile)
 ;; (define-key oikonang-map (kbd "c") 'hydra-multiple-cursors/body)
 ;; (define-key oikonang-map (kbd "m") 'mu4e)
 (define-key oikonang-map (kbd "1") 'org-global-cycle)
 (define-key oikonang-map (kbd "a") 'org-agenda-show-agenda-and-todo)
 (define-key oikonang-map (kbd "g") 'counsel-ag)
 (define-key oikonang-map (kbd "2") 'make-frame-command)
 (define-key oikonang-map (kbd "0") 'delete-frame)
 (define-key oikonang-map (kbd "o") 'ace-window)

 (define-key oikonang-map (kbd "|") 'oikonang/split-window-horizontally-instead)
 (define-key oikonang-map (kbd "_") 'oikonang/split-window-vertically-instead)
 (define-key oikonang-map (kbd "x") 'oikonang/split-window)

 (define-key oikonang-map (kbd "s") 'flyspell-correct-word-before-point)
 (define-key oikonang-map (kbd "i") 'oikonang/load-iorg)
 (define-key oikonang-map (kbd "m") 'oikonang/load-meetings)
 (define-key oikonang-map (kbd "v") 'oikonang/load-vessels)
 (define-key oikonang-map (kbd "b") 'oikonang/load-bib)
 (define-key oikonang-map (kbd "e") 'oikonang/load-myinit)
 (define-key oikonang-map (kbd "B") 'oikonang/data-backup-ignore)
 ;; (define-key oikonang-map (kbd "f") 'origami-toggle-node)
 (define-key oikonang-map (kbd "w") 'oikonang/swap-windows)
 (define-key oikonang-map (kbd "*") 'calc)


   (setq user-full-name "Angelos Ikonomakis"
                           user-mail-address "angelos.ikonomakis@gmail.com")
   ;;-------------------------------------------------------------------------

 (global-set-key (kbd "<end>") 'move-end-of-line)

 ;; (global-set-key [mouse-3] 'flyspell-correct-word-before-point)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if (executable-find "python3") 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-1"       . treemacs-select-window)
        ("C-5"   . treemacs-delete-other-windows)
        ("C-1"   . treemacs)
        ("C-4"   . treemacs-bookmark)
        ("C-2" . treemacs-find-file)
        ("C-3" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

;; (Use-package treemacs-magit
;;   :after treemacs magit
;;   :ensure t)

(use-package ledger-mode
:ensure t
:init
(setq ledger-clear-whole-transactions 1)

:config
(add-to-list 'evil-emacs-state-modes 'ledger-report-mode)
:mode "\\.dat\\'")

(use-package image :defer t
  :config
  ;; always loop GIF images
  (setq image-animate-loop t))

;; (use-package eimp
;;   :hook (image-mode . eimp-mode))

;; (use-package blimp
;;   :hook (image-mode . blimp-mode))

(use-package youtube-dl
  :defer t
  :init
  (setq youtube-dl-directory "~/Downloads/YouTube/")
  :config
  (setq youtube-dl-arguments
        '("--no-mtime" "--restrict-filenames" "--format" "best" "--mark-watched")))
