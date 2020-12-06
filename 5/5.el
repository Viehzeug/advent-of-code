(require 'seq)
(require 'cl-lib)

;;from http://ergoemacs.org/emacs/elisp_read_file_content.htmly
(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun read-bin(str zero one)
  (string-to-number
   (concat
    (mapcar (lambda(x) (cond ((member x one) ?1)
                        ((member x zero) ?0))  ) str))
   2))

(defun get-id (line) (read-bin line '(?F ?L) '(?B ?R) ))





(print (seq-max (mapcar 'get-id (read-lines "in.txt"))))

(let
    ((ids (sort (mapcar 'get-id (read-lines "in.txt")) '< )))

  (progn
    (print "Task 1:")
    (print (car (reverse ids) ))

    (print "Task 2:")
    (let* ((pairs (cl-mapcar (lambda (x y) (list (- x y) x  ) )
                             (cdr ids)
                             (butlast ids)))
           (missing (seq-filter (lambda (pair) (not (equal (car pair) 1))) pairs))
           (free (+ -1 (nth 1 (car missing)))) )
      (print free)
      )
    )
  )


