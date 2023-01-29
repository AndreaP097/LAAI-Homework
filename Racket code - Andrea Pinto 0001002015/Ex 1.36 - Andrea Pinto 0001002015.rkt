#lang racket


(define tolerance 0.00001)

(define (fixed-point f first-guess)
  
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  
  (define (try guess)
    (let ((next (f guess)))

      (displayln next)
      
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(define (transform x) (/ (log 1000) (log x)))

(displayln "No average damping")
; It takes 34 steps to converge to the solution
(fixed-point transform 2.0)
(newline)


(displayln "Average damping")
; It takes 9 steps to converge to the solution
(define (average x y) (/ (+ x y) 2))
(fixed-point (λ (x) (average x (/ (log 1000) (log x)))) 2.0)

  