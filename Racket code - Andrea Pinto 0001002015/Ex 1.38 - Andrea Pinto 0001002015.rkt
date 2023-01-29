#lang racket

(define (cont-frac-rec n d k)
  
  (define (recursion i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recursion (+ i 1))))
        )
    )
  
  (recursion 1))

(define (d k)
  (if (= (modulo (+ k 1) 3) 0)
      (* (/ (+ k 1) 3) 2)
      1.0)
  )

(+ 2 (cont-frac-rec (λ(i) 1.0)
                    d
                    10))
                      