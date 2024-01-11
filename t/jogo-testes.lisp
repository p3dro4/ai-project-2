;;;; jogo-testes.lisp
;;;; Ficheiro de testes para jogo.lisp
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

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
    (94 25 54 89 21 8 36 14 41 -1)
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
  (tabuleiro-jogado)
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
  (colocar-cavalo (tabuleiro-teste) -1)
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
  '(94 25 54 89 21 8 36 14 41
   78 47 56 23 5 49 13 12 26 60
   0 27 17 83 34 93 74 52 45 80 
   69 9 77 95 55 39 91 73 57 30 
   24 15 22 86 1 11 68 79 76 72 
   81 48 32 2 64 16 50 37 29 71 
   99 51 6 18 53 28 7 63 10 88 
   59 42 46 85 90 75 87 43 20 31 
   3 61 58 44 65 82 19 4 35 62 
   33 70 84 40 66 38 92 67 97)
  (numeros-tabuleiro (tabuleiro-jogado))
  "numeros-tabuleiro-jogado"
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
  (substituir 0 9 (tabuleiro-teste) -1)
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
  (posicao-cavalo (tabuleiro-jogado) -1)
  "posicao-cavalo-branco"
)

;; Cavalo branco colocado tabuleiro teste
(verificar-igual
  nil
  (cavalo-colocado-p (tabuleiro-teste) -1)
  "cavalo-branco-colocado-teste"
)

;; Cavalo branco colocado tabuleiro teste
(verificar-igual
  t
  (cavalo-colocado-p (tabuleiro-jogado) -1)
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