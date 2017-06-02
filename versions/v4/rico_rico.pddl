(define (problem ricoRico) (:domain ricoRico)
  (:objects
    Mon Tue Wed Thu Fri DummyD - day
    Spaghetti_Bolognese Mediterranean_Salad Vegan_Sandwich Mushroom_risotto Guacamole_with_tomatoes Sushi American_burger - mainCourse
    Roast_pork_with_prunes Spanish_omelette Paella Tuna_steak Chicken_parmesan Lamb_tagine Couscous_meatloaf - secondCourse
    Fish Meat Soup Salad Rice Pasta Vegetables DummyC - category
  )
  (:init
    (incompatible Spaghetti_Bolognese Paella)
    (incompatible Mediterranean_Salad Chicken_parmesan)
    (incompatible Vegan_Sandwich Roast_pork_with_prunes)
    (incompatible Mushroom_risotto Couscous_meatloaf)
    (incompatible Guacamole_with_tomatoes Lamb_tagine)

    (classified Spaghetti_Bolognese Pasta)
    (classified Mediterranean_Salad Salad)
    (classified Vegan_Sandwich Vegetables)
    (classified Mushroom_risotto Rice)
    (classified Guacamole_with_tomatoes Vegetables)
    (classified Sushi Fish)
    (classified American_burger Meat)
    (classified Roast_pork_with_prunes Meat)
    (classified Spanish_omelette Meat)
    (classified Paella Rice)
    (classified Tuna_steak Fish)
    (classified Chicken_parmesan Meat)
    (classified Lamb_tagine Meat)
    (classified Couscous_meatloaf Meat)

    (dayBefore DummyD Mon)
    (dayBefore Mon Tue)
    (dayBefore Tue Wed)
    (dayBefore Wed Thu)
    (dayBefore Thu Fri)

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
    
    (= (calories Mediterranean_Salad) 100)
    (= (calories Vegan_Sandwich) 300)
    (= (calories Mushroom_risotto) 500)
    (= (calories Guacamole_with_tomatoes) 600)
    (= (calories Sushi) 700)
    (= (calories American_burger) 1000)
    (= (calories Roast_pork_with_prunes) 800)
    (= (calories Spanish_omelette) 400)
    (= (calories Paella) 700)
    (= (calories Tuna_steak) 600)
    (= (calories Chicken_parmesan) 500)
    (= (calories Lamb_tagine) 500)
    (= (calories Couscous_meatloaf) 200)
  )
  (:goal
    (forall (?d - day)
      (and (mainReady ?d) (secondReady ?d))
    )
  )
)
