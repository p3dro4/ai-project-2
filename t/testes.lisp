;;;; testes.lisp
;;;; Ficheiro que carrrega todos os testes
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(defpackage :testes
    (:export verificar-igual verificar-nao-igual)
    (:use :common-lisp)
)

;;; Carregar ficheiros de código

;; Carrega o caminho para os ficheiros de código
(defun inicializar-testes ()
  "Inicializa o programa"
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

(defun verificar-igual (valor-esperado valor-real &key (nome-teste "*TESTE-GENERICO*"))
    (cond ((equal valor-real valor-esperado) (format t "# ~a | -~%" nome-teste))
          (t (progn (format t "# ~a | X~%" nome-teste)
                    (format t " =valor esperado: ~a~%" valor-esperado)
                    (format t " =valor obtido: ~a~%" valor-real)
             )
          )
    )
)

(defun verificar-nao-igual (valor-esperado valor-real &key (nome-teste "*TESTE-GENERICO*"))
    (cond ((not (equal valor-real valor-esperado)) (format t "# ~a | -~%" nome-teste))
          (t (progn (format t "# ~a | X~%" nome-teste)
                    (format t " =valor esperado: ~a~%" valor-esperado)
                    (format t " =valor obtido: ~a~%" valor-real)
             )
          )
    )
)

;;; Testes

;; Função que carrega todos os testes
(defun correr-testes ()
    ;; Carregar ficheiros de código
    (load (merge-pathnames "src/jogo.lisp" (caminho-raiz)) :verbose nil)
    (load (merge-pathnames "src/algoritmo.lisp" (caminho-raiz)) :verbose nil)
    (load (merge-pathnames "src/interact.lisp" (caminho-raiz)) :verbose nil)

    ;; Carregar ficheiros de teste
    (load (merge-pathnames "t/jogo-testes.lisp" (caminho-raiz)) :verbose nil)
    (load (merge-pathnames "t/algoritmo-testes.lisp" (caminho-raiz)) :verbose nil)
    (load (merge-pathnames "t/interact-testes.lisp" (caminho-raiz)) :verbose nil)
)

;; Correr todos os testes
(inicializar-testes)