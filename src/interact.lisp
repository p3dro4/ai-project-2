;;;; interact.lisp
;;;; Carrega os outros ficheiros de código, escreve e lê de ficheiros e trata da interação com o utilizador
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(defpackage :5
  (:use :cl)
)

(defpackage :testes
  (:use 
    :cl
    :5)
  (:export
    #:executar-testes)
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

(inicializar)