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

;; Função negamax com cortes alfabeta que recebe um nó, uma profundidade, um alfa, um beta, um jogador, uma lista de jogadores, uma função de sucessores e uma função de avaliação 
;; e retorna o valor do nó
(defun negamax (no profundidade alfa beta jogador jogadores funcao-sucessores funcao-avaliacao)
  "Função negamax com cortes alfabeta"
  (let ((sucessores (funcall funcao-sucessores no jogador)))
    (cond ((or (zerop profundidade))
            (* (cond ((equal jogador (first jogadores)) 1) (t -1)) (funcall funcao-avaliacao no jogador)))
          (t (cond ((null sucessores) most-negative-double-float)
                   (t (negamax-auxiliar no sucessores profundidade alfa beta jogador jogadores funcao-sucessores funcao-avaliacao))
              )
          )
        )
    )
)

;; Função auxiliar do negamax
(defun negamax-auxiliar (no sucessores profundidade alfa beta jogador jogadores funcao-sucessores funcao-avaliacao)
  "Função auxiliar do negamax"
  (cond ((null sucessores) most-negative-double-float)
        (t (let* ((valor (- (negamax (car sucessores) (1- profundidade) (- beta) (- alfa) (trocar-jogador jogador jogadores) jogadores funcao-sucessores funcao-avaliacao))))
              (cond ((>= (max alfa valor) beta) valor)
                    (t (max valor (negamax-auxiliar no (cdr sucessores) profundidade (max alfa valor) beta jogador jogadores funcao-sucessores funcao-avaliacao)))
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