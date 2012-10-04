;;;; shovel.asd

(asdf:defsystem #:shovel
  :depends-on (#:alexandria
               #:split-sequence
               #:mbrezu-utils-base)
  :components
  ((:module
    "common-lisp"
    :components
    ((:module
      "src"
      :components
      ((:file "package")
       (:file "shovel-types" :depends-on ("package"))
       (:module "compiler"
                :depends-on ("package" "shovel-types")
                :components ((:file "types")
                             (:file "tokenizer" :depends-on ("types"))
                             (:file "parser" :depends-on ("types"))
                             (:file "code-generator" :depends-on ("types"))
                             (:file "compiler")))
       (:module "vm"
                :depends-on ("package" "shovel-types")
                :components ((:file "vm")))
       (:file "shovel" :depends-on ("package"
                                    "shovel-types"
                                    "compiler"
                                    "vm"))))))))
