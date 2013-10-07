;; .emacs file
;;
;; 

;; TODO list and logic
;; first, am I using an xterm, a vt220 or a vt100 terminal?
;; next, is the connection via ssh or not (is is ssh-client non nil)
;; if ssh-client non nil, work out who on, and then which geometry
;; if ssh-client is nil, then get display variable, work out who on
;;      and get geometry.  To work out who on, take display environment
;;      variable, if equals :0.0, then use the system-name call to work
;;      out who on and hence which geometry.  If geometry is not :0.0,
;;      then most likely be on dumb xterminal, so use default-geometry.
;; Also need to decide which stuff is necessary for xterms and which
;;      is necessary for vt100s
;; Try and get C-. and C-, going for vt100 terminals

;;(setq debug-on-error t)

(setq load-path (cons "~/emacs" load-path))
;;(setq load-path (cons "~/emacs/w3" load-path))
;;(setq load-path (cons "~/emacs/w3/lisp" load-path))


(require 'tinycb)

  (require 'mouse-sel)
  (require 'mouse-extras)

  ;; TODO mode stuff
;   (autoload 'todo-mode "todo-mode"
;     "Major mode for editing TODO lists." t)
;   (autoload 'todo-show "todo-mode"
;     "Show TODO items." t)
;   (autoload 'todo-insert-item "todo-mode"
;     "Add TODO item." t)
  
;   (global-set-key "\C-ct" 'todo-show) ;; switch to TODO buffer
;   (global-set-key "\C-ci" 'todo-insert-item) ;; insert new item
  

(defun default-display ()
  (message "using default-display")
  (setq initial-frame-alist
	'((menu-bar-lines . 1) (height . 52) (width . 138) (top . 26) (left . 2)))
  (setq minibuffer-frame-alist
        '((top . 1) (left . 1) (width . 138) (height . 2))))

;;(default-display)

;;(set-default-font "-b&h-lucidatypewriter-medium-r-normal-sans-0-0-0-0-m-0-*-1")
(set-default-font "-misc-fixed-medium-r-normal--13-120-75-75-c-70-*-1")

(set-cursor-color "SteelBlue")
(set-mouse-color "SteelBlue")

;; removing help from f1 key
;(define-key key-translation-map [f1] nil)
;; font-lock (old frigging font-lock version, for emacs-19.28 !#@@$%@%#)
;(setq emacs-lisp-mode-hook '(lambda () (font-lock-mode 1)))
;; This one is for coloring
(global-font-lock-mode 1)
;; and this for the maximum coloring :)
(setq font-lock-maximum-decoration t)

(global-set-key [?\M- ]          'dabbrev-expand)
(global-set-key [C-down-mouse-1] 'mouse-buffer-menu)
(global-set-key [S-down-mouse-1] 'mouse-set-font)
;; (global-set-key [C-return]       'compile)
(global-set-key [f1]             'undo)
(global-set-key [f2]             'buffer-menu)
(global-set-key [f3]             'kill-this-buffer)
(global-set-key [f4]             'goto-line)
(global-set-key [f5]             'indent-region)
; (global-set-key [f6]             'font-lock-fontify-buffer)
(global-set-key [f7]             'fill-region)
(global-set-key [f8]             'replace-string)
(global-set-key [f9]             'copy-rectangle-to-register)
(global-set-key [f10]            'other-window)
(global-set-key [f11]            'other-window)
(global-set-key [f12]            'buffer-menu)
;(global-set-key [f14]            'undo)
;(global-set-key [f16]            'copy-region-as-kill)
;(global-set-key [f18]            'yank)
;(global-set-key [f20]            'kill-region)
(global-set-key [M-down-mouse-1] 'pasting-mouse-drag-secondary)
(global-set-key [M-S-down-mouse-1] 'moving-mouse-drag-secondary)
(global-set-key [down-mouse-2] 'mouse-drag-drag)
(global-set-key [M-return]       'shell)
(global-set-key [C-right]        'forward-word)
(global-set-key [C-left]         'backward-word)
(global-set-key [C-up]           'backward-paragraph)
(global-set-key [C-down]         'forward-paragraph)
(global-set-key [home]            'beginning-of-buffer)
(global-set-key [end]             'end-of-buffer)

;(defun get-display () "get current display" 

;(defun workman-next-track () "goto next track"
;  (interactive)  
;  (shell-command "rsh jds 'workman -s forward'"))
;(defun workman-prev-track () "goto previous track"
;  (interactive)
;  (shell-command "rsh jds 'workman -s back'"))
;(defun workman-play () "play cd"
;  (interactive)
;  (shell-command "rsh jds 'workman -s play'"))
;(defun workman-stop () "stop cd"
;  (interactive)
;  (shell-command "rsh jds 'workman -s stop'"))
;(defun workman-pause () "pause cd"
;  (interactive)
;  (shell-command "rsh jds 'workman -s pause'"))
;(defun workman-eject () "eject cd"
;  (interactive)
;  (shell-command "rsh jds 'workman -s eject'"))

;(global-set-key [C-f19] 'workman-prev-track)
;(global-set-key [C-f20] 'workman-next-track)
;(global-set-key [f16] 'workman-play)
;(global-set-key [f19] 'workman-stop)
;(global-set-key [f20] 'workman-pause)
;(global-set-key [f18] 'workman-eject)
(setq
 x-fixed-font-alist
 '("Font Menu"
   ("Misc"
    ("6x12" "-misc-fixed-medium-r-semicondensed--12-110-75-75-c-60-*-1")
    ("6x13" "-misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-*-1")
    ("7x13" "-misc-fixed-medium-r-normal--13-120-75-75-c-70-*-1")
    ("7x14" "-misc-fixed-medium-r-normal--14-130-75-75-c-70-*-1")
    ("9x15" "-misc-fixed-medium-r-normal--15-140-*-*-c-*-*-1")
    ("")
    ("clean 8x8" "-schumacher-clean-medium-r-normal--*-80-*-*-c-*-*-1")
    ("clean 8x14" "-schumacher-clean-medium-r-normal--*-140-*-*-c-*-*-1")
    ("clean 8x10" "-schumacher-clean-medium-r-normal--*-100-*-*-c-*-*-1")
    ("clean 8x16" "-schumacher-clean-medium-r-normal--*-160-*-*-c-*-*-1")
    ("")
    ("sony 8x16" "-sony-fixed-medium-r-normal--16-120-100-100-c-80-*-1")
    ("")
    ("-- Courier --")
    ("Courier 10" "-adobe-courier-medium-r-normal--*-100-*-*-m-*-*-1")
    ("Courier 12" "-adobe-courier-medium-r-normal--*-120-*-*-m-*-*-1")
    ("Courier 14" "-adobe-courier-medium-r-normal--*-140-*-*-m-*-*-1")
    ("Courier 18" "-adobe-courier-medium-r-normal--*-180-*-*-m-*-*-1")
    ("Courier 18-b" "-adobe-courier-bold-r-normal--*-180-*-*-m-*-*-1")
   )))
(add-hook 'c-mode-hook           'turn-on-font-lock  t)
;(add-hook 'c++-mode-hook         'turn-on-font-lock  t)
(add-hook 'lisp-mode-hook        'turn-on-font-lock  t)
(add-hook 'emacs-lisp-mode-hook  'turn-on-font-lock  t)
(add-hook 'matlab-mode-hook      'turn-on-font-lock  t) 
(add-hook 'html-mode-hook      'turn-on-font-lock  t)
(add-hook 'fortran-mode-hook     'turn-on-font-lock  t)
(add-hook 'info-mode-hook        'turn-on-font-lock)
(add-hook 'dired-mode-hook       'turn-on-font-lock  t)
(add-hook 'shell-mode-hook       'turn-on-font-lock  t)
(add-hook 'perl-mode-hook        'turn-on-font-lock  t)
(add-hook 'python-mode-hook      'turn-on-font-lock  t)
;;(add-hook 'font-lock-mode-hook   'turn-on-fast-lock  t)
(add-hook 'font-lock-mode-hook   'font-lock-after-fontify-buffer)

;; remove this setting - it is for using emacs through eXodus
(global-set-key [delete] 'backward-delete-char)
;; this setting should be replaced when using unix
;;(global-set-key [delete] "\C-d")

(display-time)

;; setup home directory to ~/ for optico otherwise gives /export/home/student/cochrane for a C-x C-f
;;(if (equal (system-name) "optico.phys.waikato.ac.nz") (setq abbreviated-home-dir "^/export/home/student/cochrane\\(/\\|$\\)"))
(if (equal (system-name) "lamb.physics.uq.edu.au") (setq abbreviated-home-dir "^/usr/users/cochrane\\(/\\|$\\)"))

(setq text-mode-hook 'turn-on-auto-fill)
(setq make-backup-files nil)

(transient-mark-mode t)
(delete-selection-mode t)
(setq c-auto-newline nil)
(setq c-toggle-auto-hungry-state 1)
(autoload 'matlab-mode "matlab-mode2" "Enter Matlab mode." t)
;;(autoload 'html32-mode "html32-mode" "Enter HTML mode" t)
(autoload 'python-mode "python-mode4.6.el" "Enter Python mode" t)
(autoload 'pov-mode "pov-mode.el" "PoVray scene file mode" t)
(autoload 'css-mode "css-mode")
(setq fortran-comment-region "c     ")
;;
;;
;;(require 'foldout)
;;(autoload 'c-outline "c-outline" nil t)
;;(add-hook 'c-mode-hook   'c-outline)
;;(add-hook 'c++-mode-hook 'c-outline)
;;
;; arrow  "acceleration"
;;(load "accel" t t)
;;(defun-accel-version accel-next-line
;;        next-line
;;	'((0 . 1) (1 . 2) (2 . 4) (4 . 8)))
;;(defun-accel-version accel-previous-line
;;        previous-line
;;	'((0 . 1) (1 . 2) (2 . 4) (4 . 8)))
;;(defun-accel-version accel-forward-char
;;        forward-char
;;	'((0 . 1) (1 . 2) (2 . 4) (4 . 8)))
;;(defun-accel-version accel-backward-char
;;        backward-char
;;	'((0 . 1) (1 . 2) (2 . 4) (4 . 8)))
;;
;;

;;
;;
(setq auto-mode-alist (mapcar 'purecopy
				'(("\\.text\\'" . text-mode)
				  ("\\.txt\\'" . text-mode)
				  ("snd+" . text-mode)
				  ("\\.c\\'" . c-mode)
				  ("\\.h\\'" . c++-mode)
				  ("\\.tex\\'" . latex-mode)
;				  ("\\.ltx\\'" . latex-mode)
				  ("\\.el\\'" . emacs-lisp-mode)
;			          ("\\.man\\'" . nroff-mode)
				  ("\\.lisp\\'" . lisp-mode)
				  ("\\.f\\'" . fortran-mode)
				  ("\\.f90\\'" . f90-mode)
				  ("\\.for\\'" . fortran-mode)
				  ("\\.FOR\\'" . fortran-mode)
				  ("\\.m$" . matlab-mode)
				  ("\\.pl\\'" . perl-mode)
				  ("\\.pm\\'" . perl-mode)
				  ("\\.pod\\'" . perl-mode)
				  ("\\.py\\'" . python-mode)
				  ("makefile" . makefile-mode)
				  ("Makefile" . makefile-mode)
				  ("\\.pov\\'" . pov-mode)
				  ;("\\.p\\'" . pascal-mode)
				  ;("\\.pas\\'" . pascal-mode)
				  ("\\.cc\\'" . c++-mode)
				  ("\\.hh\\'" . c++-mode)
				  ;("\\.C\\'" . c++-mode)
				  ;("\\.H\\'" . c++-mode)
				  ("\\.cpp\\'" . c++-mode)
				  ("\\.cxx\\'" . c++-mode)
				  ("\\.hxx\\'" . c++-mode)
				  ("\\.c\\+\\+\\'" . c++-mode)
				  ("\\.h\\+\\+\\'" . c++-mode)
;;; Less common extensions come here
;;; so more common ones above are found faster.
				  ;("\\.texinfo\\'" . texinfo-mode)
				  ;("\\.texi\\'" . texinfo-mode)
				  ;("\\.s\\'" . asm-mode)
				  ;("\\.[12345678]\\'" . nroff-mode)
				  ;("\\.TeX\\'" . tex-mode)
				  ("\\.sty\\'" . latex-mode)
				  ("\\.cls\\'" . latex-mode) ;LaTeX 2e class
				  ("\\.bbl\\'" . latex-mode)
				  ("\\.bib\\'" . bibtex-mode)
				  ;("\\.tcl\\'" . tcl-mode)
				  ("\\.lsp\\'" . lisp-mode)
				  ;("\\.awk\\'" . awk-mode)
				  ;("\\.tar\\'" . tar-mode)
				  ;("\\.y\\'" . c-mode)
				  ;("\\.lex\\'" . c-mode)
                                  ("\\.html$" . html-mode)
                                  ("\\.shtml$" . html-mode)
				  ("\\.part" . html-mode)
                                  ("\\.xmds" . sgml-mode)
				  ("\\.css" . css-mode)
				  ("configure.in" . m4-mode)
				  ("\\.m4" . m4-mode)
				  ("\\.java" . java-mode)
				  ("README" . text-mode)
				  ;; .emacs following a directory delimiter
				  ;; in either Unix or VMS syntax.
				  ("[]>:/]\\..*emacs\\'" . emacs-lisp-mode))))
;;
;;end of James' input
;;
;;
;(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
(defun my-matlab-mode-hook ()
;;    (setq matlab-function-indent t)	; if you want function bodies indented
     (setq fill-column 132)		; where auto-fill should wrap
     (turn-on-auto-fill))
(setq matlab-mode-hook 'my-matlab-mode-hook)
(setq matlab-comment-region-s "% ")
(defvar matlab-font-lock-extra-keywords
   '("\\<\\(rotate\\|plot3\\)+(" 1 font-lock-function-name-face append))

;;
;; NOTE: I haven't been able to load html mode as yet.  "File mode specification error"
;;(autoload 'html-mode "html-mode" "HTML major mode." t)
;;(or (assoc "\\.html$" auto-mode-alist)
;;   (setq auto-mode-alist (cons '("\\.html$" . html-mode) 
;;                               auto-mode-alist)))

;(add-hook 'matlab-mode-hook     (function (lambda() (local-set-key [C-return] 'matlab-run-file))))
(add-hook 'matlab-mode-hook     (function (lambda() (local-set-key [f6]       'matlab-comment-region))))
(add-hook 'matlab-mode-hook     (function (lambda() (local-set-key [C-return] 'matlab-shell-save-and-go))))


(add-hook 'c-mode-hook          (function (lambda() (local-set-key [C-return] 'compile))))
(add-hook 'c-mode-hook          (function (lambda() (local-set-key [f6]       'comment-region))))
(add-hook 'c-mode-hook 
      (function (lambda () (progn 
		    (make-local-variable 'compile-command)
		    (setq compile-command 
			  (concat 
			   "cd " (file-name-directory buffer-file-name) 
			   "; make -k -f makefile "))))))
(add-hook 'c++-mode-hook        (function (lambda() (local-set-key [C-return] 'compile))))
(add-hook 'c++-mode-hook        (function (lambda() (local-set-key [f6]       'comment-region))))
(add-hook 'c++-mode-hook 
      (function (lambda () (progn 
		    (make-local-variable 'compile-command)
		    (setq compile-command 
			  (concat 
			   "cd " (file-name-directory buffer-file-name) 
			   "; make -k -f makefile "))))))
(add-hook 'fortran-mode-hook    (function (lambda() (local-set-key [C-return] 'compile))))
(add-hook 'fortran-mode-hook    (function (lambda() (local-set-key [f6]       'fortran-comment-region))))
(add-hook 'fortran-mode-hook    (function (lambda() (local-set-key [return]       'fortran-indent-new-line))))
(add-hook 'fortran-mode-hook 
      (function (lambda () (progn 
		    (make-local-variable 'compile-command)
		    (setq compile-command 
			  (concat 
			   "cd " (file-name-directory buffer-file-name) 
			   "; make -k -f makefile "))))))
(add-hook 'f90-mode-hook    (function (lambda() (local-set-key [C-return] 'compile))))
(add-hook 'f90-mode-hook    (function (lambda() (local-set-key [f6]       'comment-region))))
(add-hook 'f90-mode-hook 
      (function (lambda () (progn 
		    (make-local-variable 'compile-command)
		    (setq compile-command 
			  (concat 
			   "cd " (file-name-directory buffer-file-name) 
			   "; make -k -f makefile "))))))
(add-hook 'emacs-lisp-mode-hook (function (lambda() (local-set-key [C-return] 'byte-compile-file))))
(add-hook 'emacs-lisp-mode-hook (function (lambda() (local-set-key [f6]       'comment-region))))

;;(add-hook 'html32-mode-hook (function (lambda() (local-set-key [f6] 'comment-region))))

(add-hook 'perl-mode-hook (function (lambda() (local-set-key [f6] 'comment-region))))

;; POV-Ray stuff

;; Where did you install the POV-mode?
(setq load-path (cons "/home/cochrane/emacs/" load-path))
;; Set autoloading of POV-mode for these file-types.
(autoload 'pov-mode "pov-mode.el" "PoVray scene file mode" t)
(setq auto-mode-alist
	(append '(("\\.pov$" . pov-mode) 
		  ("\\.inc$" . pov-mode)
                 ) auto-mode-alist))

;;Use this to turn on font-lock: 


(add-hook 'pov-mode-hook 'turn-on-font-lock)

;;These variables can be set in your .emacs (defaults given): 

(setq pov-indent-level '2)
(setq pov-autoindent-endblocks t)   ;; Automatically reindents else/end/break
(setq pov-indent-under-declare '2)  ;; Try it!  Tell me if you like it...
(setq pov-fontify-insanely t)       ;; When it's non-nil, we fontify *every*
                                    ;; Povray keyword.  Careful!
(setq pov-home-dir "/usr/local/lib/povray31/")  ;;Where the pov-helpfile is 
                                    ;; located
(setq pov-help-file "povuser.txt")  ;; What the helpfile is called


(setq fast-lock-cache-directories '("/var/tmp")) ;; for Dec UNIX, use "/tmp" for SV
(setq inferior-lisp-program "/usr/bin/clisp")
;;
;;
;;(defun dv-find-double-word ()	"Find consecutive occurrences of same word."
;;  (interactive)
;;  (re-search-forward "\\(\\<\\w*\\>\\)[ \t\n]*\\1"))
;;(global-set-key [?\M-p] 'dv-find-double-word)

(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)

;; Prevent Emacs from extending file when pressing down arrow at end of buffer.
(setq next-line-add-newlines nil)

; Display full path in window title
(setq-default frame-title-format "%b")

; Gnus stuff
(setq user-mail-address "cochrane_nospam@physics.uq.edu.au")
(setq message-signature-file "~/.alt.sig")

;; Some macros
;;  to define a new macro use C-x ( <type key strokes> C-x )
;;  then 
;;     M-x name-last-kbd-macro
;;   
;;  type a name, say fred,  then position cursor when want definition 
;;  and type
;;     M-x insert-kdb-macro
;;  When this is done you can bind the name to a key, or invoke the
;;  macro by name by typing
;;     M-x fred (or what ever name you have given the macro)
;; These macros were copied from James' .emacs file from the Sparc 5
;; the 'figure and 'bullet macros are mine
;;

(setq ps-lpr-command "lpr")
(setq ps-lpr-switches (list "-Pps1"))

(setq tab-width 4)
(setq tex-dvi-print-command "dvips -Ppdf -G0")
(setq tex-dvi-view-command
 (if (eq window-system 'x) "/usr/local/bin/xdvi -bg white -expert -s 10 -mfmode ljfour:600 -geometry 500x705+0+0" "dvi2tty * | cat -s")
)
(setq tex-default-mode 'latex-mode)
(add-hook 'tex-mode-hook         'turn-on-font-lock  t)
(add-hook 'tex-mode-hook        (function (lambda() (local-set-key [C-return] 'tex-file))))
(add-hook 'tex-mode-hook        (function (lambda() (local-set-key [f6]       'comment-region))))
(add-hook 'bibtex-mode-hook      'turn-on-font-lock  t)
(add-hook 'latex-mode-hook     (function (lambda() (local-set-key [C-c r] 'reftex-query-replace-document))))
;; turns on a referencing system for LaTeX documents
(add-hook 'tex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'python-mode-hook (function (lambda() (local-set-key [C-return] 'py-execute-buffer))))
(add-hook 'python-mode-hook (function (lambda() (local-set-key [f6] 'comment-region))))
(setq py-python-command "python2")

(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

(fset 'mathmode
   [?$ ?$ ?  left left])

(defun insert-equation () "insert equation formalism in latex"
(interactive)
(insert-string "\\begin{equation}\n
\\end{equation}")
(backward-line 1))

(defun insert-eqnarray () "insert eqnarray formalism in latex"
(interactive)
(insert-string "\\begin{eqnarray}\n
\\end{eqnarray}")
(backward-line 1))

(defun insert-align () "insert align formalism in latex (AMS-math)"
(interactive)
(insert-string "\\begin{align}\n
\\end{align}")
(backward-line 1))

(fset 'italic
   [?{ ?\\ ?i ?t ?  ?} ?  left left])

(defun insert-figure () "insert figure formalism in latex"
(interactive)
(insert-string "\\begin{figure}
\\centerline{\\epsfig{file=figs/, width=\\figwidth}}
\\caption{}
\\label{fig:}
\\end{figure}")
(backward-line 3)
(forward-char 25))

;; old version of insert-figure - used in my Masters thesis
;;(defun insert-figure () "insert figure formalism in latex"
;;(interactive)
;;(insert-string "\\begin{figure}
;;\\centerline{\\epsfxsize=90mm \\epsfbox{../figs/}}
;;\\caption{}
;;\\label{fig:}
;;\\end{figure}")
;;(backward-line 3)
;;(end-of-line)
;;(backward-char 2))

(fset 'bullet
   [return return ?\\ ?b ?u ?l ? ])

(fset 'noindent
   [?\\ ?\\  return down ?\\ ?n ?o ?i ?n ?d ?e ?n ?t])

(defun insert-table () "insert table formalism in latex"
(interactive)
  (insert-string
"\\begin{table}
\\begin{center}
\\begin{tabular}{|c|c|c|}
\\hline
\\multicolumn{1}{|c|}{} & \\multicolumn{1}{c|}{} & \\multicolumn{1}{c|}{} \\\\ \\hline
  &  &  \\\\
  &  &  \\\\
  &  &  \\\\ \\hline
\\end{tabular}
\\end{center}
\\caption{}
\\label{tab:}
\\end{table}")
(backward-line 8)
(forward-char 21))

(defun insert-letter () "insert letter formalism in latex"
(interactive)
  (insert-string 
   "\\input{../defs_letter}
\\begin{document}
\\address{Physics Department \\\\ 
University of Queensland \\\\ 
St. Lucia \\\\ 
Brisbane \\\\ 
Queensland 4072 \\\\ 
Australia}
\\signature{Paul Cochrane}
\\begin{letter}{}
\\opening{To whom it may concern,}\n\n\n
\\closing{Yours sincerely,}
\\end{letter}
\\end{document}")
(backward-line 7)
(forward-char 15))

(defun latex2html-file () "latex2html current file"
  (interactive)
  (setq fname (file-name-nondirectory buffer-file-name))
  (setq tex2html-out-command (concat "latex2html " fname))
  (set-buffer (process-buffer (get-process "tex-shell")))
  (insert-string tex2html-out-command)
  (comint-send-input))

(defun insert-slide () "insert slide formalism in latex"
  (interactive)
  (insert-string
   "% slide 
\\begin{slide}



\\end{slide}

"
))

(defun insert-slide-template () "insert slide template formalism in latex"
  (interactive)
  (setq slide-front-string "\\input{../defs_slides}
\\begin{document}

")
  (setq slide-end-string "\\end{document}")
  (setq slide-middle-string "
\\begin{slide}



\\end{slide}

")
(setq talk-time (read-from-minibuffer "how long is the talk (min)? "))
(setq num-slides (/ (string-to-number talk-time) 2))
(setq slide-string slide-front-string)
(setq incr 0)
(while (< incr num-slides)
  (setq slide-string (concat slide-string "% slide " (number-to-string (+ incr 1))))
  (setq slide-string (concat slide-string slide-middle-string))
  (setq incr (+ incr 1))
  )
(setq slide-string (concat slide-string slide-end-string))
(insert-string slide-string))

(defun insert-paper-template () "insert revtex paper template formalism in latex"
(interactive)
(insert-string "%\\documentclass[pra,aps,tightenlines,twocolumn]{revtex4}
\\documentclass[pra,aps,preprint]{revtex4}

% \\usepackage{showkeys}
% \\oddsidemargin 5 mm % for use with showkeys only!!
% \\textwidth 140 mm % for use with showkeys only!!

\\usepackage{epsfig}

\\bibliographystyle{prsty}
\\newcommand {\\bra}[2] {\\mbox{}_{#2}\\langle #1 |}
\\newcommand {\\ket}[2] {| #1 \\rangle_{#2}}
\\newcommand {\\eqn}[1] {Eq.~(\\ref{#1})}
\\newcommand {\\half} {\\frac{1}{2}}
\\newcommand {\\fig}[1] {Figure~\\ref{#1}}
\\newcommand {\\figwidth} {60mm}

\\begin{document}

\\title{}

\\author{P. T. Cochrane}
\\email{cochrane@physics.uq.edu.au}
\\homepage{http://www.physics.uq.edu.au/people/cochrane/homepage/index.html}

\\affiliation{Centre for Laser Science, Physics Department, University 
of Queensland, St. Lucia, Brisbane, Queensland 4072, Australia}

\\date{\\today}

\\begin{abstract}
\\end{abstract}

\\pacs{}

\\maketitle

\\section{}


\\subsection{}


\\subsubsection{}

\\begin{acknowledgements}
PTC acknowledges the financial support of the Centre for Laser Science 
and the University of Queensland Postgraduate Research Scholarship.
\\end{acknowledgements}

\\bibliography{/home/cochrane/tex/bibase}

\\end{document}"))


(defun insert-chapter () "insert thesis chapter template formalism in latex"
(interactive)
(insert-string "\\input{/home/cochrane/tex/defs_thesis}
\\begin{document}

\\chapter{}

\\section{}

\\subsubsection{}

\\bibliography{/home/cochrane/tex/bibase.bib}

\\end{document}"))

(defun insert-picture () "insert picture template formalism in latex"
(interactive)
(insert-string "
% have \\setlength{\\unitlength}{1cm} in preamble
\\begin{picture}(,)
\\put(,){\\epsfxsize=cm
\\epsffile{.eps}}
\\end{picture}
"))

(defun insert-article-plain () "insert article formalism without defs_all added"
(interactive)
(insert-string "\\documentclass[12pt,a4paper]{article}
\\begin{document}



\\end{document}
"))

(defun insert-report-plain () "insert report formalism without defs_all added"
(interactive)
(insert-string "\\documentclass[12pt,a4paper]{report}
\\begin{document}



\\end{document}
"))

(defun insert-article () "insert article formalism"
(interactive)
(insert-string "\\input{../defs_article}
\\begin{document}



\\end{document}
"))

(defun insert-report () "insert report formalism"
(interactive)
(insert-string "\\input{../defs_report}
\\begin{document}



\\end{document}
"))

(defun insert-listing () "insert lstlisting formalism"
(interactive)
(insert-string "\\begin{latexonly}
\\begin{lstlisting}[style=myhtml,numbers=left]{}

\\end{lstlisting}
\\end{latexonly}
%
\\begin{htmlonly}
\\begin{verbatim}

\\end{verbatim}
\\end{htmlonly}"))


(add-hook 'tex-mode-hook (function (lambda () (local-set-key [insert]      'mathmode))))
(add-hook 'tex-mode-hook (function (lambda () (local-set-key [S-insert]    'italic))))
(add-hook 'tex-mode-hook (function (lambda () (local-set-key [C-delete]    'bullet))))
(add-hook 'tex-mode-hook (function (lambda () (local-set-key [C-f8]        'ispell-buffer))))
(add-hook 'tex-mode-hook (function (lambda () (local-set-key [f7]          'insert-equation))))
(add-hook 'tex-mode-hook (function (lambda () (local-set-key [f9]          'insert-figure))))
(add-hook 'tex-mode-hook (function (lambda () (local-set-key [f8]          'insert-align))))
;(add-hook 'tex-mode-hook (function (lambda () (local-set-key [C-f7]        'insert-table))))
;(add-hook 'tex-mode-hook (function (lambda () (local-set-key [f7]          'noindent))))
;(add-hook 'tex-mode-hook 'latex2html-file)

; for new terminals, which have new version of emacs and latex-mode, need to set this variable so that
; don't get nonstopmode added as option to latex
(setq tex-start-options-string "")

(defun run-tetris () "start a game of tetris"
  (interactive)
  (load-file "/home/cochrane/emacs/tetris17.el")
  (tetris))

(defun run-snake () "start a game of snake"
  (interactive)
  (load-file "/home/cochrane/emacs/snake.el")
  (snake))

(setq vc-default-back-end 'CVS)

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )
