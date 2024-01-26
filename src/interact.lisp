;;;; interact.lisp
;;;; Carrega os outros ficheiros de código, escreve e lê de ficheiros e trata da interação com o utilizador
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(defpackage :5
  (:use 
    :cl
    :cl-user
  )
)

(defpackage :testes
  (:use 
    :cl
    :cl-user
    :5)
)

(in-package :5)

;;; Carregar ficheiros de código e definir funções necessárias

;; Função que inicializa o programa
(defun inicializar ()
  "Inicializa o programa"
  (format t ";; A carregar ficheiros...~%")
  (cond ((not (null *load-pathname*)) (progn (carregar-componentes *load-pathname*) (format t ";; Ficheiros carregados.~%")))
        ((not (null *compile-file-pathname*)) (progn (carregar-componentes *compile-file-pathname*) (format t ";; Ficheiros carregados.~%")))
        (t (error "Falha ao carregar ficheiros!~%"))
  )
)

;; Função que carrega a função caminho-raiz
(defun carregar-funcao-caminho-raiz (caminho)
  "Carrega a função caminho-raiz"
  (defun caminho-raiz ()
    "Retorna o caminho raiz do projeto"
    (make-pathname :directory (pathname-directory (merge-pathnames "../" caminho )))
  )
)

;; Função que carrega todos os ficheiros de código e
;; define as funções necessárias
(defun carregar-componentes (caminho)
  "Carrega todos os ficheiros de código e define as funções necessárias"
  (carregar-funcao-caminho-raiz caminho)
  (carregar-ficheiros-codigo)
  (carregar-ficheiros-teste)
)

;; Função que carrega os ficheros de código
(defun carregar-ficheiros-codigo ()
  "Carrega os ficheiros de código"
  (load (merge-pathnames "src/jogo.lisp" (caminho-raiz)) :verbose nil)
  (load (merge-pathnames "src/algoritmo.lisp" (caminho-raiz)) :verbose nil)
)

;; Função que carrega os ficheiros de teste
(defun carregar-ficheiros-teste ()
  "Carrega os ficheiros de teste"
  (load (merge-pathnames "t/testes.lisp" (caminho-raiz)) :verbose nil)
)

;;; Funções de jogo

;; Função que recebe um estado e retorna o estado resultante da jogada do computador
(defun jogar (estado tempo &optional (cache (make-hash-table)))
  "Função que recebe um estado e retorna o estado resultante da jogada do computador"
  (alfabeta (cria-no estado) 5 most-negative-double-float most-positive-double-float *cavalo-branco* (list *cavalo-branco* *cavalo-preto*) 'sucessores 'avaliar-estado cache tempo)
)

;;; Funções de interação com o utilizador

;; Função que inicia o jogo
(defun iniciar (&optional (cache (make-hash-table)))
  "Função que inicia o jogo"
  (format t "~46,1,1,'#:@< jogo do cavalo ~>~%#~44,1,1,:@<~>#~%#~44,1,1,:@<~>#~%")
  (format t "#~44,1,1,:@<1 - humano VS computador~>#~%")
  (format t "#~44,1,1,:@<2 - computador VS computador~>#~%")
  (format t "#~44,1,1,:@<0 - sair da aplicacao~>#~%")
  (format t "#~44,1,1,:@<~>#~%#~44,1,1,:@<~>#~%~46,1,1,'#:@<~>~%")
  (let ((opcao (ler-opcao 2)))
    (cond ((= opcao 1) (humano-vs-computador cache))
          ((= opcao 2) (progn (format t "Nao implementado!~%~%") (iniciar)))
          ((= opcao 0) (format t "A sair da aplicacao...~%"))
    )
  )
)

;; TODO: Humano vs Computador
(defun humano-vs-computador (cache)
  (let ((jogador (jogador-a-comecar)))
    (cond ((null jogador) (iniciar cache))
          (t (progn (format t "~46,1,1,'#:@< jogadores ~>~%#~44,1,1,:@<~>#~%#~44,1,1,:@<~>#~%")
                    (format t "#~44,1,1,:@<jogador 1 (~a) - cavalo branco~>#~%" (first (first jogador)))
                    (format t "#~44,1,1,:@<jogador 2 (~a) - cavalo preto~>#~%" (first (second jogador)))
                    (format t "#~44,1,1,:@<~>#~%#~44,1,1,:@<~>#~%~46,1,1,'#:@<~>~%")
                    (let ((tempo-limite (tempo-limite-computador))
                          (tabuleiro (tabuleiro-aleatorio)))
                      (ciclo-de-jogo (cria-no tabuleiro) tempo-limite jogador cache)
                    )
              )
          )
    )
  )
)

