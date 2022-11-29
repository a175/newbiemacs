;; packages here

(unless (package-installed-p 'undo-tree) (package-install 'undo-tree))
(unless (package-installed-p 'company) (package-install 'company))
(unless (package-installed-p 'spaceline) (package-install 'spaceline))
(unless (package-installed-p 'org-bullets) (package-install 'org-bullets))
(unless (package-installed-p 'auctex-latexmk) (package-install 'auctex-latexmk))
(unless (package-installed-p 'evil-surround) (package-install 'evil-surround))
(unless (package-installed-p 'winum) (package-install 'winum))
(unless (package-installed-p 'evil-nerd-commenter) (package-install 'evil-nerd-commenter))
(unless (package-installed-p 'anzu) (package-install 'anzu))
(unless (package-installed-p 'helm-bibtex) (package-install 'helm-bibtex))
(unless (package-installed-p 'rainbow-delimiters) (package-install 'rainbow-delimiters))
(unless (package-installed-p 'smartparens) (package-install 'smartparens))
(unless (package-installed-p 'evil-org) (package-install 'evil-org))
(unless (package-installed-p 'yasnippet) (package-install 'yasnippet))
(unless (package-installed-p 'valign) (package-install 'valign))
(unless (package-installed-p 'beacon) (package-install 'beacon))
(unless (package-installed-p 'which-key) (package-install 'which-key))
(unless (package-installed-p 'avy) (package-install 'avy))
(unless (package-installed-p 'org-projectile-helm) (package-install 'org-projectile-helm))
(unless (package-installed-p 'helm-org-rifle) (package-install 'helm-org-rifle))
(unless (package-installed-p 'helm-org) (package-install 'helm-org))
(unless (package-installed-p 'org-projectile) (package-install 'org-projectile))
(unless (package-installed-p 'auctex) (package-install 'auctex))
(unless (package-installed-p 'openwith) (package-install 'openwith))
(unless (package-installed-p 'org-roam-ui) (package-install 'org-roam-ui))
(unless (package-installed-p 'org-roam) (package-install 'org-roam))
(unless (package-installed-p 'evil) (package-install 'evil))
(unless (package-installed-p 'helm) (package-install 'helm))
(unless (package-installed-p 'helm-projectile) (package-install 'helm-projectile))
(unless (package-installed-p 'spacemacs-theme) (package-install 'spacemacs-theme))


;; If ~/nbm-root/nbm-home.txt does not exist,
;; create a new newbiemacs folder under the home folder.
;; The newbiemacs folder may be moved to a different place later.
(unless (file-exists-p (concat (getenv "HOME") "/nbm-root/nbm-home.txt"))
  (find-file (concat (getenv "HOME") "/nbm-root/nbm-home.txt"))
  (insert (concat (getenv "HOME") "/newbiemacs/"))
  (save-buffer) (kill-buffer)
  (copy-directory (concat (getenv "HOME") "/nbm-root/newbiemacs/")
		  (concat (getenv "HOME") "/"))
  )

(defvar *nbm-home* (with-temp-buffer (insert-file-contents "~/nbm-root/nbm-home.txt")
					 (beginning-of-buffer) (end-of-line)
					 (buffer-substring (point-min) (point))))

(org-babel-load-file (concat (getenv "HOME") "/nbm-root/nbm-system/nbm_config.org"))

(if (file-exists-p (concat *nbm-home* "nbm-user-settings/my_config.org"))
    (org-babel-load-file (concat *nbm-home* "nbm-user-settings/my_config.org")))
