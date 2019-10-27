#lang info

(define collection "http2")

(define scribblings
  (list (list "main.scrbl"
              (list 'multi-page)
              (list 'library)
              "http2")))

(define deps
  (list "base"
        "rebellion"))

(define build-deps
  (list "racket-doc"
        "rackunit-lib"
        "scribble-lib"))
