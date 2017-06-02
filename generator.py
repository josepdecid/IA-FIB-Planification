import argparse
import os
import random


def generate_predicate(genpred):
    arguments = genpred['args']
    predicate = '(' + genpred['name']
    for arg in range(arguments):
        predicate += ' ' + random.choice(genpred['types'][arg]['values'])
    return predicate + ')'


def generate_day_before(days):
    day_before = ''
    for i in range(len(days) - 1):
        day_before += 4 * ' ' + '(dayBefore ' + days[i] + ' ' + days[i + 1] + ')\n'
    day_before += '\n' + 4 * ' ' + '(mainReady DummyD)'
    day_before += '\n' + 4 * ' ' + '(secondReady DummyD)'
    day_before += '\n' + 4 * ' ' + '(dayMCClassif DummyD DummyC)'
    return day_before + '\n' + 4 * ' ' + '(daySCClassif DummyD DummyC)\n\n'


def generate_classifications(main_courses, second_courses, categories):
    categories_mc = [5, 3, 6, 4, 6, 0, 1, 6, 2, 2, 2, 0, 4]
    categories_sc = [1, 1, 4, 0, 1, 1, 6, 1, 6, 5, 5, 0]

    categorization = ''
    for index, course in enumerate(main_courses):
        categorization += 4 * ' ' + '(classified ' + course + ' ' + categories[categories_mc[index]] + ')\n'
    for index, course in enumerate(second_courses):
        categorization += 4 * ' ' + '(classified ' + course + ' ' + categories[categories_sc[index]] + ')\n'
    return categorization + '\n'


def generate_calories(main_courses, second_courses):
    calories_main = [500, 120, 290, 490, 610, 720, 1000, 240, 600, 760, 480, 320, 410]
    calories_second = [810, 380, 700, 670, 520, 490, 250, 960, 320, 480, 430, 750]

    calories = ''
    for index, course in enumerate(main_courses):
        calories += 4 * ' ' + '(= (calories ' + course + ') ' + str(calories_main[index]) + ')\n'
    for index, course in enumerate(second_courses):
        calories += 4 * ' ' + '(= (calories ' + course + ') ' + str(calories_main[index]) + ')\n'
    return calories + '\n'


def generate_prices(main_courses, second_courses):
    prices_main = [8, 7, 5, 12, 10, 15, 5, 10, 16, 9, 11, 6, 13]
    prices_second = [17, 4, 25, 20, 14, 19, 9, 21, 12, 6, 6, 13]

    prices = ''
    for index, course in enumerate(main_courses):
        prices += 4 * ' ' + '(= (price ' + course + ') ' + str(prices_main[index]) + ')\n'
    for index, course in enumerate(second_courses):
        prices += 4 * ' ' + '(= (price ' + course + ') ' + str(prices_second[index]) + ')\n'
    return prices + '\n'


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Executes PDDL RicoRico versions')
    parser.add_argument('version', metavar='version', type=int, help='Version number')
    parser.add_argument('tests', metavar='tests', type=int, help='Number of tests')

    args = parser.parse_args()
    version = args.version
    n_tests = args.tests

    file_tpl = os.path.join('templates', 'problem.tpl')
    data = {
        'objects': [],
        'init': [],
        'goal': []
    }

    # Objects
    day = {
        'values': ['DummyD', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
        'type': 'day'
    }
    data['objects'].append(day)

    main_course = {
        'values': ['Spaghetti_Bolognese', 'Mediterranean_Salad', 'Vegan_Sandwich', 'Mushroom_risotto',
                   'Guacamole_with_tomatoes', 'Sushi', 'American_burger', 'Broccoli_quiche',
                   'Kirmizi_Mercimek_Corbasi', 'Chinese_Noodles_With_Vegetables', 'Chana_masala',
                   'Chinese_tiger_salad', 'Shumai'],
        'type': 'mainCourse'
    }
    data['objects'].append(main_course)

    second_course = {
        'values': ['Roast_pork_with_prunes', 'Spanish_omelette', 'Paella', 'Tuna_steak', 'Chicken_parmesan',
                   'Lamb_tagine', 'Couscous_meatloaf', 'Coq_au_vin', 'Mapo_tofu', 'Persian_pie', 'Burrito_pie',
                   'Spicy_seafood_stew'],
        'type': 'secondCourse'
    }
    data['objects'].append(second_course)

    dish = {
        'values': main_course['values'] + second_course['values'],
        'type': 'dish'
    }

    # Init
    data['init'].append({'name': 'incompatible', 'random': True, 'args': 2, 'types': [main_course, second_course]})

    if version >= 2:
        category = {
            'values': ['Fish', 'Meat', 'Soup', 'Salad', 'Rice', 'Pasta', 'Vegetables', 'DummyC'],
            'type': 'category'
        }
        data['objects'].append(category)

        data['init'].append({'name': 'classified', 'random': False, 'values': generate_day_before(day['values'])})
        data['init'].append({'name': 'dayBefore', 'random': False, 'values': generate_classifications(
            main_course['values'], second_course['values'], category['values']
        )})

    if version >= 3:
        data['init'].append({'name': 'servedOnly', 'random': True, 'args': 2, 'types': [dish, day]})

    if version >= 4:
        data['init'].append({'name': 'calories', 'random': False, 'values': generate_calories(
            main_course['values'], second_course['values']
        )})

    if version >= 5:
        data['init'].append({'name': 'prices', 'random': False, 'values': generate_prices(
            main_course['values'], second_course['values']
        )})

    # Create objects
    objects = ''
    for obj in data['objects']:
        objects += 4 * ' ' + ' '.join(obj['values']) + ' - ' + obj['type'] + '\n'
    objects = objects[:-1]

    # Create init
    init = ''
    for pred in data['init']:
        if pred['random']:
            for _ in range(random.randint(1, 5)):
                init += 4 * ' ' + generate_predicate(pred) + '\n'
            init += '\n'
        else:
            init += pred['values']
    init = init[:-2]

    # Create goal
    goal = 4 * ' ' + '(forall (?d - day)\n' + 6 * ' ' + '(dayReady ?d)\n' + 4 * ' ' + ')'

    for n in range(n_tests):
        with open(file_tpl, 'r') as f:
            template = f.read()
            template = template.format(problem='ricoRico', domain='ricoRico', objects=objects, init=init, goal=goal)
            print(template)
