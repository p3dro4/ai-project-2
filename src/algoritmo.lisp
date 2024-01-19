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

;;; Nós
(defun no-teste ()
  "Retorna um nó de teste"
  (cria-no (tabuleiro-ambos-colocados) 2 (cria-no (tabuleiro-cavalo-branco) 1 (cria-no (tabuleiro-teste))))
)

;;; Seletores

;; Retorna o estado do nó dado como argumento
(defun no-estado (no)
  "Retorna o estado do nó dado como argumento"
  (first no)
)

;; Retorna o custo do nó dado como argumento
(defun no-profundidade (no)
  "Retorna o custo do nó dado como argumento"
  (second no)
)

;; Retorna o nó pai do nó dado como argumento
(defun no-pai (no)
  "Retorna o nó pai do nó dado como argumento"
  (third no)
)

;; Algoritmo negamax com cortes alfa-beta
(defun negamax-alfabeta (no profundidade alfa beta jogador jogadores funcao-sucessores funcao-utilidade &optional (cache (make-hash-table)))
  "Algoritmo negamax com cortes alfa-beta"
  (let ((sucessores (funcall funcao-sucessores no jogador)))
              (cond ((or (= profundidade 0) (null sucessores)) (cond ((equal jogador (first jogadores)) (funcall funcao-utilidade no jogador)) (t (- (funcall funcao-utilidade no jogador)))))
                    (t (let* ((melhor-valor (apply 'max (mapcar (lambda (suc) (max (- (negamax-alfabeta suc (1- profundidade) (- beta) (- alfa) (trocar-jogador jogador jogadores) jogadores funcao-sucessores funcao-utilidade cache)))) sucessores)))
                              (alfa-novo (max alfa melhor-valor)))
                          (cond ((>= alfa-novo beta) most-negative-double-float)
                                (t melhor-valor)
                          )
                       )
                    )
              )
  )
)

;; Função que altera o jogador atual.
(defun trocar-jogador (jogador-atual jogadores)
  "Função que altera o jogador atual"
  (cond ((equal jogador-atual (first jogadores)) (second jogadores))
        ((equal jogador-atual (second jogadores)) (first jogadores))
  )
)