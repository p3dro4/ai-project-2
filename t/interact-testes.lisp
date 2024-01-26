;;;; interact-testes.lisp
;;;; Ficheiro de testes para interact.lisp
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(in-package :testes)
(format t "~46,1,1,'*:@< interact-testes.lisp ~>~%~%")

(let ((lista-testes
  (list

  )))
  (format t "~%~46,1,1,'~:@< testes bem sucedidos: ~a de ~a ~>~%" 
    (eval (cons '+ (mapcar (lambda (teste) (cond ((eq teste t) 1) (t 0))) lista-testes)))
    (length lista-testes)
  )
)

(format t "~46,1,1,'*:@< fim dos testes ~>~%~%")