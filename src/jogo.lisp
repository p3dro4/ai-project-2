;;;; jogo.lisp
;;;; Código relacionado com o problema
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

;;; Tabuleiros

;; Função que retorna um tabuleiro predefinido.
(defun tabuleiro-teste ()
    "Tabuleiro de teste sem nenhuma jogada realizada"
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
)

;; Função que retorna um tabuleiro predefinido com os cavalos colocados.
(defun tabuleiro-jogado ()
  "Tabuleiro de teste igual ao anterior mas tendo sido colocado o cavalo branco na casa (0,9) e o cavalo preto na casa (9,8)"
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
)

;; Função que recebe um tabuleiro e se não tiver o cavalo (branco ou preto) colocado,
;; coloca o cavalo na casa com maior valor na linha respetiva 
;; (primeira linha para o cavalo branco e última para o cavalo preto).
(defun colocar-cavalo (tabuleiro cavalo &optional (valor-a-remover-se-duplo (maior-numero-tabuleiro tabuleiro)))
  "Coloca o cavalo na casa com maior valor na linha respetiva"
  (cond ((not (numberp cavalo)) (error "O cavalo tem de ser um numero"))
        ((not (or (= cavalo -1) (= cavalo -2))) (error "O cavalo tem de ser -1 ou -2"))
        ((cavalo-colocado-p tabuleiro cavalo) nil)
        (t (cond ((= cavalo -1) (colocar-cavalo-auxiliar tabuleiro cavalo 0 valor-a-remover-se-duplo))
                 ((= cavalo -2) (colocar-cavalo-auxiliar tabuleiro cavalo (1- (length tabuleiro)) valor-a-remover-se-duplo))
           )
        )
  )
)

;; Função auxiliar que recebe um tabuleiro, o cavalo e a linha respetiva e coloca o cavalo na casa com maior valor na linha respetiva.
(defun colocar-cavalo-auxiliar (tabuleiro cavalo linha-respetiva value-a-remover-se-duplo)
  "Coloca o cavalo na casa com maior valor na linha respetiva"
  (let* ((valor (maior-numero-linha (linha linha-respetiva tabuleiro)))
         (coluna (second (posicao-valor tabuleiro valor))))
    (cond ((null (celula linha-respetiva coluna tabuleiro)) nil)
          (t (aplicar-regras (substituir linha-respetiva coluna tabuleiro cavalo) (celula linha-respetiva coluna tabuleiro) value-a-remover-se-duplo))
    )
  )
)

;; Função que recebe um número positivo i e cria uma lista com todos os números
;; entre 0 (inclusivé) e o número passado como argumento (exclusivé). 
;; Por default o n é 100.
(defun lista-numeros (&optional (n 100) (i 0))
  "Retorna uma lista com todos os numeros entre 0 e n"
  (cond ((< n 0) (error "O número tem de ser positivo"))
        ((= i n) nil)
        (t (cons (1- (- n i)) (lista-numeros n (1+ i))))
  )
)

;; Função que recebe uma lista e muda aleatoriamente os seus números.
(defun baralhar (lista)
  "Baralha os elementos da lista de forma aleatoria"
    (cond ((null lista) nil)
          (t (let ((num-aleatorio (nth (random (length lista)) lista)))
                  (append (list num-aleatorio) (baralhar (remove-if
                            (lambda (num) (= num num-aleatorio)) lista)))))
    )
)

;; Função que recebe uma lista de números (por default gera uma lista nova) 
;; e o tamanhho da linha (por default o valor é 10) e retorna um tabuleiro com esses parâmetros.
(defun tabuleiro-aleatorio (&optional (lista (baralhar (lista-numeros))) (i 10))
  "Retorna um tabuleiro aleatorio com os números da lista e com o tamanho da linha i"
  (cond
    ((not (= (mod (length lista) i) 0)) (error "O tamanho da lista não é multiplo do tamanho da linha"))
    ((null lista) nil)
    (t (cons (subseq lista 0 i) (tabuleiro-aleatorio (subseq lista i) i)))
  )
)

;;; Seletores

;; Função que recebe um índice e o tabuleiro e 
;; retorna uma lista que representa essa linha do tabuleiro.
(defun linha (i tabuleiro)
  "Retorna a linha i do tabuleiro"
  (nth i tabuleiro)
)

;; Função que recebe dois índices e o tabuleiro e 
;; retorna o valor presente nessa célula do tabuleiro.
(defun celula (i j tabuleiro)
  "Retorna o valor da celula (i,j) do tabuleiro"
  (cond ((or (< i 0) (< j 0)) nil)
        ((or (>= i (length tabuleiro)) (>= j (length (linha i tabuleiro)))) nil)
        (t (nth j (nth i tabuleiro)))
  )
)

;;; Funções auxiliares

;; Função que recebe um número e retorna o número simétrico 
(defun simetrico (num)
  "Retorna o número simétrico"
  (cond ((< num 10) (lista-para-numero (reverse (list 0 num))))
        (t (lista-para-numero (reverse (numero-para-lista num))))
  )
)

