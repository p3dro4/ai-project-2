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
(defun negamax (no profundidade alfa beta jogador jogadores funcao-sucessores funcao-avaliacao &optional (limite 5000) (tempo-inicial (get-internal-real-time)))
  "Função negamax com cortes alfabeta"
  (let ((sucessores (funcall funcao-sucessores no jogador)))
    (cond ((or (zerop profundidade))
            (list no (* (cond ((equal jogador (first jogadores)) 1) (t -1)) (funcall funcao-avaliacao no jogador))))
          (t (cond ((null sucessores) (list no most-negative-double-float))
                   (t (negamax-auxiliar no sucessores profundidade alfa beta jogador jogadores funcao-sucessores funcao-avaliacao limite tempo-inicial))
              )
          )
        )
    )
)

;; Função auxiliar do negamax
(defun negamax-auxiliar (no sucessores profundidade alfa beta jogador jogadores funcao-sucessores funcao-avaliacao limite tempo-inicial &aux (tempo-atual (get-internal-real-time)))
  "Função auxiliar do negamax"
  (cond ((null sucessores) (list no most-negative-double-float))
        ((>= (* (/ (- tempo-atual tempo-inicial) internal-time-units-per-second) 1000) limite) (list no most-negative-double-float))
        (t (let* ((valor (inverter-sinal-utilidade (negamax (car sucessores) (1- profundidade) (- beta) (- alfa) (trocar-jogador jogador jogadores) jogadores funcao-sucessores funcao-avaliacao limite tempo-inicial))))
              (cond ((>= (max alfa (second valor)) beta) valor)
                    (t (no-max-utilidade (append (list valor) (list (negamax-auxiliar no (cdr sucessores) profundidade (max alfa (second valor)) beta jogador jogadores funcao-sucessores funcao-avaliacao limite tempo-inicial))) jogador))
              )
            )
        )
  )
)

;; Função que retorna o nó com a maior utilidade e a sua utilidade
(defun no-max-utilidade (lista jogador &optional max-util)
  "Função que retorna o nó com a maior utilidade e a sua utilidade"
  (cond ((null lista) max-util)
        ((null max-util) (no-max-utilidade (cdr lista) jogador (car lista)))
        ((> (second (car lista)) (second max-util)) (no-max-utilidade (cdr lista) jogador (car lista)))
        (t (no-max-utilidade (cdr lista) jogador max-util))
  )
)

;; Função que inverte o sinal da utilidade
(defun inverter-sinal-utilidade (utilidade)
  "Função que inverte o sinal da utilidade"
  (cond ((null utilidade) nil)
        (t (list (first utilidade) (- (second utilidade))))
  )
)

;; Função que altera o jogador atual.
(defun trocar-jogador (jogador-atual jogadores)
  "Função que altera o jogador atual"
  (cond ((equal jogador-atual (first jogadores)) (second jogadores))
        ((equal jogador-atual (second jogadores)) (first jogadores))
  )
)