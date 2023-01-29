#lang gamble
(require gamble/viz)

(define (a) (flip 0.8))
(define (b) (flip (if a 0.5 0.3)))

(define (model)
  (set! a (a))
  (set! b (b))
  (list a b))

(hist (repeat model 100000))