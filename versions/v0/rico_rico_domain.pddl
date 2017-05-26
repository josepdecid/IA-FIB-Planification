(define (domain ricoRico)
  (:requirements :strips :typing :adl :equality)
  (:types 
    day - object
    dish - object
    mainCourse - dish secondCourse - dish
  )

  (:predicates
    (incompatible ?mc - mainCourse ?sc - secondCourse)
    (assigned ?day - day ?mc - mainCourse ?sc - secondCourse)
    (dayReady ?d - day)
  )

  (:action assign
    :parameters (?day - day ?mc - mainCourse ?sc - secondCourse)
    :precondition (and (not (dayReady ?day)) (not (incompatible ?mc ?sc))) 
    :effect (and (dayReady ?day) (assigned ?day ?mc ?sc))
  )
)