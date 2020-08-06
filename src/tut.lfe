(defmodule tut
    (export all))


(defun fac
  ((1) 1)
  ((n) (* n (fac (- n 1)))))

(defun convert
    (('inch x) (when) (* x 2.54))
    (('cantimeter x) (when) (/ x 2.54)))

(defun abs (x)
    (cond ((> x 0) x)
        ((< x 0) (- x))
        ('else 0)))

(defun list-length
    ((()) (when) 0)
    (((cons f r)) (when) (+ 1 (list-length r))))


(defun ll2 (l)
    (ll2 0 l))

(defun ll2
    ([acc ()] (when) acc)
    ([acc (cons h t)] (when) (ll2 (+ 1 acc) t)))


(defun div [a b]
    (div a b '()))

(defun div [a b opts]
    (let ((debug (proplists:get_value 'debug opts 'false))
            (ratio? (proplists:get_value 'ratio opts 'false)))
        (if (and debug ratio?)
            (io:format "Returning as ratio ...~n"))
        (if ratio?
            (++ (integer_to_list a) "/" (integer_to_list b))
            (/ a b))))


(defun red
    ([(map 'red src-val 'alpha src-alpha) (map 'red dst-val 'alpha dst-alpha)]
        (+ (* src-val src-alpha) (* dst-val dst-alpha (- 1.0 src-alpha)))))