;; TODO: Computador vs Computador

;; TODO: Campeonato
(defun campeonato (estado tempo jogadores cache)
  (cond ((equal (first (first jogadores)) "humano") (campeonato (jogada-humano estado tempo cache) tempo (reverse jogadores) cache))
        (t (let ((jogada (jogar estado tempo cache)))
            (format t "~46,1,1,'#:@< computador ~>~%")
            (escreve-tabuleiro-formatado (first jogada) t t t 1)
            (format t "Utilidade: ~a~%" (second jogada))
            (format t "Tempo de execucao: ~a~%" (third jogada))
            (format t "~46,1,1,'#:@<~>~%~%")
          )
        )
  )
)

;; TODO: Jogada humano
(defun jogada-humano (estado tempo cache)
  (let ((jogador (jogador-proximo estado)))
    (cond ((not (cavalo-colocado-p jogador (no-estado estado))) 
            (let* ((novo-estado (cria-no (colocar-cavalo (no-estado estado) jogador) (1+ (no-profundidade estado)) estado)))
              (format t "~46,1,1,'#:@< humano ~>~%")
              (escreve-tabuleiro-formatado (no-estado novo-estado) t t t 1)
              (format t "Utilidade: ~a~%" (avaliar-no novo-estado jogador))
              (format t "~46,1,1,'#:@<~>~%~%")
              novo-estado
            )
          )
          (t (let ((posicao (jogada-posicao estado jogador)))
            (format t "Jogada: ~a~%" posicao)
            )
          )
    )
  )
)

;; TODO: Jogada posiçao
(defun jogada-posicao (no cavalo)
  (let ((movimentos (movimentos-possiveis cavalo (no-estado no))))
    (format t "Jogadas possiveis:~%")
    (format t "~c~a (~a ~a)" (coluna-para-letra (second (first movimentos))) (first (first movimentos)) (first (first movimentos)) (second (first movimentos)))
    (mapcar (lambda (mov) (format t ", ~c~a (~a ~a)" (coluna-para-letra (second mov)) (first mov) (first mov) (second mov))) (rest movimentos))
    (format t "~%")
    (let* ((linha (ler-opcao (length (no-estado no)) "Escolha a linha > " nil))
           (coluna (ler-opcao (length (first (no-estado no))) "Escolha a coluna > ")))
      (cond ((and (integerp coluna) (integerp linha) (lista-contem (list linha coluna) movimentos)) (list linha coluna))
            (t (progn (format t "valor invalido!~%") (jogada-posicao no cavalo)))
      )
    )
  )
)

;; TODO: Tempo limite do computador
(defun tempo-limite-computador (&optional (limite-superior 5000) (limite-inferior 1000))
  "Função que lê o tempo limite do computador"
  (format t "Tempo limite computador [~a,~a](ms) > " limite-inferior limite-superior)
  (let ((valor (read)))
    (cond ((and (integerp valor) (>= valor limite-inferior) (<= valor limite-superior)) (progn (format t "~%") valor))
          (t (progn (format t "valor invalido!~%") (tempo-limite-computador limite-superior limite-inferior)))
    )
  )
)

;; Função que retorna o jogador a começar
(defun jogador-a-comecar ()
  "Função que retorna o jogador a começar"
  (format t "#~44,1,1,'#:@< jogador a comecar ~>#~%#~44,1,1,:@<~>#~%#~44,1,1,:@<~>#~%")
  (format t "#~44,1,1,:@<1 - humano~>#~%")
  (format t "#~44,1,1,:@<2 - computador~>#~%")
  (format t "#~44,1,1,:@<0 - voltar~>#~%")
  (format t "#~44,1,1,:@<~>#~%#~44,1,1,:@<~>#~%~46,1,1,'#:@<~>~%")
  (let ((opcao (ler-opcao 2 "Escolha o jogador > ")))
    (cond ((= opcao 1) (list (list "humano" *cavalo-branco*) (list "computador" *cavalo-preto*)))
          ((= opcao 2) (list (list "computador" *cavalo-branco*) (list "humano" *cavalo-preto*)))
          ((= opcao 0) nil)
    )
  )
)

;; Função que lê a opção do utilizador
(defun ler-opcao (limite &optional (prompt "Escolha > ") (enter-apos t))
  "Lê a opção do utilizador"
  (format t "~a" prompt)
  (let ((opcao (read)))
    (cond ((and (integerp opcao) (<= 0 opcao limite)) (progn (cond (enter-apos (format t "~%"))) opcao))
          (t (progn (format t "opcao invalida!~%") (ler-opcao limite prompt)))
    )
  )
)

;; TODO: escrever jogadas no log

(inicializar)