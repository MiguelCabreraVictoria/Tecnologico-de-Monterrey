#lang racket 

(provide animals pollito-lyrics)

(define animals
  '("Pollito" "Gallina" "Pavo" "Paloma" "Gato" "Perro" "Cabra" "Cordero" "Vaca" "Toro"))
(define sounds
  '("Pio" "Coo" "Coroco" "Glu Glu Glue" "Ruu" "Miao" "Guaa Guau" "Mee" "Bee" "Moo" "Muu"))

(define (pollito-lyrics)
  (define (generate-lyrics animals sounds)
