;;;; testes.lisp
;;;; Ficheiro que carrrega todos os testes
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(in-package :testes)

;;; Funções de teste

;; Função que verifica se o valor esperado é igual ao valor real
(defun verificar-igual (valor-esperado valor-real &optional (nome-teste "*TESTE-GENERICO*"))
  "Verifica se o valor esperado é igual ao valor real"
  (cond ((equal valor-real valor-esperado) (format t "# ~40,1,1,@<'~a'~> | -~%" nome-teste))
        (t (progn (format t "# ~40,1,1,@<'~a'~> | X~%" nome-teste)
                  (format t "  = valor esperado: ~a~%" valor-esperado)
                  (format t "  = valor obtido: ~a~%" valor-real)
            )
        )
  )
)

;; Função que verifica se o valor esperado é diferente do valor real
(defun verificar-nao-igual (valor-esperado valor-real &optional (nome-teste "*TESTE-GENERICO*"))
  "Verifica se o valor esperado é diferente do valor real"
  (cond ((not (equal valor-real valor-esperado)) (format t "# ~40,1,1,@<'~a'~> | -~%" nome-teste))
        (t (progn (format t "# ~40,1,1,@<'~a'~> | X~%" nome-teste)
                  (format t "  = valor esperado: ~a~%" valor-esperado)
                  (format t "  = valor obtido: ~a~%" valor-real)
            )
        )
  )
)

;;; Testes

;; Função que carrega todos os testes
(defun executar-testes ()
  "Executa todos os testes"
  ;; Executar ficheiros de teste
  (load (merge-pathnames "t/jogo-testes.lisp" (5::caminho-raiz)) :verbose nil)
  (load (merge-pathnames "t/algoritmo-testes.lisp" (5::caminho-raiz)) :verbose nil)
  (load (merge-pathnames "t/interact-testes.lisp" (5::caminho-raiz)) :verbose nil)
)

(defun executar-jogo-testes ()
  "Executa os testes do jogo"
  ;; Executar ficheiro de teste
  (load (merge-pathnames "t/jogo-testes.lisp" (caminho-raiz)) :verbose nil)
)

(defun executar-algoritmo-testes ()
  "Executa os testes do algoritmo"
  ;; Executar ficheiro de teste
  (load (merge-pathnames "t/algoritmo-testes.lisp" (caminho-raiz)) :verbose nil)
)

(defun executar-interact-testes ()
  "Executa os testes do interact"
  ;; Executar ficheiro de teste
  (load (merge-pathnames "t/interact-testes.lisp" (caminho-raiz)) :verbose nil)
)
