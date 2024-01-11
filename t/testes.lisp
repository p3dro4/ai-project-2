;;;; testes.lisp
;;;; Ficheiro que carrrega todos os testes
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

;;; Carregar ficheiros de código

;; Carrega o caminho para os ficheiros de código
(defun inicializar-testes ()
  "Inicializa os testes"
  (format t ";; A carregar ficheiros...~%")
  (cond ((not (null *load-pathname*)) (progn (carregar-funcao-caminho-raiz *load-pathname*) (format t ";; Ficheiros carregados.~%")))
        ((not (null *compile-file-pathname*)) (progn (carregar-funcao-caminho-raiz *compile-file-pathname*) (format t ";; Ficheiros carregados.~%")))
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
(defun executa-testes ()
  "Executa todos os testes"
  ;; Carregar ficheiros de código
  (load (merge-pathnames "src/jogo.lisp" (caminho-raiz)) :verbose nil)
  (load (merge-pathnames "src/algoritmo.lisp" (caminho-raiz)) :verbose nil)
  (load (merge-pathnames "src/interact.lisp" (caminho-raiz)) :verbose nil)

  ;; Carregar ficheiros de teste
  (load (merge-pathnames "t/jogo-testes.lisp" (caminho-raiz)) :verbose nil)
  (load (merge-pathnames "t/algoritmo-testes.lisp" (caminho-raiz)) :verbose nil)
  (load (merge-pathnames "t/interact-testes.lisp" (caminho-raiz)) :verbose nil)
)

(defun executa-jogo-testes ()
  "Executa os testes do jogo"
  ;; Carregar ficheiros de código
  (load (merge-pathnames "src/jogo.lisp" (caminho-raiz)) :verbose nil)

  ;; Carregar ficheiros de teste
  (load (merge-pathnames "t/jogo-testes.lisp" (caminho-raiz)) :verbose nil)
)

(defun executa-algoritmo-testes ()
  "Executa os testes do algoritmo"
  ;; Carregar ficheiros de código
  (load (merge-pathnames "src/algoritmo.lisp" (caminho-raiz)) :verbose nil)

  ;; Carregar ficheiros de teste
  (load (merge-pathnames "t/algoritmo-testes.lisp" (caminho-raiz)) :verbose nil)
)

(defun executa-interact-testes ()
  "Executa os testes do interact"
  ;; Carregar ficheiros de código
  (load (merge-pathnames "src/interact.lisp" (caminho-raiz)) :verbose nil)

  ;; Carregar ficheiros de teste
  (load (merge-pathnames "t/interact-testes.lisp" (caminho-raiz)) :verbose nil)
)

;; Correr todos os testes
(inicializar-testes)