;; Função que recebe um número e retorna t se o número for duplo i.e. se for composto por dois algarismos iguais.
(defun duplop (num)
  "Retorna t se o número for duplo i.e. se for composto por dois algarismos iguais"
  (let ((lista (numero-para-lista num)))
    (cond ((null lista) nil)
          ((not (= (length lista) 2)) nil)
          ((= (first lista) (second lista)) t)
          (t nil)
    )
  )
)

;; Função que recebe uma linha e retorna o maior número da linha.
(defun maior-numero-linha (linha-tabuleiro)
  "Retorna o maior número da linha"
  (apply 'max (remove-if (lambda (num) (or (null num) (< num 0))) linha-tabuleiro))
)

;; Função que recebe um tabuleiro e retorna o maior número do tabuleiro.
(defun maior-numero-tabuleiro (tabuleiro)
  "Retorna o maior número do tabuleiro"
  (cond ((null tabuleiro) nil)
        (t (let ((tabuleiro-numeros (numeros-tabuleiro tabuleiro)))
            (cond ((null tabuleiro-numeros) nil)
                  (t (apply 'max tabuleiro-numeros))
            )
           )
        )
  )
)

;; Função que retorna todos os números de um tabuleiro numa lista.
(defun numeros-tabuleiro (tabuleiro)
  (remove-if (lambda (num) (or (null num) (< num 0))) (juntar-linhas tabuleiro))
)

;; Função auxiliar que recebe um tabuleiro e retorna uma lista com todas as linhas do tabuleiro juntas.
(defun juntar-linhas (tabuleiro)
  "Junta as linhas do tabuleiro numa lista"
  (cond ((null tabuleiro) nil)
        (t (append (car tabuleiro) (juntar-linhas (cdr tabuleiro))))
  )
)

;; Função auxiliar que recebe uma lista de algarismos e retorna o número correspondente.
(defun lista-para-numero (lista)
  "Retorna o número correspondente à lista de algarismos"
  (cond ((null lista) 0)
        ((not (numberp (car lista))) (error "A lista não é composta por números"))
        (t (+ (* (car lista) (expt 10 (1- (length lista)))) (lista-para-numero (cdr lista))))
  )
)

;; Função auxiliar que recebe uma lista e um item e retorna se o item está na lista.
(defun lista-contem (item lista)
  "Retorna se o item está na lista"
  (cond ((null lista) nil)
        ((equal item (car lista)) t)
        (t (lista-contem item (cdr lista)))
  )
)

;; Função auxiliar que recebe um número e retorna uma lista com os algarismos do número.
(defun numero-para-lista (num)
  "Retorna uma lista com os algarismos do número"
  (cond ((not (numberp num)) (error "A lista não é composta por números"))
        ((< num 10) (list num))
        (t (append (numero-para-lista (floor (/ num 10))) (list (mod num 10))))
  )
)

;; Função auxiliar que recebe o número da coluna e retorna a letra correspondente
(defun coluna-para-letra (num)
  "Retorna a letra correspondente ao número da coluna"
  (let ((letra #\a))
    (cond ((not (numberp num)) (error "O argumento não é um número"))
          ((= num 0) letra)
          (t (int-char (+ (char-int letra) num)))
    )
  )
)

;; Função que recebe um índice, uma lista e um valor (por default o valor é NIL) e
;; substitui pelo valor pretendido nessa posição.
(defun substituir-posicao (i lista &optional valor)
  "Substitui o valor da posicao i da lista pelo novo valor"
  (cond ((null lista) nil)
        ((= i 0) (cons valor (cdr lista)))
        (t (cons (car lista) (substituir-posicao (1- i) (cdr lista) valor)))
  )
)

;; Função que recebe dois índices, o tabuleiro e um valor (por default o valor é NIL). 
;; A função deverá retornar o tabuleiro com a célula substituída pelo valor pretendido
(defun substituir (i j tabuleiro &optional valor)
  "Substitui o valor da celula (i,j) do tabuleiro pelo novo valor"
  (cond ((null tabuleiro) nil)
        ((= i 0) (cons (substituir-posicao j (car tabuleiro) valor) (cdr tabuleiro)))
        (t (cons (car tabuleiro) (substituir (1- i) j (cdr tabuleiro) valor)))
  )
)

;; Função que recebe o tabuleiro e o valor a procurar e
;; retorna a posição (i j) em que se encontra o valor. Caso o valor não se encontre no tabuleiro deverá ser retornado NIL.
(defun posicao-valor (tabuleiro valor &optional (linha-valor 0))
  "Retorna a posicao do valor no tabuleiro"
  (cond ((null tabuleiro) nil)
        ((not (null (position valor (car tabuleiro)))) (list linha-valor (position valor (car tabuleiro))))
        (t (posicao-valor (cdr tabuleiro) valor (1+ linha-valor)))
  )
)

;; Função que recebe o tabuleiro e devolve a posição (i j) em que se encontra o
;; cavalo. Caso o cavalo não se encontre no tabuleiro deverá ser retornado NIL.
(defun posicao-cavalo (cavalo tabuleiro)
  "Retorna a posicao do cavalo no tabuleiro"
  (posicao-valor tabuleiro cavalo)
)

;; Predicao que recebe um tabuleiro e 
;; verifica se o cavalo está colocado no tabuleiro.
(defun cavalo-colocado-p (tabuleiro cavalo)
  "Verifica se o cavalo está colocado no tabuleiro"
  (cond ((posicao-cavalo cavalo tabuleiro) t)
        (t nil)
  )
)

;; Função que recebe o tabuleiro, o valor de destino e o valor a remover-se duplo (por default o maior valor do tabuleiro) e
;; retorna o tabuleiro com as regras aplicadas.
(defun aplicar-regras (tabuleiro valor-destino &optional (valor-a-remover-se-duplo (maior-numero-tabuleiro tabuleiro)))
  "Aplica as regras do jogo"
  (cond ((duplop valor-destino) ; Se o valor de destino for duplo, remove o valor de valor-a-remover-se-duplo (por default o maior valor do tabuleiro)
          (let ((posicao-valor-a-remover (posicao-valor tabuleiro valor-a-remover-se-duplo)))
            (cond ((null posicao-valor-a-remover) tabuleiro)
                  (t (substituir (first posicao-valor-a-remover) (second posicao-valor-a-remover) tabuleiro))
            )
          )
        )
        ((not (null (posicao-valor tabuleiro (simetrico valor-destino))))  ; Se o valor simétrico do valor de destino estiver no tabuleiro, remove-o
          (let ((posicao-valor-a-remover (posicao-valor tabuleiro (simetrico valor-destino))))
           (substituir (first posicao-valor-a-remover) (second posicao-valor-a-remover) tabuleiro)
          )
        )
        (t tabuleiro)
  )
)

;;; Movimentos

;; Predicado que recebe o cavalo, a posição de destino e o tabuleiro e
;; verifica se a posição de destino é válida.
(defun movimento-valido-p (cavalo destino tabuleiro)
  "Verifica se a posicao de destino é valida"
  (cond ((null destino) nil)
          ((movimento-valido-auxiliar destino tabuleiro) 
            (not (ameacado-p cavalo destino tabuleiro))
          )
          (t nil)
  )
)

;; Função auxiliar que recebe a posição de destino e o tabuleiro e
;; verifica se a posição de destino é válida.
(defun movimento-valido-auxiliar (destino tabuleiro)
  "Função auxiliar que verifica se a posicao de destino é valida"
  (let ((n (length tabuleiro)))
    (cond ((or (< (first destino) 0) (< (second destino) 0)) nil)
          ((or (>= (first destino) n) (>= (second destino) n)) nil)
          ((eq (celula (first destino) (second destino) tabuleiro) nil) nil)
          (t t)
    )
  )
)

;; Predicado que recebe o cavalo, a posição de destino e o tabuleiro e
;; verifica se a posição de destino está ameaçada pelo cavalo oposto.
(defun ameacado-p (cavalo destino tabuleiro)
  "Verifica se a posicao de destino está ameacada pelo cavalo oposto"
  (let ((cavalo-oposto (cond ((= cavalo -1) -2) ((= cavalo -2) -1))))
    (cond ((null destino) nil)
          ((null (posicao-cavalo cavalo-oposto tabuleiro)) nil)
          ((null (movimentos-possiveis cavalo-oposto tabuleiro)) nil)
          ((lista-contem destino (movimentos-possiveis cavalo-oposto tabuleiro)) t)
    )
  )
)

;; Função que recebe o cavalo e o tabuleiro e 
;;retorna uma lista com todas as posições possíveis para o cavalo.
(defun movimentos-possiveis (cavalo tabuleiro)
  "Retorna uma lista com todas as posicoes possiveis para o cavalo"
  (let ((posicao (posicao-cavalo cavalo tabuleiro)))
    (cond ((null posicao) nil)
          (t (let* ((i (first posicao))
                    (j (second posicao))
                    (lista-movimentos (list (list (+ i 2) (+ j 1)) (list (+ i 2) (- j 1)) (list (- i 2) (+ j 1)) (list (- i 2) (- j 1))
                                           (list (+ i 1) (+ j 2)) (list (+ i 1) (- j 2)) (list (- i 1) (+ j 2)) (list (- i 1) (- j 2)))))
                (remove-if-not (lambda (pos) (movimento-valido-auxiliar pos tabuleiro)) lista-movimentos)
              )
          )
    )
  )
)

;; Função auxiliar que recebe o cavalo, a posição de destino e o tabuleiro e
;; retorna o tabuleiro com o cavalo movido e NIL na casa de onde partiu. Retorna NIL caso a posição de destino não seja válida.
(defun mover-cavalo (cavalo destino tabuleiro)
  "Move o cavalo para a posição de destino"
  (cond ((not (movimento-valido-p cavalo destino tabuleiro)) nil)
        (t (let* ((posicao (posicao-cavalo cavalo tabuleiro))
                 (tabuleiro-substituido-posicao (substituir (first posicao) (second posicao) tabuleiro))
                 (valor-destino (celula (first destino) (second destino) tabuleiro)))
              (aplicar-regras (substituir (first destino) (second destino) tabuleiro-substituido-posicao cavalo) valor-destino)
            )
        )
  )
)