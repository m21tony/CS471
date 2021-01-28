;; Name: Tony Maldonado
;; Date: November 18, 2020
;; Input: A logical expression
;; Output: A reduced CD form, the number of specified operators or
;;         a list of all unique variables
;; Precondition: The user gives a valid CD as input
;; Postcondition: The program will give the correct output based 
;;                on the function

;; To run type this in terminal: 
;; mzscheme
;; (load "evalcd.lsp")

;; This program evaluates a circuit design

;; Counts the number of specified operators in the argument
;; Format is: 'operator '(operator list)
(define (count_operator x oplist)
    (cond ((null? oplist) 0)
          ((not (list? oplist))
          (if (eq? x oplist) 1 0))
          (else (+ (count_operator x (car oplist)) (count_operator x (cdr oplist))))
    ) ;; end cond
) ;; end define

;; Lists all the unique variables in the argument
;; Format is: '(operator list)
(define (unique oplist)
    (cond ((null? oplist) '() )
          ((not (list? oplist)) '() )
          ((member (car oplist) (cdr oplist)) (unique (cdr oplist)))
          (else (cons (car oplist) (unique (cdr oplist))))
    ) ;; end cond
) ;; end define

;; Clean up all the other stuff in a CD
;; Assume is we get a flattened, unique CD
;; Format is: (findinputvars (unique (flatten '(oplist))))
(define (findinputvars oplist)
    (cond ((null? oplist) '() )
          ((not (list? oplist)) '() )
          ((or (eq? (car oplist) 1)
               (eq? (car oplist) 0)
               (eq? (car oplist) 'AND)
               (eq? (car oplist) 'NOT)
               (eq? (car oplist) 'OR))
               (findinputvars (cdr oplist)))
          (else (cons (car oplist) (findinputvars (cdr oplist))))
    ) ;; end cond
) ;; end define

;; NOT CD1
(define (evalcd CD)
    ;; Base Case
    (cond ((null? CD) '()) 
          ;; True, False, or A1....A1000
          ((not (list? CD)) CD)
          ((eq? (car CD) 'NOT) (evalcd_not CD))
          ((eq? (car CD) 'AND) (evalcd_and CD))
          ((eq? (car CD) 'OR)  (evalcd_or CD))
    ) ;; end cond
) ;; end define

;; PRE: MUST be a (NOT CD) form (CAR CD) => NOT
;; POST: Reduce the Argument AND see if we can reduce it
;; NOT
(define (evalcd_not CD)
    (cond ((eq? (evalcd (cadr CD)) 0) 1)
          ((eq? (evalcd (cadr CD)) 1) 0)
          (else (cons 'NOT (list (evalcd (cadr CD)))))
    ) ;; end cond
) ;; end define

;; PRE: MUST be (AND CD1 CD2) format
;; POST: Apply simple tautologies to the CD1 and CD2 and maybe reduce
;; AND
(define (evalcd_and CD)
    (cond ((eq? (evalcd (cadr CD)) 0) 0)
          ((eq? (evalcd (caddr CD)) 0) 0)
          ((eq? (evalcd (cadr CD)) 1) (evalcd (caddr CD)))
          ((eq? (evalcd (caddr CD)) 1) (evalcd (cadr CD)))
          (else (cons 'AND (list (evalcd (cadr CD)) (evalcd (caddr CD)))))
    ) ;; end cond
) ;; end define

;; PRE: MUST be a (OR CD1 CD2) format
;; POST: Apply simple tautologies to the CD1 and CD2 and maybe reduce
;; OR
(define (evalcd_or CD)
    (cond ((eq? (evalcd (cadr CD)) 1) 1)
          ((eq? (evalcd (caddr CD)) 1) 1)
          ((eq? (evalcd (cadr CD)) 0) (evalcd (caddr CD)))
          ((eq? (evalcd (caddr CD)) 0) (evalcd (cadr CD)))
          (else (cons 'OR (list (evalcd (cadr CD)) (evalcd (caddr CD)))))
    ) ;; end cond
) ;; end define
