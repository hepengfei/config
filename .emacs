
;; 
;; 我的emacs配置文件，经过千锤百炼呀！
;; 


;; 
;; 显示设置
;; 

(scroll-bar-mode -1)               ; 不要scroll bar
(tool-bar-mode -1)                 ; 去掉工具栏
(column-number-mode t)             ; 显示列号
(menu-bar-mode -1)                 ; 去掉菜单栏
(ansi-color-for-comint-mode-on)    ; 支持ansi颜色
;;(global-linum-mode t)              ; 打开全局显示行号，开关:linum-mode

;; 颜色设置
(setq frame-background-mode 'dark)
(set-background-color   "black")
(set-border-color   "black")
;;(set-foreground-color   "gray90")
(set-foreground-color "Wheat")
(set-cursor-color   "yellow")

;; 颜色配置2 - 据说是保护色
;; ;; (setq frame-background-mode 'light)
;; (set-background-color   "#AFCD85")
;; (set-foreground-color   "black")
;; ;; (set-cursor-color   "darkgreen")
;; ;; (set-cursor-color   "seagreen")
;; (set-cursor-color   "forestgreen")

;; 高亮光标所在行设置
(require 'hl-line)
(global-hl-line-mode t)

(global-font-lock-mode 1)               ; 打开语法高亮
(transient-mark-mode 1)                 ; 使选中区域可见


;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 显示时间。
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 1)
(setq display-time-format "%m月%d日 %a %H:%M")
(display-time-mode 1)

(setq inhibit-startup-screen t)        ;去掉启动欢迎界面


(setq-default tab-width 4)             ; 设置tab宽度
(setq-default indent-tabs-mode nil)    ; 用空格替换tab
(setq mark-diary-entries-in-calendar t); 标记有日记的日期


;; 
;; 操作设置
;; 

(setq x-select-enable-clipboard t) ; 与系统剪贴版互通

;; C-x C-b 缺省的绑定很不好用，改成一个比较方便的 electric-buffer-list，执行
;; 之后：
;;     光标自动转到 Buffer List buffer 中；
;;     n, p   上下移动选择 buffer；
;;     S      保存改动的 buffer；
;;     D      删除 buffer。
(global-set-key "\C-x\C-b" 'electric-buffer-list)


(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt) ;隐藏口令字

(setq require-final-newline t) ; 存盘的时候，要求最后一个字符时换行符。
(setq bookmark-save-flag 1) ; 设置书签时及时保存到文件

;; 试一下新的扩展功能M+<space>，功能类似M-/
(global-set-key "\M- " 'hippie-expand)

;; 
;; 重定义hs-minor-mode的keybinding
;; hs-minor-mode的缺省键盘定义太复杂了。C-c @ 要来回换半天。
;; 下面的代码把它换成了'C-c h/s/M-h/M-s/l/c'
;;
;; 经长期使用，下面的设置比较适合我。
;; 
(defun my-hs-minor-mode-map-setup ()
  "为hs-minor-mode设置自己的绑定键"
  (define-key hs-minor-mode-map [?\C-c ?h] 'hs-hide-block)    ; C-c h
  (define-key hs-minor-mode-map [?\C-c ?s] 'hs-show-block)    ; C-c s
  (define-key hs-minor-mode-map [?\C-c ?\M-h] 'hs-hide-all)   ; C-c M-h
  (define-key hs-minor-mode-map [?\C-c ?\M-s] 'hs-show-all)   ; C-c M-s
  (define-key hs-minor-mode-map [?\C-c ?H] 'hs-hide-all)      ; C-c H
  (define-key hs-minor-mode-map [?\C-c ?S] 'hs-show-all)      ; C-c S
  (define-key hs-minor-mode-map [?\C-c ?l] 'hs-hide-level)    ; C-c l
  (define-key hs-minor-mode-map [?\C-c ?t] 'hs-toggle-hiding) ; C-c t
  )

;; 关联hs-minor模式
(add-hook 'hs-minor-mode-hook 'my-hs-minor-mode-map-setup t)

;; 将hs-minor模式与其它主要模式关联起来
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)


;; 把缺省的 major mode 设置为 text-mode
;; (setq default-major-mode 'text-mode)

;; croll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
;; (setq scroll-step 1
;;       scroll-margin 3
;;       scroll-conservatively 10000)



(defvar mypath-home
  (if (string= system-type "windows-nt")
      "H:"
    "~"))

;; setup mypath-personal
(setq mypath-personal (concat mypath-home "/personal"))

;; 
;; 字体设置
;; 
;; (set-default-font "fontset-mymono")
;; (setq default-frame-alist (append '((font . "fontset-mymono")) default-frame-alist))


(if (string= system-type "windows-nt")
    
    ;; windows下的配置
    (progn
      (set-default-font "Consolas-11")
      ;; (set-default-font "Lucida Sans Typewriter-11")
      ;; (set-default-font "Lucida Console-11")
      )

  ;; gnu/linux下的配置
  (progn
    (set-default-font "DejaVu Sans Mono-12") ; Linux下的默认字体

    ;; 设置中文字体
    (if window-system
        (progn
          ;;(set-fontset-font (frame-parameter nil 'font)  'han '("WenQuanYi Bitmap Song" . "unicode-bmp"))
          ;;(set-fontset-font (frame-parameter nil 'font)  'han '("WenQuanYi ZenHei" . "unicode-bmp"))
          ;;(set-fontset-font (frame-parameter nil 'font)  'han '("WenQuanYi Unibit" . "unicode-bmp"))

          ;;(set-fontset-font (frame-parameter nil 'font)  'han '("DejaVu Sans Mono-15" . "unicode-bmp"))
          ;;(set-fontset-font (frame-parameter nil 'font)  'unicode '("DejaVu Sans Mono-15" . "unicode-bmp"))
          

          ;;(set-fontset-font (frame-parameter nil 'font) 'unicode '("Microsoft YaHei" . "unicode-bmp"))
          (set-fontset-font (frame-parameter nil 'font) 'han '("Microsoft YaHei" . "unicode-bmp"))
          (set-fontset-font (frame-parameter nil 'font) 'symbol '("Microsoft YaHei" . "unicode-bmp"))
          (set-fontset-font (frame-parameter nil 'font) 'cjk-misc '("Microsoft YaHei" . "unicode-bmp"))
          ))
    )
  )




;; c-set-style
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "linux")
             (setq-default c-basic-offset 4)    ;更改style中的tab宽度为4
             ))

;; c++-set-style
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "linux")
             (setq-default c-basic-offset 4)    ;更改style中的tab宽度为4
             ))


;; 
;; Org-mode
;; 

;; The following lines are always needed.  Choose your own keys.
;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; 添加后缀关联（好像默认就有）
(global-set-key "\C-cl" 'org-store-link) ; 全局快捷键设置
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; You can insert and follow links that have Org syntax not only in Org,
;; but in any Emacs buffer.  For this, you should create two global
;; commands, like this (please select suitable global keys yourself):
;; 详见：[[info:org:Using links outside Org]]
(global-set-key "\C-cL" 'org-insert-link-global)
(global-set-key "\C-co" 'org-open-at-point-global)


(setq org-log-done t)   ; 标记TODO项的完成时间
(setq org-hide-leading-stars t); only show one *
(setq org-startup-folded 'content); Best default for small files with tables: overview content showall

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "DELEGATE(g)" "|" "DONE(d)")
        (sequence "BUG(b)" "REPORT(r)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))


;; Org-Remember设置
;;
;; 来自[[info:org:Setting up Remember]]
(org-remember-insinuate)
(define-key global-map "\C-cr" 'org-remember)


;;启动LaTeX设置
;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

;; 
;; PERSONAL and PRIVATE configuration
;; 

;; name and email
(setq user-full-name "He Pengfei")
(setq user-mail-address "hepengfei@xunlei.com")

;; 默认的日记文件
(setq diary-file (concat mypath-personal "/diary"))

;; org文件设置
(setq org-directory (concat mypath-personal "/org"))
(setq org-agenda-files (list (concat org-directory "/hepengfei.org")))

(setq org-default-notes-file (concat org-directory "/notes.org"))


;; 缺省书签文件的路径及文件名。
(setq bookmark-default-file (concat mypath-personal "/bookmarks"))

;; 缺省的定义缩写的文件。
(setq abbrev-file-name (concat mypath-personal "/abbrevs"))

;; email configuration

;; using smtpmail
;; [[info:smtpmail:Emacs Speaks SMTP]]

;; If you use the default mail user agent.
(setq send-mail-function 'smtpmail-send-it)
;; If you use Message or Gnus.
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "mail.xxx.com")
;;(setq smtpmail-smtp-service 25)         ;587
(setq smtpmail-auth-credentials
      '(("mail.xxx.com" 25 "<username>" nil)))

;; ;; Use STARTTLS without authentication against the server.
;; (setq smtpmail-starttls-credentials
;;       '(("HOSTNAME" "PORT" nil nil)))


;; emacs server
;;(server-force-delete)
;;(server-start)



;; CEDET
;;(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)


;; ;(add-to-list 'load-path (concat mypath-emacs.d "/plugins/ecb"))
;; (add-to-list 'load-path "H:/Program Files/ecb-snap")
;; (load-file "H:/Program Files/ecb-snap/ecb.el")
;; (require 'ecb)
;; (require 'ecb-autoloads)


;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(ecb-options-version "2.40")
;;  '(inhibit-startup-screen f))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )

;; ;; 启动时不显示tip
;; (setq ecb-tip-of-the-day nil) 


;; TAB and RET auto align and indent
(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)))
(add-hook 'c-mode-common-hook
          (function (lambda ()
                      (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
                      (define-key c-mode-base-map [(control m)] 'align-newline-and-indent)
                      (c-toggle-auto-state))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8
;; End:

