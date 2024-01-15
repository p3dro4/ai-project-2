;;;; algoritmo.lisp
;;;; Contém a implementação do algoritmo de jogo independente do domínio
;;;; Autores: 202100230 - Pedro Anjos, 202100225 - André Meseiro

(in-package :5)

;;; Construtor

;; Cria um nó com o estado, a profundidade e o nó pai
(defun cria-no (estado &optional (g 0) (pai nil))
  "Cria um nó com o estado, o custo e o nó pai"
  (list estado g pai)
)
(export 'cria-no)

;;; Seletores

;; Retorna o estado do nó dado como argumento
(defun no-estado (no)
  "Retorna o estado do nó dado como argumento"
  (first no)
)
(export 'no-estado)

;; Retorna o custo do nó dado como argumento
(defun no-profundidade (no)
  "Retorna o custo do nó dado como argumento"
  (second no)
)
(export 'no-profundidade)

;; Retorna o nó pai do nó dado como argumento
(defun no-pai (no)
  "Retorna o nó pai do nó dado como argumento"
  (third no)
)
(export 'no-pai)

;;; Algoritmo alfa-beta

;; TODO: Função alfa-beta

;; TODO: Função max

;; TODO: Função min