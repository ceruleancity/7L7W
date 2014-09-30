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
; based on the type of collection col
(defn collection-type
    "returns collection type for list map or vector"
    [col]
    (let [look-up {clojure.lang.PersistentList       :list,
                   clojure.lang.PersistentArrayMap   :map,
                   clojure.lang.PersistentVector     :vector}]
        (look-up (type col))))