#lang racket/base

(require racket/contract/base)

(provide
 (contract-out
  [http-version (-> (integer-in 0 9) (integer-in 0 9) http-version?)]
  [http-version? predicate/c]
  [http-version-major-part (-> http-version? (integer-in 0 9))]
  [http-version-minor-part (-> http-version? (integer-in 0 9))]
  [http/0.9 http-version?]
  [http/1 http-version?]
  [http/1.1 http-version?]
  [http/2 http-version?]
  [http-status-code (-> (integer-in 100 999) http-status-code?)]
  [http-status-code? predicate/c]
  [http-status-code-value (-> http-status-code? (integer-in 100 999))]
  [http-status-message (-> immutable-string? http-status-message?)]
  [http-status-message? predicate/c]
  [http-header (-> http-header-name? http-header-value? http-header?)]
  [http-header? predicate/c]
  [http-header-name (-> immutable-string? http-header-name?)]
  [http-header-name? predicate/c]
  [http-header-value (-> immutable-string? http-header-value?)]
  [http-header-value? predicate/c]
  [http-content (-> immutable-bytes? http-content?)]
  [http-content? predicate/c]))

(require rebellion/base/immutable-string
         rebellion/binary/immutable-bytes
         rebellion/type/tuple
         rebellion/type/wrapper)

;@------------------------------------------------------------------------------

(define-tuple-type http-version (major-part minor-part))

(define http/0.9 (http-version 0 9))
(define http/1 (http-version 1 0))
(define http/1.1 (http-version 1 1))
(define http/2 (http-version 2 0))

(define-wrapper-type http-status-code)
(define-wrapper-type http-status-message)
(define-tuple-type http-header (get-name get-value))
(define-wrapper-type http-header-name)
(define-wrapper-type http-header-value)
(define-wrapper-type http-content)
