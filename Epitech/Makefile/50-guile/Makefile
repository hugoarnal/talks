# Define the Guile function to generate a list of numbers from 1 to N
define generate-sequence
  (let ((result '())
        (n (string->number "$(1)")))
    (do ((i 1 (+ i 1)))
        ((> i n))
      (set! result (append result (list (number->string i)))))
    (string-join result " "))
endef

.PHONY: numbers
numbers:
	@echo "Generated numbers: $(guile $(call generate-sequence,10))"
