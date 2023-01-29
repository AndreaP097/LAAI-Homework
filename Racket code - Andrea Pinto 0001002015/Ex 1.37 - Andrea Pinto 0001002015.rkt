#lang racket

(define (cont-frac-rec n d k)
  
  (define (recursion i)
    (if (= k i)
        ; if index k
        (/ (n i) (d i))
        ; if NOT index k
        (/ (n i) (+ (d i) (recursion (+ i 1))))
        )
    )
  (recursion 1))

;(cont-frac-rec (λ(i) 1.0)
;               (λ(i) 1.0)
;               11)

(define (cont-frac-iter n d k)

   (define (iter counter result)
     (if (> counter 0)
         (iter (- counter 1) (/ (n counter) (+ (d counter) result)))
         result
         )
     )
  (iter k 0)
  )

(cont-frac-iter (λ(i) 1.0)
                (λ(i) 1.0)
                11)
