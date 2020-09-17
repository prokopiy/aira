(defmodule kb
    (import (from csv (binary_reader 1)))
    (export all))


(defun load-from-csv [Data Filename Factor]
    (let* [((tuple _ parser) (csv:binary_reader Filename))
           (V (load-csv '() parser))]
          (add-tpl-to-triples-list '() 
            (make-triplets-from-table '() (kb:gen-n-uuid (- (length V) 1)) (car V) (cdr V))
            (tplogic:new-tpline 0 (list (list (erlang:system_time) Factor))))))

(defun load-csv [data parser]
  (case (csv:next_line parser)
    ((tuple 'row line id) (when) (load-csv (cons line data) parser))
    ('eof (when) (lists:reverse data))))


(defun make-triplets-from-row
    ([Data _ '() '()] (when) Data)
    ([Data subject (cons p-head p-tail) (cons o-head o-tail)] (when) 
        (cons (list p-head subject o-head) (make-triplets-from-row Data subject p-tail o-tail))))

(defun make-triplets-from-table
    ([Data _ _ '()] (when) Data)
    ([Data (cons subjects-head subjects-tail) predicates (cons l-head l-tail)] (when) 
        (lists:append (make-triplets-from-row '() subjects-head predicates l-head) 
              (make-triplets-from-table Data subjects-tail predicates l-tail))))

(defun add-tpl-to-triples-list
    ([Result '() _] (when) Result)
    ([Result (cons H T) TPL] (when) (cons (list H TPL) (add-tpl-to-triples-list Result T TPL))))


(defun gen-n-uuid [N]
    (gen-n-uuid '() N))

(defun gen-n-uuid
    ([D 0] (when) D)
    ([D N] (when) (cons (uuid:v4) (gen-n-uuid D (- N 1)))))


; (defun make-triplet [p s o]
;     (list p s o))
