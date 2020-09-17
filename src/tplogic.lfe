;;; time-probablity-line
(defmodule tplogic
    (export all))


(defun new-tpline []
  (list 'tpline 0 '()))

(defun new-tpline 
  ((p l) (when (and (is_list l) (is_integer p))) (list 'tpline (abs p) l)))

(defun tpline-points
  ([(cons 'tpline (cons _ points))] (when) points))

(defun tpline-period
  ([(cons 'tpline (cons period _))] (when) period))


(defun print (v)
  (lfe_io:format "~w\n" (list v)))

(defun earlier (p1 p2) 
  (< (car p1) (car p2)))

(defun later (p1 p2) 
  (> (car p1) (car p2)))


(defun sort (v)
  (new-tpline (tpline-period v) (lists:sort #'earlier/2 (tpline-points v))))



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