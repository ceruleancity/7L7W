; find
; 1 - examples of clojure sequences
;   http://clojure.org/sequences
;   http://stackoverflow.com/questions/1989301/clojure-sequence-back-to-vector
;   http://en.wikibooks.org/wiki/Clojure_Programming/Examples/API_Examples#Sequences
; 
; 2 - The formal definition of a clojure function
;   http://clojure.org/functional_programming#Functional%20Programming--First-class%20functions
;   
; 3 - A script for quickly invoking the repl in your environment
;   http://clojure.org/getting_started - doesn't include script, easy to write
;       cd C:\Dev\Clojure\clojure-1.6.0\
;       java -cp clojure-1.6.0.jar clojure.main

; do
; 1 - implement a function called (big st n) that returns true if a string is is longer
; than n characters
(defn big [st n] (> (count st) n))

; 2 - write a function called (collection-type col) that returns :list :map or :vector
based on the type of collection col
(defn collection-type
   "returns collection type for list map or vector"
   [col]
   (let [look-up {clojure.lang.PersistentList       :list,
                  clojure.lang.PersistentArrayMap   :map,
                  clojure.lang.PersistentVector     :vector}]
       (look-up (type col))))

(defn shitty-fib
	"shittily finds the nth fibonacci number"
	[n i x1 x2]
	(if (= n i)
		(+ x1 x2)
		(shitty-fib n (inc i) x2 (+ x1 x2))))

(defn shitty-fib-wrapper
	"shittily wraps shitty-fib"
	[n]
	(if (= n 0)
		1
		(if (= n 1)
			1
			(shitty-fib n 2 1 1))))

(defn fib
	"TODO make not shitty"
	[n]
	(shitty-fib-wrapper n))

(defn factl-wrapper
	""
	[i prod]
	(if (= i 1)
		prod
		(factl-wrapper (dec i) (* (dec i) prod))))

; (defn factl-broken
; 	""
; 	[i & prod]
; 	(if (= nil prod)
; 		(if (= i 1)
; 			1
; 			(factl2 (- i 1) (* (- i 1) i)))
; 		(if (= i 1)
; 			(int prod)
; 			(factl2 (- i 1) (* (- i 1) (int prod))))))

(defn factl
	"hopefully calculates factorial"
	[n]
	(factl-wrapper n n))


(println "begin tests...")
(println (fib 1))
(println (fib 1))
(println (fib 2))
(println (fib 3))
(println (fib 5))
(println (fib 8))
(println (fib 13))
(println (fib 21))
(println (fib 34))
(println (fib 55))
(println (fib 89))
(println (factl 1))
(println (factl 1))
(println (factl 2))
(println (factl 3))
(println (factl 5))
(println (factl 8))
(println (factl 13))
(println (fib (factl 4)))
(println "...tests done")