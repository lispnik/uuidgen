(defpackage #:uuidgen
  (:use #:common-lisp))

(in-package #:uuidgen)

(defun main ()
  (iup:with-iup ()
    (iup-imglib:open)
    (let* ((text (iup:text :expand :horizontal
			   :readonly "yes"
			   :fontface "Courier"
			   :fontsize "14"
			   :visiblecolumns 36))
	   (copy-button (iup:button :image "IUP_EditCopy"
				    :action (lambda (handle)
					      (declare (ignore handle))
					      (setf (iup:attribute text :clipboard) "COPY")
					      iup:+default+)))
	   (hbox (iup:hbox (list text copy-button)
			   :gap 10))
	   (generate-button (iup:button :title "Generate"
					 :action (lambda (handle)
						   (declare (ignore handle))
						   (setf (iup:attribute text :value) (uuid:make-v4-uuid)
							 (iup:attribute text :selection) "ALL")
						   iup:+default+)))
	   (vbox (iup:vbox (list hbox generate-button)
			   :alignment :acenter
			   :gap 5
			   :margin "10x10"))
	   (dialog (iup:dialog vbox :title "UUID v4 Generator")))
      (iup:show dialog)
      (iup:main-loop))))
