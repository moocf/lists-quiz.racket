#lang racket

; try these using only car, cdr, cons
(define foldl
  (lambda (f init lst)
    (if (null? lst)
        init
        (foldl f (f (car lst) init) (cdr lst)))))

(define foldr
  (lambda (f init lst)
    (if (null? lst)
        init
        (f (car lst) (foldr f init (cdr lst))))))

(define map
  (lambda (f lst)
    (foldl
     (lambda (val acc)
       (append acc (list (f val))))
     '()
     lst)))

(define length
  (lambda (lst)
    (foldl
     (lambda (n acc)
       (+ acc 1))
     0
     lst)))


(define scalar-product
  (lambda (n lst)
    (map
     (lambda (v)
       (* v n))
     lst)))

(define pairs
  (lambda (n lst)
    (map
     (lambda (v)
       (list n v))
     lst)))

(define **
  (lambda (l1 l2)
    (foldl
     (lambda (v acc)
       (append acc (pairs v l2)))
     '()
     l1)))

; can someone implement .* (the scalar product)
; using only map, foldl, foldr, append, apply
