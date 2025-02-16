(require 'org-ref-arxiv)

(defun nbm-arxiv-download-pdf (url)
  "Download the pdf file for the paper in the URL of an arXiv abstract page."
  (let (id pdf)
    (setq id (biblio-arxiv--extract-id url))
    (setq pdf (biblio-arxiv--pdf-url id))
    (url-copy-file pdf (format "%s/%s.pdf" *nbm-downloads* id) t)))

(defun nbm-arxiv-get-bibtex (url)
  "Get the bibtex file from url."
  (let (id)
    (setq id (biblio-arxiv--extract-id url))
    (arxiv-get-bibtex-entry-via-arxiv-api id)))

(defun nbm-arxiv-add-pdf-bibtex ()
  "Download a pdf and add a bibtex item for an arxiv paper.
The URL of an arxiv abstract page must be copied or
(on MacOS only) the current browser must be visiting an arxiv abstract page."
  (interactive)
  (let (id pdf url)
    (if (equal system-type 'darwin)
	(with-temp-buffer
	  (nbm-org-mac-insert-webpage)
	  (beginning-of-buffer)
	  (search-forward "]")
	  (setq url (buffer-substring 3 (1- (point)))))
      (setq url (current-kill 0)))
    (if (string-match "arXiv" url)
	(progn
	  (setq id (biblio-arxiv--extract-id url))
	  (setq pdf (biblio-arxiv--pdf-url id))
	  (url-copy-file pdf (format "%s/%s.pdf" *nbm-downloads* id))
	  (nbm-arxiv-download-pdf url)
	  (kill-new (nbm-arxiv-get-bibtex url))
	  (nbm-move-pdf-from-downloads))
      (message "You must copy the URL of an arXiv abstract page first!"))))
