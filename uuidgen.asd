(defsystem #:uuidgen
  :components ((:file "uuidgen"))
  :depends-on (#:iup
	       #:iup-imglib
	       #:uuid)
  :entry-point "UUIDGEN::MAIN")
