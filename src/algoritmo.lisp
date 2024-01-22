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
(defun negamax-alfabeta (no profundidade alfa beta jogador jogadores funcao-sucessores funcao-utilidade &optional (nos-gerados 0))
  "Algoritmo negamax com cortes alfa-beta"
  (let ((sucessores (funcall funcao-sucessores no jogador)))
              (cond ((or (= profundidade 0) (null sucessores)) (cond ((equal jogador (first jogadores)) (list no (funcall funcao-utilidade no jogador))) (t (list no (- (funcall funcao-utilidade no jogador))))))
                    (t (let* ((melhor-valor (funcall 'no-max-utilidade (mapcar (lambda (suc) (inverter-sinal-utilidade (negamax-alfabeta suc (1- profundidade) (- beta) (- alfa) (trocar-jogador jogador jogadores) jogadores funcao-sucessores funcao-utilidade (+ nos-gerados (length sucessores))))) sucessores) jogador))
                              (alfa-novo (max alfa (second melhor-valor))))
                          (cond ((>= alfa-novo beta) (list no most-negative-double-float))
                                (t melhor-valor)
                          )
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