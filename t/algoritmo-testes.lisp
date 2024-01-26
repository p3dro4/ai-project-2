;;;; algoritmo-testes.lisp
;;;; Ficheiro de testes para algoritmo.lisp
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(in-package :testes)

(format t "~46,1,1,'*:@< algoritmo-testes.lisp ~>~%~%")

(let ((lista-testes
  (list
    ;; Alfa-Beta
    (verificar-igual
      91
      (second (5::alfabeta (5::cria-no (list (5::tabuleiro-ambos-colocados) (list 96 98))) 3 most-negative-double-float most-positive-double-float 5::*cavalo-branco* (list 5::*cavalo-branco* 5::*cavalo-preto*) '5::sucessores '5::avaliar-estado))
      "alfabeta"
    )

    ;; Alfa-Beta sem jogadas possíveis
    (verificar-igual
      nil
      (second (5::alfabeta 
        (list 
          (5::cria-no
            '(
              (-1 20 44 NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL 30 NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL -2 NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
            ) 
            (list 2 22)
          )
        )
        3 most-negative-double-float most-positive-double-float 5::*cavalo-branco* (list 5::*cavalo-branco* 5::*cavalo-preto*) '5::sucessores '5::avaliar-estado))
      "alfabeta-sem-jogadas"
    )
    
  )))
  (format t "~%~46,1,1,'~:@< testes bem sucedidos: ~a de ~a ~>~%" 
    (eval (cons '+ (mapcar (lambda (teste) (cond ((eq teste t) 1) (t 0))) lista-testes)))
    (length lista-testes)
  )
)

(format t "~46,1,1,'*:@< fim dos testes ~>~%~%")