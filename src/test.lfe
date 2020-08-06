(defmodule test
    (export all))
    
(include-lib "include/data-types.lfe")


(defun main ()
    (let ((l1 (tplogic:new 60 '((51 2) (54 3) (73 5) (94 1)))))
        (io:format '"Hello world!\n")
        (lfe_io:format '"Points: ~w\n" (list (tprobal:sort l1)))
        (lfe_io:format '"gettest: ~w\n" (list (tprobal:get-value 52 l1)))
        ))

