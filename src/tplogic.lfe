; time-probablity-line
(defmodule tplogic
    (export all))

(defrecord tpline
    (period 0)
    (points '()))


(defun new ()
  (make-tpline))

(defun new 
  ((p l) (when (and (is_list l) (is_integer p))) (make-tpline period (abs p) points l)))

(defun print (v)
  (lfe_io:format "~w\n" (list v)))

(defun earlier (v1 v2) 
  (< (car v1) (car v2)))

(defun later (v1 v2) 
  (> (car v1) (car v2)))

(defun sort (v)
  (new (tpline-period v) (lists:sort #'earlier/2 (tpline-points v))))



(defun get-nearest-point-from-list
  ((last _ '()) last)
  ((last t (cons head tail)) 
    (if (and (=< (car head) t) (> (car head) (car last))) 
      (get-nearest-point-from-list head t tail) 
      (get-nearest-point-from-list last t tail))))

(defun get-nearest-point (t v)
  (cond ((== (tpline-period v) 0) 
          (get-nearest-point-from-list '(0 0) t (tpline-points v)))
        ((>  (tpline-period v) 0) 
          (let ((last_def_time (car (lists:last (tpline-points v)))))
            (cond ((> t last_def_time) 
                    (let ((t_dist (- t last_def_time)))
                      (let ((ct (- t (* (tpline-period v) (+ 1 (div t_dist (tpline-period v)))))))
                        (get-nearest-point-from-list '(0 0) ct (tpline-points v)))))
                  ((and (< t last_def_time) (> t (caar (tpline-points v))))
                    (get-nearest-point-from-list '(0 0) t (tpline-points v)))
                  ('true '(0 0)))))))

(defun get-point (t v)
  (let (((cons nt nv) (get-nearest-point t v)))
    (cons t nv)))

(defun get-value (t v)
  (let (((cons nt nv) (get-nearest-point t v)))
    (car nv)))