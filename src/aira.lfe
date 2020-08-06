(defmodule aira
  (export (my-fun 0)))



;;; -----------
;;; library API
;;; -----------

(defun my-fun ()
    ; (io:format '"abs: ~w\n" (list (tut:abs -111)))
    ; (io:format '"tutorial: ~s\n" (list (tut:div 11 23 '(#(ratio true)))))
    ; (io:format '"ll2: ~w\n" (list (tut:ll2 '(1 2 3 4 5 6 7 8 9))))
    ; (tplogic:sort (tplogic:new 60 '((51 2) (54 3) (73 5) (94 1))))
    (let ((var1 (tplogic:new-tpline 65 '((50 2) (55 3) (75 5) (95 1))))
          (var2 (tplogic:new-tpline 65 '((51 2) (54 3) (73 5) (94 1)))))
      (progn
        (io:format "var1: ") 
        (tplogic:print var1)
        (io:format "var2: ") 
        (tplogic:print var2)
        )))



; (var2 (tplogic:new 65 '((51 2) (54 3) (73 5) (94 1))))