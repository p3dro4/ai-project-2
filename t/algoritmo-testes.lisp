;;;; algoritmo-testes.lisp
;;;; Ficheiro de testes para algoritmo.lisp
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(in-package :testes)

(format t "~46,1,1,'*:@< algoritmo-testes.lisp ~>~%~%")

(let ((lista-testes
  (list
    ;; Criar nó
    (verificar-igual
      '(
        (
          (94 25 54 NIL 21 8 36 14 41 -1) 
          (78 47 56 23 5 49 13 12 26 60) 
          (0 27 17 83 34 93 74 52 45 80) 
          (NIL 9 77 95 55 39 91 73 57 30) 
          (24 15 22 86 1 11 68 79 76 72) 
          (81 48 32 2 64 16 50 37 29 71) 
          (99 51 6 18 53 28 7 63 10 88) 
          (59 42 46 85 90 75 87 43 20 31) 
          (3 61 58 44 65 82 19 4 35 62) 
          (33 70 84 40 66 38 92 67 -2 97)
        )
        2
        (
          (
            (94 25 54 89 21 8 36 14 41 -1) 
            (78 47 56 23 5 49 13 12 26 60) 
            (0 27 17 83 34 93 74 52 45 80) 
            (NIL 9 77 95 55 39 91 73 57 30) 
            (24 15 22 86 1 11 68 79 76 72) 
            (81 48 32 2 64 16 50 37 29 71) 
            (99 51 6 18 53 28 7 63 10 88) 
            (59 42 46 85 90 75 87 43 20 31) 
            (3 61 58 44 65 82 19 4 35 62) 
            (33 70 84 40 66 38 92 67 98 97)
          )
          1
          (
            (
              (94 25 54 89 21 8 36 14 41 96) 
              (78 47 56 23 5 49 13 12 26 60) 
              (0 27 17 83 34 93 74 52 45 80) 
              (69 9 77 95 55 39 91 73 57 30) 
              (24 15 22 86 1 11 68 79 76 72) 
              (81 48 32 2 64 16 50 37 29 71) 
              (99 51 6 18 53 28 7 63 10 88) 
              (59 42 46 85 90 75 87 43 20 31) 
              (3 61 58 44 65 82 19 4 35 62) 
              (33 70 84 40 66 38 92 67 98 97)
            )
            0
            nil
          )
        )
      )
      (5::cria-no (5::tabuleiro-ambos-colocados) 2 (5::cria-no (5::tabuleiro-cavalo-branco) 1 (5::cria-no (5::tabuleiro-teste))))
      "cria-no"
    )

    ;; Nó teste
    (verificar-igual
      '(
        (
          (94 25 54 NIL 21 8 36 14 41 -1) 
          (78 47 56 23 5 49 13 12 26 60) 
          (0 27 17 83 34 93 74 52 45 80) 
          (NIL 9 77 95 55 39 91 73 57 30) 
          (24 15 22 86 1 11 68 79 76 72) 
          (81 48 32 2 64 16 50 37 29 71) 
          (99 51 6 18 53 28 7 63 10 88) 
          (59 42 46 85 90 75 87 43 20 31) 
          (3 61 58 44 65 82 19 4 35 62) 
          (33 70 84 40 66 38 92 67 -2 97)
        )
        2
        (
          (
            (94 25 54 89 21 8 36 14 41 -1) 
            (78 47 56 23 5 49 13 12 26 60) 
            (0 27 17 83 34 93 74 52 45 80) 
            (NIL 9 77 95 55 39 91 73 57 30) 
            (24 15 22 86 1 11 68 79 76 72) 
            (81 48 32 2 64 16 50 37 29 71) 
            (99 51 6 18 53 28 7 63 10 88) 
            (59 42 46 85 90 75 87 43 20 31) 
            (3 61 58 44 65 82 19 4 35 62) 
            (33 70 84 40 66 38 92 67 98 97)
          )
          1
          (
            (
              (94 25 54 89 21 8 36 14 41 96) 
              (78 47 56 23 5 49 13 12 26 60) 
              (0 27 17 83 34 93 74 52 45 80) 
              (69 9 77 95 55 39 91 73 57 30) 
              (24 15 22 86 1 11 68 79 76 72) 
              (81 48 32 2 64 16 50 37 29 71) 
              (99 51 6 18 53 28 7 63 10 88) 
              (59 42 46 85 90 75 87 43 20 31) 
              (3 61 58 44 65 82 19 4 35 62) 
              (33 70 84 40 66 38 92 67 98 97)
            )
            0
            nil
          )
        )
      )
      (5::no-teste)
      "no-teste"
    )

    ;; Nó estado
    (verificar-igual
      '(
          (94 25 54 NIL 21 8 36 14 41 -1) 
          (78 47 56 23 5 49 13 12 26 60) 
          (0 27 17 83 34 93 74 52 45 80) 
          (NIL 9 77 95 55 39 91 73 57 30) 
          (24 15 22 86 1 11 68 79 76 72) 
          (81 48 32 2 64 16 50 37 29 71) 
          (99 51 6 18 53 28 7 63 10 88) 
          (59 42 46 85 90 75 87 43 20 31) 
          (3 61 58 44 65 82 19 4 35 62) 
          (33 70 84 40 66 38 92 67 -2 97)
        )
      (5::no-estado (5::no-teste))
      "no-estado"
    )

    ;; Nó profundidade
    (verificar-igual
      2
      (5::no-profundidade (5::no-teste))
      "no-profundidade"
    )

    ;; Nó pai
    (verificar-igual
      '(
        (
          (94 25 54 89 21 8 36 14 41 -1) 
          (78 47 56 23 5 49 13 12 26 60) 
          (0 27 17 83 34 93 74 52 45 80) 
          (NIL 9 77 95 55 39 91 73 57 30) 
          (24 15 22 86 1 11 68 79 76 72) 
          (81 48 32 2 64 16 50 37 29 71) 
          (99 51 6 18 53 28 7 63 10 88) 
          (59 42 46 85 90 75 87 43 20 31) 
          (3 61 58 44 65 82 19 4 35 62) 
          (33 70 84 40 66 38 92 67 98 97)
        )
        1
        (
          (
            (94 25 54 89 21 8 36 14 41 96) 
            (78 47 56 23 5 49 13 12 26 60) 
            (0 27 17 83 34 93 74 52 45 80) 
            (69 9 77 95 55 39 91 73 57 30) 
            (24 15 22 86 1 11 68 79 76 72) 
            (81 48 32 2 64 16 50 37 29 71) 
            (99 51 6 18 53 28 7 63 10 88) 
            (59 42 46 85 90 75 87 43 20 31) 
            (3 61 58 44 65 82 19 4 35 62) 
            (33 70 84 40 66 38 92 67 98 97)
          )
          0
          nil
        )
      )
      (5::no-pai (5::no-teste))
      "no-pai"
    )

    ;; Negamax com cortes alfa-beta
    (verificar-igual
      91
      (second (5::negamax (5::no-teste) 3 most-negative-double-float most-positive-double-float 5::*cavalo-branco* (list 5::*cavalo-branco* 5::*cavalo-preto*) '5::sucessores '5::avaliar-no))
      "negamax-alfabeta"
    )

    ;; Alfa-Beta
    (verificar-igual
      91
      (second (5::alfabeta (5::no-teste) 3 most-negative-double-float most-positive-double-float 5::*cavalo-branco* (list 5::*cavalo-branco* 5::*cavalo-preto*) '5::sucessores '5::avaliar-no))
      "alfabeta"
    )

    ;; Alfa-Beta sem jogadas possíveis
    (verificar-igual
      most-negative-double-float
      (second (5::alfabeta 
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
          2
          (5::cria-no
            '(
              (-1 20 44 NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL 30 NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL 22 NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
            ) 
            1
            (5::cria-no
              '(
                (2 20 44 NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL 30 NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL 22 NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
                (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
              )
              0
              nil
            )
          )
        )
        3 most-negative-double-float most-positive-double-float 5::*cavalo-branco* (list 5::*cavalo-branco* 5::*cavalo-preto*) '5::sucessores '5::avaliar-no))
      "alfabeta-sem-jogadas"
    )
    
  )))
  (format t "~%~46,1,1,'~:@< testes bem sucedidos: ~a de ~a ~>~%" 
    (eval (cons '+ (mapcar (lambda (teste) (cond ((eq teste t) 1) (t 0))) lista-testes)))
    (length lista-testes)
  )
)

(format t "~46,1,1,'*:@< fim dos testes ~>~%~%")