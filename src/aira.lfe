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
    (let* ((var1 (tplogic:new-tpline 65 '((50 2) (55 3) (75 5) (95 1))))
          (var2 (tplogic:new-tpline 65 '((51 2) (54 3) (73 5) (94 1))))
          ; ((tuple _ parser) (csv:binary_reader "student.csv"))
          (u1 (uuid:v4))
          (s1 (uuid:to-string u1))
          (var3 (kb:make-triplets-from-table '() (kb:gen-n-uuid 2) '("id" "surname" "year") (list '("1" "Ivanov" "1998") '("2" "Petrov" "1997")))))
      (progn
        (io:format "var1: ")
        (tplogic:print var1)
        (io:format "var2: ")
        (tplogic:print var2)
        ; (io:format "var3: ")
        ; (tplogic:print var3)
        
        (io:format "~p~n" (list (kb:load-from-csv '() "student.csv" 0.9)))
        (io:format "~p~n" (list (1°F 5)))
        ; (io:format "~p~n" (list (uuid:to-string u1)))
        ; (io:format "~w~n" (list (uuid:to-binary s1)))
        ; (io:format "var3: ~p~n" (list var3))
        ; (wxtest:start)
        )))

(defun 1°F [x]
  (rem x 2))

(defun print-csv [parser]
  (case (csv:next_line parser)
    ((tuple 'row line id) (when) 
      (progn 
        (io:format "~p: ~p ~n" (list id line))
        (print-csv parser)))
    ('eof (when) (io:format "End of csv-file ~n"))))

(defun load-csv [data parser]
  (case (csv:next_line parser)
    ((tuple 'row line id) (when) (load-csv (cons line data) parser))
    ('eof (when) (lists:reverse data))))
