 ;; the program takes a key value and a list, searches key through list and 
 
  (define (deep-remove key list)
    (
      ;; if sublist is empty, print nothing
      cond ((null? list) '())
      
      ;; check whether sublist is a list
      ( (list? (car list))
        
        ;; if it is a list, recursively repeat procedure for sublists till sublist is empty.
        ;; then, come together the list 
        (
          cons (deep-remove key (car list)) (deep-remove key (cdr list))
        )
        
        ;; pseudo example: list ( list1 list2 ) -> list ( '() list list3  )
        ;;                                      -> list ( '() '() )
      )
    
      ;;search current key is the key sublist, if key is found delete the key as sublist
          
      ( 
        (equal? key (car list)) (deep-remove key (cdr list))
      )
    
      ;;continue without skipping current key
      (
        else (cons (car list) (deep-remove key (cdr list)))
      )
    )
  )
  
  ;; lets use our function to find out our hidden word 
  (deep-remove 'd (deep-remove 'c (deep-remove 't '( t h (d c (a d) (g) t) u v d d ( e d n (i) ) t (r) )))