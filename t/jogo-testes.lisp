;;;; jogo-testes.lisp
;;;; Ficheiro de testes para jogo.lisp
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(in-package :testes)

(format t "~46,1,1,'*:@< jogo-testes.lisp ~>~%")

;;; Tabuleiro

;; Tabuleiro teste
(verificar-igual
  '(
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
  (5::tabuleiro-teste)
  "tabuleiro-teste"
)

;; Tabuleiro jogado
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
  (5::tabuleiro-jogado)
  "tabuleiro-jogado"
)

;; Colocar cavalo branco
(verificar-igual
  '(
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
  (5::colocar-cavalo (5::tabuleiro-teste) -1)
  "colocar-cavalo-branco"
)

;; Colocar cavalo preto
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 1 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 28 7 63 10 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (5::colocar-cavalo (5::tabuleiro-teste) -2)
  "colocar-cavalo-preto"
)

;; Colocar cavalo preto e remover 15
(verificar-igual
  '(
    (94 25 54 89 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30) 
    (24 NIL 22 86 1 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 28 7 63 10 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 NIL NIL 40 -2 38 NIL NIL NIL NIL)
  )
  (5::colocar-cavalo   
    '(
      (94 25 54 89 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 10 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 NIL NIL 40 66 38 NIL NIL NIL NIL)
    )
   -2 15)
  "colocar-cavalo-preto-e-remover-15"
)

;; Lista de números
(verificar-igual
  '(99 98 97 96 95 94 93 92 91 90 
    89 88 87 86 85 84 83 82 81 80 
    79 78 77 76 75 74 73 72 71 70 
    69 68 67 66 65 64 63 62 61 60 
    59 58 57 56 55 54 53 52 51 50 
    49 48 47 46 45 44 43 42 41 40 
    39 38 37 36 35 34 33 32 31 30 
    29 28 27 26 25 24 23 22 21 20 
    19 18 17 16 15 14 13 12 11 10 
    9 8 7 6 5 4 3 2 1 0)
  (5::lista-numeros)
  "lista-numeros"
)

;; Baralhar
(verificar-nao-igual 
  (5::lista-numeros)
  (5::baralhar (5::lista-numeros))
  "baralhar"
)

;; Tabuleiro aleatório
(verificar-nao-igual
  (5::tabuleiro-aleatorio)
  (5::tabuleiro-aleatorio)
  "tabuleiro-aleatorio"
)

;;; Seletores

;; Linha
(verificar-igual
  '(99 51 6 18 53 28 7 63 10 88)
  (5::linha 6 (5::tabuleiro-teste))
  "linha"
)

;; Celula
(verificar-igual
  94
  (5::celula 0 0 (5::tabuleiro-teste))
  "celula"
)

;;; Funções auxiliares

;; Simétrico
(verificar-igual
  15
  (5::simetrico 51)
  "simetrico"
)

;; Duplo
(verificar-igual
  t
  (5::duplop 55)
  "duplo"
)

;; Maior número da linha
(verificar-igual
  96
  (5::maior-numero-linha '(94 25 54 89 21 8 36 14 41 96))
  "maior-numero-linha"
)

;; Números do tabuleiro teste
(verificar-igual 
  '(94 25 54 89 21 8 36 14 41 96
   78 47 56 23 5 49 13 12 26 60
   0 27 17 83 34 93 74 52 45 80 
   69 9 77 95 55 39 91 73 57 30 
   24 15 22 86 1 11 68 79 76 72 
   81 48 32 2 64 16 50 37 29 71 
   99 51 6 18 53 28 7 63 10 88 
   59 42 46 85 90 75 87 43 20 31 
   3 61 58 44 65 82 19 4 35 62 
   33 70 84 40 66 38 92 67 98 97)
  (5::numeros-tabuleiro (5::tabuleiro-teste))
  "numeros-tabuleiro-teste"
)

;; Números do tabuleiro jogado
(verificar-igual 
  '(94 25 54 21 8 36 14 41
   78 47 56 23 5 49 13 12 26 60
   0 27 17 83 34 93 74 52 45 80 
   9 77 95 55 39 91 73 57 30 
   24 15 22 86 1 11 68 79 76 72 
   81 48 32 2 64 16 50 37 29 71 
   99 51 6 18 53 28 7 63 10 88 
   59 42 46 85 90 75 87 43 20 31 
   3 61 58 44 65 82 19 4 35 62 
   33 70 84 40 66 38 92 67 97)
  (5::numeros-tabuleiro (5::tabuleiro-jogado))
  "numeros-tabuleiro-jogado"
)

