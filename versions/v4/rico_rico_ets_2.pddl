(define (problem ricoRico) (:domain ricoRico)
  (:objects
    Mon Tue Wed Thu Fri DummyD - day
    Spaghetti_Bolognese Mediterranean_Salad Vegan_Sandwich Mushroom_risotto Guacamole_with_tomatoes Sushi American_burger Broccoli_quiche Kirmizi_Mercimek_Corbasi Chinese_Noodles_With_Vegetables Chana_masala Chinese_tiger_salad Shumai - mainCourse
    Roast_pork_with_prunes Spanish_omelette Paella Tuna_steak Chicken_parmesan Lamb_tagine Couscous_meatloaf Coq_au_vin Mapo_tofu Persian_pie Burrito_pie Spicy_seafood_stew - secondCourse
    Fish Meat Soup Salad Rice Pasta Vegetables DummyC - category
  )
  (:init
    (incompatible Spaghetti_Bolognese Paella)
    (incompatible Mediterranean_Salad Chicken_parmesan)
    (incompatible Kirmizi_Mercimek_Corbasi Chicken_parmesan)
    (incompatible Vegan_Sandwich Roast_pork_with_prunes)
    (incompatible Mushroom_risotto Couscous_meatloaf)
    (incompatible Guacamole_with_tomatoes Lamb_tagine)
    (incompatible Chinese_Noodles_With_Vegetables Spicy_seafood_stew)
    (incompatible Chinese_tiger_salad Burrito_pie)
    (incompatible Sushi Coq_au_vin)

    ; Main courses
    (classified Spaghetti_Bolognese Pasta)
    (classified Mediterranean_Salad Salad)
    (classified Vegan_Sandwich Vegetables)
    (classified Mushroom_risotto Rice)
    (classified Guacamole_with_tomatoes Vegetables)
    (classified Sushi Fish)
    (classified American_burger Meat)
    (classified Broccoli_quiche Vegetables)
    (classified Kirmizi_Mercimek_Corbasi Soup)
    (classified Chinese_Noodles_With_Vegetables Soup)
    (classified Chana_masala Soup)
    (classified Chinese_tiger_salad Fish)
    (classified Shumai Rice)
    ; Second courses
    (classified Roast_pork_with_prunes Meat)
    (classified Spanish_omelette Meat)
    (classified Paella Rice)
    (classified Tuna_steak Fish)
    (classified Chicken_parmesan Meat)
    (classified Lamb_tagine Meat)
    (classified Couscous_meatloaf Meat)
    (classified Coq_au_vin Meat)
    (classified Mapo_tofu Vegetables)
    (classified Persian_pie Pasta)
    (classified Burrito_pie Pasta)
    (classified Spicy_seafood_stew Fish)

    (dayBefore DummyD Mon)
    (dayBefore Mon Tue)
    (dayBefore Tue Wed)
    (dayBefore Wed Thu)
    (dayBefore Thu Fri)

    ; Dummy initializations
    (mainReady DummyD)
    (secondReady DummyD)
    (dayMCClassif DummyD DummyC)
    (daySCClassif DummyD DummyC)

    (servedOnly Paella Thu)
    (servedOnly Spanish_omelette Mon)
    (servedOnly Lamb_tagine Wed)
    (servedOnly Sushi Fri)

    (= (minCalories) 1000)
    (= (maxCalories) 1500)


    ; Main courses
    (= (calories Spaghetti_Bolognese) 900)
    (= (calories Mediterranean_Salad) 820)
    (= (calories Vegan_Sandwich) 890)
    (= (calories Mushroom_risotto) 790)
    (= (calories Guacamole_with_tomatoes) 810)
    (= (calories Sushi) 620)
    (= (calories American_burger) 1000)
    (= (calories Broccoli_quiche) 540)
    (= (calories Kirmizi_Mercimek_Corbasi) 800)
    (= (calories Chinese_Noodles_With_Vegetables) 860)
    (= (calories Chana_masala) 880)
    (= (calories Chinese_tiger_salad) 920)
    (= (calories Shumai) 990)
    ; Second Courses
    (= (calories Roast_pork_with_prunes) 810)
    (= (calories Spanish_omelette) 809)
    (= (calories Paella) 800)
    (= (calories Tuna_steak) 670)
    (= (calories Chicken_parmesan) 820)
    (= (calories Lamb_tagine) 600)
    (= (calories Couscous_meatloaf) 678)
    (= (calories Coq_au_vin) 960)
    (= (calories Mapo_tofu) 800)
    (= (calories Persian_pie) 889)
    (= (calories Burrito_pie) 874)
    (= (calories Spicy_seafood_stew) 900)
  )
  (:goal
    (forall (?d - day)
      (and (mainReady ?d) (secondReady ?d))
    )
  )
)
