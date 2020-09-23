(defmodule uuid
    (export (v4 0) (to_string 1) (to_binary 1)))

(defun v4 []
    (v4 (crypto:strong_rand_bytes 16)))

(defun v4
    ([(binary (u0 (size 32)) (u1 (size 16)) (_ (size 4)) (u2 (size 12)) (_ (size 2)) (u3 (size 30)) (u4 (size 32)))]
        (binary (u0 (size 32)) (u1 (size 16)) (4 (size 4)) (u2 (size 12)) (2 (size 2)) (u3 (size 30)) (u4 (size 32))))
    )

; (defun v4 []
;     (v4 (- (random:uniform (bsl 1 48)) 1) (- (random:uniform (bsl 1 12)) 1)
;         (- (random:uniform (bsl 1 32)) 1) (- (random:uniform (bsl 1 30)) 1)))

; (defun v4 [r1 r2 r3 r4]
;     (binary (r1 (size 48)) (4 (size 4)) (r2 (size 12)) (2 (size 2)) (r3 (size 32)) (r4 (size 30))))

(defun to_string [U]
    (lists:flatten 
        (io_lib:format "~8.16.0b-~4.16.0b-~4.16.0b-~2.16.0b~2.16.0b-~12.16.0b" (get_parts U))))

(defun get_parts
    ([(binary (TL (size 32)) (TM (size 16)) (THV (size 16)) (CSR (size 8)) (CSL (size 8)) (N (size 48)))] 
        (list TL TM THV CSR CSL N)))

(defun hex_to_int [Hex]
    (let (((tuple 'ok (list D) '()) (io_lib:fread "~16u" Hex)))
        D))

(defun to_binary
    ([UuidStr] (when (is_list UuidStr)) 
        (case (length UuidStr)
            (32 (when) (to_binary 'simple UuidStr))
            (36 (when) (to_binary 'pretty UuidStr))))
    ([_] (when) (erlang:error 'badarg)))

(defun to_binary
    (['simple UuidStr] (when) 
        (binary ((hex_to_int UuidStr) (size 128))))
    (['pretty UuidStr] (when) 
        (let ((P (lists:map #'hex_to_int/1 (string:tokens UuidStr "$-")))) 
            (binary 
                ((lists:nth 1 P) (size 32)) ((lists:nth 2 P) (size 16)) ((lists:nth 3 P) (size 16)) 
                ((lists:nth 4 P) (size 16)) ((lists:nth 5 P) (size 48))))))
