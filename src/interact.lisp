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
(defun jogar (estado tempo)
  "Função que recebe um estado e retorna o estado resultante da jogada do computador"
  (let* ((jogador-anterior (jogador-anterior estado))
         (jogada (alfabeta estado 10 most-negative-double-float most-positive-double-float jogador-anterior (list *cavalo-branco* *cavalo-preto*) 'sucessores 'avaliar-no))
         (jogada-realizada (jogada-a-realizar estado (first jogada))))
    (list jogada-realizada (second jogada) (third jogada))
  )
)

;;; Funções de interação com o utilizador

;; Função que inicia o jogo
(defun iniciar ()
  "Função que inicia o jogo"
  (format t "~46,1,1,'#:@< jogo do cavalo ~>~%")
  (format t "#~44,1,1,:@<~>#~%")
  (format t "#~44,1,1,:@<~>#~%")
  (format t "#~44,1,1,:@<1 - humano VS computador~>#~%")
  (format t "#~44,1,1,:@<2 - computador VS computador~>#~%")
  (format t "#~44,1,1,:@<0 - sair da aplicacao~>#~%")
  (format t "#~44,1,1,:@<~>#~%")
  (format t "#~44,1,1,:@<~>#~%")
  (format t "~46,1,1,'#:@<~>~%")
  (let ((opcao (ler-opcao 2)))
    (cond ((= opcao 1) (progn (format t "Nao implementado!~%~%") (iniciar)))
          ((= opcao 2) (progn (format t "Nao implementado!~%~%") (iniciar)))
          ((= opcao 0) (format t "A sair da aplicacao...~%"))
    )
  )
)

;; Função que lê a opção do utilizador
(defun ler-opcao (limite &optional (prompt "Escolha > "))
  "Lê a opção do utilizador"
  (format t "~a" prompt)
  (let ((opcao (read)))
    (cond ((and (integerp opcao) (<= 0 opcao limite)) opcao)
          (t (progn (format t "opcao invalida!~%") (ler-opcao limite prompt)))
    )
  )
)

(inicializar)