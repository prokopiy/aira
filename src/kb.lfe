(defmodule kb
    (export all))


(defun load-from-csv [Data Filename]
    (let* [((tuple _ parser) (csv:binary_reader Filename))
           (V (load-csv '() parser))]
          (make-triplets-from-lists2 '() (kb:gen-n-uuid (- (length V) 1)) (car V) (cdr V))))

(defun load-csv [data parser]
  (case (csv:next_line parser)
    ((tuple 'row line id) (when) (load-csv (cons line data) parser))
    ('eof (when) (lists:reverse data))))


(defun make-triplets-from-lists
    ([Data _ '() '()] (when) Data)
    ([Data subject (cons p-head p-tail) (cons o-head o-tail)] (when) 
        (cons (list p-head subject o-head) (make-triplets-from-lists Data subject p-tail o-tail))))

(defun make-triplets-from-lists2
    ([Data _ _ '()] (when) Data)
    ([Data (cons s-head s-tail) predicates (cons l-head l-tail)] (when) 
        (lists:append (make-triplets-from-lists '() s-head predicates l-head) 
              (make-triplets-from-lists2 Data s-tail predicates l-tail))))


(defun gen-n-uuid [N]
    (gen-n-uuid '() N))

(defun gen-n-uuid
    ([D 0] (when) D)
    ([D N] (when) (cons (uuid:v4) (gen-n-uuid D (- N 1)))))


(defun make-triplet [p s o]
    (list p s o))