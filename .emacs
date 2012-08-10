
;; 
;; 我的emacs配置文件，经过千锤百炼呀！
;; 


(setq mypath-home
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
    (set-default-font "DejaVu Sans Mono-12") ;; Linux下的默认字体

    ;; 设置中文字体
    (if window-system
	(progn
	    ;(set-fontset-font (frame-parameter nil 'font)  'han '("WenQuanYi Bitmap Song" . "unicode-bmp"))
	    ;(set-fontset-font (frame-parameter nil 'font)  'han '("WenQuanYi ZenHei" . "unicode-bmp"))
	    ;(set-fontset-font (frame-parameter nil 'font)  'han '("WenQuanYi Unibit" . "unicode-bmp"))

          ;(set-fontset-font (frame-parameter nil 'font)  'han '("DejaVu Sans Mono-15" . "unicode-bmp"))
          ;(set-fontset-font (frame-parameter nil 'font)  'unicode '("DejaVu Sans Mono-15" . "unicode-bmp"))
          

	    ;;(set-fontset-font (frame-parameter nil 'font) 'unicode '("Microsoft YaHei" . "unicode-bmp"))
	    (set-fontset-font (frame-parameter nil 'font) 'han '("Microsoft YaHei" . "unicode-bmp"))
	      (set-fontset-font (frame-parameter nil 'font) 'symbol '("Microsoft YaHei" . "unicode-bmp"))
	        (set-fontset-font (frame-parameter nil 'font) 'cjk-misc '("Microsoft YaHei" . "unicode-bmp"))
		  ))
    )
  )

;; 窗口界面下的配置
(if window-system
    (progn
      (scroll-bar-mode nil)             ;; 不要scroll bar
      (tool-bar-mode nil)               ;; 去掉工具栏
      (setq x-select-enable-clipboard t) ;; 与系统剪贴版互通
      ))

(menu-bar-mode nil) ;; 去掉菜单栏

;; croll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
;; (setq scroll-step 1
;;       scroll-margin 3
;;       scroll-conservatively 10000)

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 把缺省的 major mode 设置为 text-mode
;; (setq default-major-mode 'text-mode)

;隐藏口令字
(add-hook 'comint-output-filter-functions
	    'comint-watch-for-password-prompt )

(column-number-mode t)                  ;; 显示列号
(setq-default indent-tabs-mode nil)     ;; 用空格替换tab
(setq mark-diary-entries-in-calendar t) ;; 标记有日记的日期

;; 一定时间不操作时，让Emacs玩一下
;(require 'zone)
;(zone-when-idle 600)
;(zone-leave-me-alone)

;; C-x C-b 缺省的绑定很不好用，改成一个比较方便的 electric-buffer-list，执行
;; 之后：
;;     光标自动转到 Buffer List buffer 中；
;;     n, p   上下移动选择 buffer；
;;     S      保存改动的 buffer；
;;     D      删除 buffer。
;; 除此之外，不错的选择还有 ibuffer，不妨试试 M-x ibuffer。
(global-set-key "\C-x\C-b" 'electric-buffer-list)

(setq require-final-newline t) ;; 存盘的时候，要求最后一个字符时换行符。
(setq kill-ring-max 5120) ;; 存盘的时候，要求最后一个字符时换行符。
(setq bookmark-save-flag 1) ;; 每当设置书签的时候都保存书签文件，否则只
                            ;; 在你退出 Emacs 时保存。

;; 在 mode-line 上显示时间。
(setq display-time-format "%Y年%m月%d日 %A %H:%M:%S")
;(setq display-time-format "%Y年%m月%d日 %A")
;(setq display-time-format "%c")
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 60)
(display-time-mode 1)

(ansi-color-for-comint-mode-on) ;; 支持ansi颜色

;; 光标靠近鼠标指针时，让鼠标指针自动让开
;(mouse-avoidance-mode 'animate)

;; Remote file editing via ssh
;; C-x C-f /user@your.host.com:/path/to/file
(require 'tramp)
(setq tramp-default-method "ssh")

;(setq c-basic-offset 4)

;; 颜色设置
(setq frame-background-mode 'dark)
(set-background-color   "black")
(set-foreground-color   "gray90")
(set-cursor-color   "yellow")

;; 颜色配置2 - 据说是保护色
;; ;(setq frame-background-mode 'light)
;; (set-background-color   "#AFCD85")
;; (set-foreground-color   "black")
;; ;(set-cursor-color   "darkgreen")
;; ;(set-cursor-color   "seagreen")
;; (set-cursor-color   "forestgreen")

;; 高亮光标所在行设置
(require 'hl-line)
(global-hl-line-mode t)

;; c-set-style
(add-hook 'c-mode-hook
	    '(lambda ()
	            (c-set-style "linux")
             (setq-default indent-tabs-mode nil)))

;; c++-set-style
(add-hook 'c++-mode-hook
	    '(lambda ()
	            (c-set-style "linux")
             (setq-default indent-tabs-mode nil)))

;; color theme
;(load-file (concat mypath-emacs.d "/plugins/color-theme.el"))
;(require 'color-theme)
;(color-theme-gnome2)

;; 使用颜色主题
;(require 'color-theme)
;(if window-system
;    (if (< (caddr (decode-time (current-time))) 18)
;        (color-theme-arjen)             ;白天光线好用黑色系的主题
;      (color-theme-deep-blue))          ;晚上光线差用深蓝系的主题
;  )

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

;; 试一下新的扩展功能，类似M-/
(global-set-key "\M- " 'hippie-expand)


;; 关联hs-minor模式
(add-hook 'hs-minor-mode-hook 'my-hs-minor-mode-map-setup t)

;; 将hs-minor模式与其它主要模式关联起来
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
;; \todo 这个如何关联？
;(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;; Orgtbl minor mode
;(add-hook 'mail-mode-hook 'turn-on-orgtbl)

;; 
;; Org-mode
;; 

;; The following lines are always needed.  Choose your own keys.
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; 添加后缀关联（好像默认就有）
(global-set-key "\C-cl" 'org-store-link) ; 全局快捷键设置
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; You can insert and follow links that have Org syntax not only in Org,
;; but in any Emacs buffer.  For this, you should create two global
;; commands, like this (please select suitable global keys yourself):
;; 详见：[[info:org:Using links outside Org]]
(global-set-key "\C-cL" 'org-insert-link-global)
(global-set-key "\C-co" 'org-open-at-point-global)

;; 为配合Org-Mode，使font-lock-mode激活
(global-font-lock-mode 1)                     ; for all buffers
;(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only

(transient-mark-mode 1) ; 最好也使选中区域可见，因为要经常在选中区域上操作
(setq org-log-done t)   ; 标记TODO项的完成时间
(setq org-hide-leading-stars t); only show one *
(setq org-startup-folded 'content); Best default for small files with tables: overview content showall

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "DELEGATE(g)" "|" "DONE(d)")
        (sequence "BUG(b)" "REPORT(r)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))

;; 自定义日程视图
(setq org-agenda-custom-commands
      '(("w" "工作"
         ((agenda "")
          (tags-todo "工作")))
        ("h" "家庭"
         ((agenda "")
          (tags-todo "学习")))
        ))

;; Org-Remember设置
;;
;; 来自[[info:org:Setting up Remember]]
(org-remember-insinuate)
(define-key global-map "\C-cr" 'org-remember)

;; todo模式
;;
;; emacs的todo模式可以用来做日程安排，它用三个文件do、done、top分别记录
;; 要做的事情、已完成的事情和优先要做的事情。
;在.emacs中设置下面三个文件：
;(setq todo-file-do (concat mypath-emacs.d "/todo.do"))
;(setq todo-file-done (concat mypath-emacs.d "/todo.done"))
;(setq todo-file-top (concat mypath-emacs.d "/todo.top"))
;;
;; 在do文件中每件事情分别属于一个 category ，加入事情的时候会让你选择属于那个category，如果没有合适的category，可以用 todo-add-category 命令新建一个category；category中的事情按重要性排列，最重要的事情放在最上面，加入事情的时候会有提示；top文件只显示do文件中的每个category的第一件事情。
;
;　　对do文件，常用的命令如下：
					;i加入一件事情
					;e编辑一件事情
					;k删除一件事情，不加入done文件
					;d/f删除完成的事情，加入done文件，同时可以加入评论
					;+/-在不同category之间切换
					;j跳转到某个category
;

;;启动LaTeX设置
;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)

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

;; M-x customize 功能保存设置的文件。默认的是 Emacs 的初始化文件 .emacs。
;(setq custom-file (concat mypath-emacs.d "/emacs_custom.el"))

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
;(server-force-delete)
;(server-start)



;; CEDET
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu
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

;(setq tab-width 8)
;; indent-tabs-mode t
;; c-basic-offset 8) 


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