;; Números do tabuleiro com NILs
(verificar-igual 
  '(94 25 54 89 21 8 36 14 41 96 
    78 47 56 23 5 49 13 12 26 60 
    0 27 17 83 34 93 74 52 45 80 
    69 9 77 95 55 39 91 73 57 30 
    24 22 86 1 11 68 79 76 72
    81 48 32 2 64 16 50 37 29 71 
    99 51 6 18 53 28 7 63 10 88 
    59 42 46 85 90 75 87 43 20 31 
    3 61 58 44 65 82 19 4 35 62 
    33 40 66 38)
  (5::numeros-tabuleiro 
    '(
      (94 25 54 89 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 NIL 22 86 1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 10 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 NIL NIL 40 66 38 NIL NIL NIL NIL)
    )
  )
  "numeros-tabuleiro-com-nil"
)

;; Lista contém
(verificar-igual
  t
  (5::lista-contem 3 '(1 2 3 4 5))
  "lista-contem"
)

;; Lista não contém
(verificar-igual
  nil
  (5::lista-contem 6 '(1 2 3 4 5))
  "lista-nao-contem"
)

;; Coluna para letra
(verificar-igual
  #\c
  (5::coluna-para-letra 2)
  "coluna-para-letra"
)

;; Substituir
(verificar-igual
  '(
    (94 25 54 89 21 8 36 14 41 -1) 
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
  (5::substituir 0 9 (5::tabuleiro-teste) -1)
  "substituir"
)

;; Posição valor
(verificar-igual
  '(0 9)
  (5::posicao-valor (5::tabuleiro-teste) 96)
  "posicao-valor"
)

;; Posição cavalo branco tabuleiro jogado
(verificar-igual
  '(0 9)
  (5::posicao-cavalo -1 (5::tabuleiro-jogado))
  "posicao-cavalo-branco"
)

;; Cavalo branco colocado tabuleiro teste
(verificar-igual
  nil
  (5::cavalo-colocado-p (5::tabuleiro-teste) -1)
  "cavalo-branco-colocado-teste"
)

;; Cavalo branco colocado tabuleiro teste
(verificar-igual
  t
  (5::cavalo-colocado-p (5::tabuleiro-jogado) -1)
  "cavalo-branco-colocado-jogado"
)

;; Aplicar regras simétrico
(verificar-igual
  '(
    (94 25 54 89 21 8 36 14 41 96) 
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
  (5::aplicar-regras (5::tabuleiro-teste) 96)
  "aplicar-regras-simetrico"
)

;; Aplicar regras duplo
(verificar-igual
  '(
    (94 25 54 89 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 1 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (NIL 51 6 18 53 28 7 63 10 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 98 97)
  )
  (5::aplicar-regras (5::tabuleiro-teste) 55)
  "aplicar-regras-duplo"
)

;;; Movimentos

;; Movimento válido cavalo branco
(verificar-igual
  t
  (5::movimento-valido-p -1 '(2 8) (5::tabuleiro-jogado))
  "movimento-valido-cavalo-branco"
)

;; Movimento inválido cavalo branco
(verificar-igual
  nil
  (5::movimento-valido-p -1 '(2 10) (5::tabuleiro-jogado))
  "movimento-invalido-cavalo-branco"
)

;; Movimento inválido cavalo branco ameaçado
(verificar-igual
  nil
  (5::movimento-valido-p -1 '(2 8) 
    '(
      (94 25 54 89 21 8 36 14 41 -1)
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80)
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 1 11 68 79 76 -2)
      (81 48 32 2 64 16 50 37 29 71)
      (99 51 6 18 53 28 7 63 10 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 98 97)
    )
  )
  "movimento-cavalo-branco-ameacado"
)

;; Mover cavalo branco
(verificar-igual
  '(
    (94 25 NIL NIL 21 8 36 14 41 NIL) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 -1 80) 
    (NIL 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 1 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 28 7 63 10 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (5::mover-cavalo -1 '(2 8) (5::tabuleiro-jogado))
  "mover-cavalo-branco"
)

;; Mover cavalo preto
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 -1) 
    (78 47 56 23 5 49 NIL 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (NIL 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 1 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 28 7 63 10 88) 
    (59 42 46 85 90 75 87 43 20 -2) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 NIL 97)
  )
  (5::mover-cavalo -2 '(7 9) (5::tabuleiro-jogado))
  "mover-cavalo-preto"
)