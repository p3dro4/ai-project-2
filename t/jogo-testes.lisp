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
  (tabuleiro-teste)
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
  (tabuleiro-ambos-colocados)
  "tabuleiro-ambos-colocados"
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
  (colocar-cavalo (tabuleiro-teste) *cavalo-branco*)
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
  (colocar-cavalo (tabuleiro-teste) -2)
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
  (colocar-cavalo   
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

;; Colocar cavalo preto após colocar cavalo branco
(verificar-igual 
  (tabuleiro-ambos-colocados)
  (colocar-cavalo (colocar-cavalo (tabuleiro-teste) *cavalo-branco*) *cavalo-preto*)
  "colocar-cavalo-preto-apos-branco"
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
  (lista-numeros)
  "lista-numeros"
)

;; Baralhar
(verificar-nao-igual 
  (lista-numeros)
  (baralhar (lista-numeros))
  "baralhar"
)

;; Tabuleiro aleatório
(verificar-nao-igual
  (tabuleiro-aleatorio)
  (tabuleiro-aleatorio)
  "tabuleiro-aleatorio"
)

;;; Seletores

;; Linha
(verificar-igual
  '(99 51 6 18 53 28 7 63 10 88)
  (linha 6 (tabuleiro-teste))
  "linha"
)

;; Celula
(verificar-igual
  94
  (celula 0 0 (tabuleiro-teste))
  "celula"
)

;;; Funções auxiliares

;; Simétrico
(verificar-igual
  15
  (simetrico 51)
  "simetrico"
)

;; Duplo
(verificar-igual
  t
  (duplop 55)
  "duplo"
)

;; Maior número da linha
(verificar-igual
  96
  (maior-numero-linha '(94 25 54 89 21 8 36 14 41 96))
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
  (numeros-tabuleiro (tabuleiro-teste))
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
  (numeros-tabuleiro (tabuleiro-ambos-colocados))
  "numeros-tabuleiro-ambos-colocados"
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
  (numeros-tabuleiro 
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
  (lista-contem 3 '(1 2 3 4 5))
  "lista-contem"
)

;; Lista não contém
(verificar-igual
  nil
  (lista-contem 6 '(1 2 3 4 5))
  "lista-nao-contem"
)

;; Coluna para letra
(verificar-igual
  #\c
  (coluna-para-letra 2)
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
  (substituir 0 9 (tabuleiro-teste) *cavalo-branco*)
  "substituir"
)

;; Posição valor
(verificar-igual
  '(0 9)
  (posicao-valor (tabuleiro-teste) 96)
  "posicao-valor"
)

;; Posição cavalo branco tabuleiro jogado
(verificar-igual
  '(0 9)
  (posicao-cavalo *cavalo-branco* (tabuleiro-ambos-colocados))
  "posicao-cavalo-branco"
)

;; Cavalo branco colocado tabuleiro teste
(verificar-igual
  nil
  (cavalo-colocado-p (tabuleiro-teste) *cavalo-branco*)
  "cavalo-branco-colocado-teste"
)

;; Cavalo branco colocado tabuleiro teste
(verificar-igual
  t
  (cavalo-colocado-p (tabuleiro-ambos-colocados) *cavalo-branco*)
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
  (aplicar-regras (tabuleiro-teste) 96)
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
  (aplicar-regras (tabuleiro-teste) 55)
  "aplicar-regras-duplo"
)

;;; Movimentos

;; Movimento válido cavalo branco
(verificar-igual
  t
  (movimento-valido-p *cavalo-branco* '(2 8) (tabuleiro-ambos-colocados))
  "movimento-valido-cavalo-branco"
)

;; Movimento inválido cavalo branco
(verificar-igual
  nil
  (movimento-valido-p *cavalo-branco* '(2 10) (tabuleiro-ambos-colocados))
  "movimento-invalido-cavalo-branco"
)

;; Movimento inválido cavalo branco ameaçado
(verificar-igual
  nil
  (movimento-valido-p *cavalo-branco* '(2 8) 
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
  (mover-cavalo *cavalo-branco* '(2 8) (tabuleiro-ambos-colocados))
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
  (mover-cavalo -2 '(7 9) (tabuleiro-ambos-colocados))
  "mover-cavalo-preto"
)

;;; Operadores

;; Operador 1
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 NIL 11 68 79 76 72) 
    (NIL 48 32 2 64 16 50 37 29 71) 
    (99 51 6 -1 53 28 7 63 NIL 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (operador-1 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-1"
)

;; Operador 2
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30)
    (24 15 22 86 NIL 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 -1 7 63 NIL 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 NIL 19 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (operador-2 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-2"
)

;; Operador 3
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 NIL 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 NIL 11 68 79 76 72) 
    (81 48 32 2 64 16 -1 37 29 71) 
    (99 51 6 18 53 28 7 63 NIL 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (operador-3 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-3"
)

;; Operador 4
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 -1 73 57 30) 
    (24 15 22 86 NIL 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 28 7 63 NIL 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 NIL 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (operador-4 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-4"
)

;; Operador 5
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 -1 74 52 45 80) 
    (69 9 77 95 55 NIL 91 73 57 30) 
    (24 15 22 86 NIL 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 28 7 63 NIL 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62)
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (operador-5 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88) 
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-5"
)

;; Operador 6
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 -1 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 NIL 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (99 51 6 18 53 28 7 63 NIL 88) 
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 NIL 92 67 -2 97)
  )
  (operador-6 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88)
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-6"
)

;; Operador 7
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 23 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80)
    (69 9 -1 95 55 39 91 73 57 30) 
    (24 15 22 86 NIL 11 68 79 76 72) 
    (81 48 32 2 64 16 50 37 29 71) 
    (NIL 51 6 18 53 28 7 63 NIL 88)
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (operador-7 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88)
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-7"
)

;; Operador 8
(verificar-igual
  '(
    (94 25 54 NIL 21 8 36 14 41 96) 
    (78 47 56 NIL 5 49 13 12 26 60) 
    (0 27 17 83 34 93 74 52 45 80) 
    (69 9 77 95 55 39 91 73 57 30) 
    (24 15 22 86 NIL 11 68 79 76 72) 
    (81 48 -1 2 64 16 50 37 29 71)
    (99 51 6 18 53 28 7 63 NIL 88)
    (59 42 46 85 90 75 87 43 20 31) 
    (3 61 58 44 65 82 19 4 35 62) 
    (33 70 84 40 66 38 92 67 -2 97)
  )
  (operador-8 *cavalo-branco* 
    '(
      (94 25 54 NIL 21 8 36 14 41 96) 
      (78 47 56 23 5 49 13 12 26 60) 
      (0 27 17 83 34 93 74 52 45 80) 
      (69 9 77 95 55 39 91 73 57 30) 
      (24 15 22 86 -1 11 68 79 76 72) 
      (81 48 32 2 64 16 50 37 29 71) 
      (99 51 6 18 53 28 7 63 NIL 88)
      (59 42 46 85 90 75 87 43 20 31) 
      (3 61 58 44 65 82 19 4 35 62) 
      (33 70 84 40 66 38 92 67 -2 97)
    )
  )
  "operador-8"
)

;;; Funções relacionadas com o algoritmo de procura

;; Pontuação nó cavalo branco
(verificar-igual
  96
  (no-pontuacao (cria-no (tabuleiro-ambos-colocados) 2 (cria-no (tabuleiro-cavalo-branco) 1 (cria-no (tabuleiro-teste)))) *cavalo-branco*)
  "no-pontuacao-cavalo-branco"
)

;; Pontuação nó cavalo preto
(verificar-igual
  98
  (no-pontuacao (cria-no (tabuleiro-ambos-colocados) 2 (cria-no (tabuleiro-cavalo-branco) 1 (cria-no (tabuleiro-teste)))) *cavalo-preto*)
  "no-pontuacao-cavalo-preto"
)

;; Pontuação nó após movimento do cavalo branco
(verificar-igual
  141
  (no-pontuacao (cria-no (operador-1 *cavalo-branco* (tabuleiro-ambos-colocados)) 3 (cria-no (tabuleiro-ambos-colocados) 2 (cria-no (tabuleiro-cavalo-branco) 1 (cria-no (tabuleiro-teste))))) *cavalo-branco*)
  "no-pontuacao-cavalo-branco-movimento"
)

;; Pontuação nó após movimento do cavalo branco que 
(verificar-igual
  0
  (no-pontuacao (cria-no (operador-2 *cavalo-branco* (tabuleiro-ambos-colocados)) 3 (cria-no (tabuleiro-ambos-colocados) 2 (cria-no (tabuleiro-cavalo-branco) 1 (cria-no (tabuleiro-teste))))) *cavalo-branco*)
  "no-pontuacao-cavalo-branco-mov-nil"
)

;; Avaliar nó cavalo branco após movimento
(verificar-igual
  43
  (avaliar-no (cria-no (operador-1 *cavalo-branco* (tabuleiro-ambos-colocados)) 3 (cria-no (tabuleiro-ambos-colocados) 2 (cria-no (tabuleiro-cavalo-branco) 1 (cria-no (tabuleiro-teste))))) *cavalo-branco*)
  "avaliar-no-cavalo-branco-apos-mov"
)

;; Avaliar nó sem cavalo colocado
(verificar-igual
  0
  (avaliar-no (cria-no (tabuleiro-teste)) *cavalo-branco*)
  "avaliar-no-sem-cavalo-colocado"
)

;; Avaliar nó cavalo preto após movimento
(verificar-igual
  -21
  (avaliar-no (cria-no (operador-7 *cavalo-preto* (tabuleiro-ambos-colocados)) 3 (cria-no (tabuleiro-ambos-colocados) 2 (cria-no (tabuleiro-cavalo-branco) 1 (cria-no (tabuleiro-teste))))) *cavalo-preto*)
  "avaliar-no-cavalo-preto-apos-mov"
)

(format t "~46,1,1,'*:@< fim dos testes ~>~%~%")