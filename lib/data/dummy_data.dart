import 'package:flutter/material.dart';

import 'package:chefs_book/models/category.dart';
import 'package:chefs_book/models/meal.dart';

var availableCategories = [
  const Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.purple,
  ),
  const Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  const Category(
    id: 'c3',
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  const Category(
    id: 'c4',
    title: 'German',
    color: Colors.amber,
  ),
  const Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  const Category(
    id: 'c6',
    title: 'Exotic',
    color: Colors.green,
  ),
  const Category(
    id: 'c7',
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  const Category(
    id: 'c8',
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  const Category(
    id: 'c9',
    title: 'French',
    color: Colors.pink,
  ),
  const Category(
    id: 'c10',
    title: 'Summer',
    color: Colors.teal,
  ),
  const Category(
    id: 'c11',
    title: 'Mexican',
    color: Colors.cyan,
  ),
  const Category(
    id: 'c12',
    title: 'Barbecue',
    color: Colors.brown,
  ),
  const Category(
    id: 'c13',
    title: 'Desserts',
    color: Colors.deepOrange,
  ),
  const Category(
    id: 'c14',
    title: 'Indian',
    color: Colors.indigo,
  ),
  const Category(
    id: 'c15',
    title: 'Vegan',
    color: Colors.lime,
  ),
  const Category(
    id: 'c16',
    title: 'Seafood',
    color: Colors.blueGrey,
  ),
  const Category(
    id: 'c17',
    title: 'Salads',
    color: Colors.yellow,
  ),
  const Category(
    id: 'c18',
    title: 'Snacks',
    color: Colors.deepPurple,
  ),
  const Category(
    id: 'c19',
    title: 'Comfort Food',
    color: Colors.grey,
  ),
  const Category(
    id: 'c20',
    title: 'Mediterranean',
    color: Colors.pinkAccent,
  ),
];

const dummyMeals = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter'
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Classic Hamburger',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Wiener Schnitzel',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    ingredients: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices'
    ],
    steps: [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Delicious Orange Mousse',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
    ingredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Pancakes',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
    ingredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
    ingredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Chocolate Souffle',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
    ingredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm11',
    categories: [
      'c11',
    ],
    title: 'Classic Tacos',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/09/18/15/17/tacos-2760200_1280.jpg',
    duration: 25,
    ingredients: [
      '500g Ground Beef',
      'Taco Seasoning',
      'Taco Shells',
      'Lettuce',
      'Tomatoes',
      'Shredded Cheese',
      'Sour Cream'
    ],
    steps: [
      'Cook the ground beef in a skillet until browned.',
      'Add taco seasoning and a little water; simmer for 5 minutes.',
      'Chop lettuce and tomatoes.',
      'Warm the taco shells in the oven.',
      'Assemble tacos with beef, lettuce, tomatoes, cheese, and sour cream.',
      'Serve immediately.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm12',
    categories: [
      'c13',
    ],
    title: 'Chocolate Lava Cake',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2015/02/02/11/09/chocolate-cake-620743_1280.jpg',
    duration: 45,
    ingredients: [
      '200g Dark Chocolate',
      '100g Butter',
      '150g Sugar',
      '4 Eggs',
      '50g Flour',
      'Vanilla Extract'
    ],
    steps: [
      'Preheat the oven to 200°C (390°F).',
      'Melt the chocolate and butter in a bowl over boiling water.',
      'Whisk eggs and sugar until fluffy.',
      'Fold in the chocolate mixture, then add flour and vanilla extract.',
      'Pour into greased ramekins.',
      'Bake for 10-12 minutes until the edges are set but the center is molten.',
      'Serve immediately with ice cream.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm13',
    categories: [
      'c15',
    ],
    title: 'Vegan Buddha Bowl',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2019/11/12/18/55/buddha-bowl-4620874_1280.jpg',
    duration: 20,
    ingredients: [
      'Quinoa',
      'Chickpeas',
      'Avocado',
      'Carrots',
      'Spinach',
      'Tahini Sauce'
    ],
    steps: [
      'Cook the quinoa according to package instructions.',
      'Rinse and drain chickpeas.',
      'Slice avocado and carrots.',
      'Arrange all ingredients in a bowl with spinach.',
      'Drizzle with tahini sauce.',
      'Serve fresh.'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm14',
    categories: [
      'c12',
    ],
    title: 'Grilled Barbecue Ribs',
    affordability: Affordability.luxurious,
    complexity: Complexity.hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/07/16/10/43/barbecue-2508658_1280.jpg',
    duration: 120,
    ingredients: [
      '2 Racks of Pork Ribs',
      'Barbecue Sauce',
      'Dry Rub (Paprika, Garlic Powder, Brown Sugar, Salt, Pepper)',
      'Apple Cider Vinegar'
    ],
    steps: [
      'Preheat the grill to 120°C (250°F).',
      'Rub the ribs with the dry rub mixture.',
      'Wrap the ribs in foil and grill for 2 hours.',
      'Unwrap the ribs and brush with barbecue sauce.',
      'Grill directly for another 15 minutes, brushing with more sauce.',
      'Let rest for 10 minutes before serving.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm15',
    categories: [
      'c14',
    ],
    title: 'Butter Chicken',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/b/b8/2020-02-22_20_57_16_Butter_chicken_in_tomato_sauce_with_fenugreek_at_Karma_Modern_Indian_in_Washington%2C_D.C.jpg',
    duration: 60,
    ingredients: [
      '500g Chicken',
      '200ml Cream',
      '150g Yogurt',
      '3 Tomatoes',
      '2 Onions',
      'Garlic, Ginger',
      'Spices (Cumin, Coriander, Garam Masala)',
      'Butter',
      'Salt'
    ],
    steps: [
      'Marinate chicken with yogurt, garlic, ginger, and spices for 2 hours.',
      'Cook chicken in butter until golden and set aside.',
      'Blend tomatoes and onions into a paste.',
      'Cook the paste with spices and add cream.',
      'Mix in the cooked chicken and simmer for 15 minutes.',
      'Serve hot with naan or rice.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm16',
    categories: [
      'c16',
    ],
    title: 'Grilled Salmon with Lemon Dill Sauce',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/03/05/19/02/salmon-1238248_1280.jpg',
    duration: 30,
    ingredients: [
      '4 Salmon Fillets',
      'Lemon',
      'Fresh Dill',
      'Garlic',
      'Olive Oil',
      'Salt and Pepper'
    ],
    steps: [
      'Season salmon fillets with salt, pepper, and olive oil.',
      'Grill for 5-7 minutes on each side.',
      'In a saucepan, mix lemon juice, dill, and garlic; simmer for 5 minutes.',
      'Drizzle the sauce over the grilled salmon.',
      'Serve with roasted vegetables or rice.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm17',
    categories: [
      'c17',
    ],
    title: 'Greek Salad',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/08/10/06/55/greek-salad-2613465_1280.jpg',
    duration: 15,
    ingredients: [
      'Cucumber',
      'Cherry Tomatoes',
      'Red Onion',
      'Feta Cheese',
      'Kalamata Olives',
      'Olive Oil',
      'Oregano',
      'Salt and Pepper'
    ],
    steps: [
      'Chop cucumber, tomatoes, and red onion.',
      'Combine in a bowl with olives and crumbled feta cheese.',
      'Drizzle with olive oil and sprinkle oregano, salt, and pepper.',
      'Toss lightly and serve fresh.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm18',
    categories: [
      'c18',
    ],
    title: 'Spicy Popcorn',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/1/17/Hot_Popcorn.jpg',
    duration: 10,
    ingredients: [
      '1/2 Cup Popcorn Kernels',
      '2 Tbsp Oil',
      '1 Tsp Paprika',
      '1/2 Tsp Cayenne Pepper',
      'Salt'
    ],
    steps: [
      'Heat oil in a large pot and add popcorn kernels.',
      'Cover and cook on medium heat, shaking occasionally.',
      'Once popping slows, remove from heat.',
      'Toss the popcorn with paprika, cayenne pepper, and salt.',
      'Serve immediately as a snack.'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm19',
    categories: [
      'c19',
    ],
    title: 'Mac and Cheese',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/4/44/Original_Mac_n_Cheese_.jpg',
    duration: 40,
    ingredients: [
      '400g Elbow Pasta',
      '200g Cheddar Cheese',
      '50g Butter',
      '50g Flour',
      '500ml Milk',
      'Salt and Pepper'
    ],
    steps: [
      'Cook pasta according to package instructions.',
      'In a saucepan, melt butter and stir in flour to make a roux.',
      'Gradually add milk while stirring to make a creamy sauce.',
      'Add grated cheese, salt, and pepper; stir until melted.',
      'Mix the sauce with the cooked pasta.',
      'Serve hot and enjoy.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm20',
    categories: [
      'c20',
    ],
    title: 'Hummus and Pita Bread',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/07/16/16/38/hummus-2510244_1280.jpg',
    duration: 20,
    ingredients: [
      '1 Can Chickpeas',
      '2 Tbsp Tahini',
      '2 Garlic Cloves',
      'Juice of 1 Lemon',
      'Olive Oil',
      'Salt',
      'Pita Bread'
    ],
    steps: [
      'Blend chickpeas, tahini, garlic, lemon juice, and salt until smooth.',
      'Add olive oil while blending to achieve a creamy texture.',
      'Serve with warm pita bread or as a dip for vegetables.',
      'Garnish with paprika and a drizzle of olive oil.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
