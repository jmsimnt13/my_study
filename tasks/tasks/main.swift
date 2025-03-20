//
//  main.swift
//  tasks
//
//  Created by Данила on 20.02.2025.
//

import Foundation

print("Hello, World! Here's my tasks")

// Conditions
/*
// lvl_1
/*
// 1.
print("Введите ваш возраст: ", terminator: "")
if let input = readLine(), let age = Int(input), age >= 18
{
    print("Вы совершеннолетний!")
}
else
{
    print("Вы несовершеннолетний!")
}

// 2.
print("Введите число для проверки на четность: ", terminator: "")
if let input = readLine(), let number = Int(input), number % 2 == 0
{
    print("Введено четное число!")
}
else
{
    print("Введено нечетное число!")
}

// 3.
print("Введите число для проверки +/-/0: ", terminator: "")
if let input = readLine(), let number = Int(input)
{
    if number > 0
    {
        print("Число положительное!")
    }
    else
    {
        number < 0 ? print("Число отрицательное!") : print("Число равно нулю!")
    }
}

// 4.
print("Введите месяц от 1 до 12 для его определения: ", terminator: "")
if let input = readLine(), let month = Int(input)
{
    switch month
    {
    case 1:     print("Это Январь!")
    case 2:     print("Это Февраль!")
    case 3:     print("Это Март!")
    case 4:     print("Это Апрель!")
    case 5:     print("Это Май!")
    case 6:     print("Это Июнь!")
    case 7:     print("Это Июль!")
    case 8:     print("Это Август!")
    case 9:     print("Это Сентябрь!")
    case 10:    print("Это Октябрь!")
    case 11:    print("Это Ноябрь!")
    case 12:    print("Это Декабрь!")
    default:    print("\(month) - такого месяца нет!")
    }
}

// 5.
print("Введите полученные баллы, а я переведу их в оценку: ", terminator: "")
if let input = readLine(), let score = Int(input)
{
    switch score
    {
    case 0...49:    print("Неудовлетворительно")
    case 50...69:   print("Удовлетворительно")
    case 70...89:   print("Хорошо")
    case 90...100:  print("Отлично")
    default:        print("Полученные баллые выходят за допустимый диапозон")
    }
}
*/

// lvl_2
/*
// 1. Калькулятор

print("Привет! Я калькулятор, введи мне два числа и операцию с ними, и я посчитаю")
//
print("Введи первое число (1): ", terminator: "")
guard let input1 = readLine(), let number1 = Double(input1) else
{
    print("Ошибка: это не число и попыток больше не будет!")
    exit(0)
}

print("Введи второе число (2): ", terminator: "")
guard let input2 = readLine(), let number2 = Double(input2) else
{
    print("Ошибка: это не число и попыток больше не будет!")
    exit(0)
}

print("Введи операцию над числами: \(number1) +,-,*,/ \(number2): ", terminator: "")
if let myOperation = readLine()
{
    switch myOperation
    {
    case "+":
        let result = number1 + number2
        print("Резлультат: \(result)")
    case "-":
        let result = number1 - number2
        print("Результат: \(result)")
    case "*":
        let result = number1 * number2
        print("Результат: \(result)")
    case "/":
        if number2 != 0
        {
            let result = number1 / number2
            print("Результат: \(result)")
        }
        else
        {
            print("Обойдемся без деления на ноль")
        }
    default:
        print("Ошибка, введен оператор не из предложенных!")
    }
}

// 2. Проверка пароля

print("Введи пароль для определения его надежности: ", terminator: "")
if let inputPass = readLine()
{
    // проверяем длину и наличие спец.символов
    let regexSpec = "[^a-zA-Z0-9]"
    let regexAlph = "[a-zA-Z]"
    if inputPass.count >= 8 && inputPass.range(of: regexSpec, options: .regularExpression) != nil
        && inputPass.range(of: regexSpec, options: .regularExpression) != nil
    {
        print("Пароль надежный!")
    }
    else
    {
        print("Пароль слабый!")
    }
}
else
{
    print("Ошибка ввода!")
}

// 3. Определние типа треугольника

print("Я помогу определить тип треугольника в зависимости от его сторон")
print("Введи длину первой стороны:")
guard let input1 = readLine(), let side1 = Double(input1), side1 > 0 else
{
    print("Это странная длина стороны треугольника...")
    exit(0)
}
print("Введи длину второй стороны:")
guard let input2 = readLine(), let side2 = Double(input2), side2 > 0 else
{
    print("Это странная длина стороны треугольника...")
    exit(0)
}
print("Введи длины третьей стороны:")
guard let input3 = readLine(), let side3 = Double(input3), side3 > 0 else
{
    print("Это странная длина стороны треугольника...")
    exit(0)
}
// Прежде чем определять его тип, проверим возможен ли такой треугольник
if side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
{
    print("Треугольник с такими сторонами не существует!")
    exit(0)
}

// Теперь определим его тип
if side1 == side2 && side2 == side3
{
    print("Перед нами равносторонний треугольник!")
}
else if side1 == side2 || side2 == side3 || side1 == side3
{
    print("Перед нами ранобедренный треугольник!")
}
else
{
    print("Перед нами треугольник с разными сторонами")
}

// 4. Светофор

print("Предлагаю сымитировать работу светофора - введи его цвет (зел., жел., крас.)")
if let inputColor = readLine()
{
    switch inputColor.lowercased()
    {
    case "зеленый":
        print("Идите!")
    case "желтый":
        print("Готовьтесь!")
    case "красный":
        print("Стой")
    default:
        print("Такого цвета на светофоре нет!")
    }
}

// 5. Проверка дней недели

print("Привет, введи номер дня недели от 1 до 7 и я сообщу тебе информацию о нем:")
guard let inputDay = readLine(), let dayOfWeek = Int(inputDay), (dayOfWeek > 0 && dayOfWeek <= 7) else
{
    print("То, что ты ввел не подходит...")
    exit(0)
}
switch dayOfWeek
{
case 1:
    print("Понедельник. Рабочий день")
case 2:
    print("Вторник. Рабочий день")
case 3:
    print("Среда. Рабочий день")
case 4:
    print("Четверг. Рабочий день")
case 5:
    print("Пятница. Рабочий день")
case 6:
    print("Суббота. Выходной день")
case 7:
    print("Воскресенье. Выходной день")
// в default: не нуждаемся, поскольку ввод уже обработан
default:
    print("Меня компилятор заставил...")
}
*/

// lvl_3
/*
// 1. Классификаиця чисел - положительное/отрицательнное, четное/нечетное, простое/составное

print("Введи число для его классификации: ", terminator: "")
if let inputNum = readLine(), let num = Int(inputNum)
{
    if num > 0 && num != 0
    {
        print("Положительное, ", terminator: "")
    }
    else
    {
        print("Отрицательное, ", terminator: "")
    }
    if num % 2 == 0
    {
        print("четное, ", terminator: "")
    }
    else
    {
        print("нечетное, ", terminator: "")
    }
    
    // без темы циклы сложно представить как реализовать проверку на простоту числа, пока оставил как есть
}

// 2. Угадай число

print("""
Попробуйте угадать число которое я загадал от 1 до 10,
а я подскажу угадали ли вы!
""")
// Генерирую случайное число
let randomNumber = Int.random(in: 1...10)
// Прошу пользователя ввести число
if let input = readLine(), let guessNumber = Int(input)
{
    if guessNumber == randomNumber
    {
        print("Вы угадали!")
    }
    else if guessNumber < randomNumber
    {
        print("Меньше")
    }
    else
    {
        print("Больше")
    }
}

// 3. Кассовый аппарат

print("Введите сумму покупки: ", terminator: "")
guard let inputTotal = readLine(), let total = Int(inputTotal) else
{
    print("То, что введено, не подходит...")
    exit(0)
}
print("Введите переданную клиентом сумму: ", terminator: "")
guard let inputCash = readLine(), let cash = Int(inputCash) else
{
    print("То, что введено, не подходит...")
    exit(0)
}
if cash >= total
{
    print("Сумма сдачи с \(cash) : \(cash - total)")
}
else
{
    print("Клиент внес недостаточно!")
}

// 4. Определние знака зодиака
/*
 Овен: 21 марта — 19 апреля. 2
 Телец: 20 апреля — 20 мая. 2
 Близнецы: 21 мая — 20 июня. 2
 Рак: 21 июня — 22 июля. 2
 Лев: 23 июля — 22 августа. 2
 Дева: 23 августа — 22 сентября. 2
 Весы: 23 сентября — 22 октября. 2
 Скорпион: 23 октября — 21 ноября. 2
 Стрелец: 22 ноября — 21 декабря. 2
 Козерог: 22 декабря — 19 января. 2
 Водолей: 20 января — 18 февраля. 2
 Рыбы: 19 февраля — 20 марта. 2
 */

print("Введите число дня своего рождения: ", terminator: "")
guard let inputDay = readLine(), let dayOfBirth = Int(inputDay), (dayOfBirth > 0 && dayOfBirth <= 31) else
{
    print("То, что ты ввел не подходит...")
    exit(0)
}
print("Введите число месяца своего рождения: ", terminator: "")
guard let inputMonth = readLine(), let monthOfBirth = Int(inputMonth), (monthOfBirth > 0 && monthOfBirth <= 12) else
{
    print("То, что ты ввел не подходит...")
    exit(0)
}
switch (dayOfBirth, monthOfBirth)
{
case (21...31, 3), (1...19, 4): print("Вы Овен")
case (20...30, 4), (1...20, 5): print("Вы Телец")
case (21...31, 5), (1...20, 6): print("Вы Близнецы")
case (21...30, 6), (1...22, 7): print("Вы Рак")
case (23...31, 7), (1...22, 8): print("Вы Лев")
case (23...31, 8), (1...22, 9): print("Вы Дева")
case (23...30, 9), (1...22, 10): print("Вы Весы")
case (23...31, 10), (1...21, 11): print("Вы Скорпион")
case (22...30, 11), (1...21, 12): print("Вы Стрелец")
case (22...31, 12), (1...19, 1): print("Вы Козерог")
case (20...31, 1), (1...18, 2): print("Вы Водолей")
case (19...29, 2), (1...20, 3): print("Вы Рыбы")
default: print("Дата некорректна")
}

// 5. Определение високосного года

print("Введите число года для проверки его на високосность: ", terminator: "")
if let inputYear = readLine(), let year = Int(inputYear), year > 0
{
    if year % 400 == 0
    {
        print("\(year) високосный!")
    }
    else if year % 4 == 0
    {
        print("\(year) високосный!")
    }
    else if year % 100 == 0
    {
        print("\(year) не високосный!")
    }
    else
    {
        print("\(year) не високосный")
    }
}
*/

// lvl_dop
/*
// 1. Классификация треугольника по углам

// Запрашиваем значения для углов
// 1 угол
print("Введите первый угол треугольника: ", terminator: "")
guard let inputAngle = readLine(), let angleOne = Int(inputAngle), (angleOne > 0 && angleOne < 180 ) else
{
    print("То, что ты ввел не подходит...")
    exit(0)
}
// 2 угол
print("Введите первый угол треугольника: ", terminator: "")
guard let inputAngle = readLine(), let angleTwo = Int(inputAngle), (angleTwo > 0 && angleTwo < 180 ) else
{
    print("То, что ты ввел не подходит...")
    exit(0)
}
// 3 угол
print("Введите первый угол треугольника: ", terminator: "")
guard let inputAngle = readLine(), let angleThree = Int(inputAngle), (angleThree > 0 && angleThree < 180 ) else
{
    print("То, что ты ввел не подходит...")
    exit(0)
}

// Определяем существование введенного треугольника
let triangle = angleOne + angleTwo + angleThree
if triangle <= 180
{
    switch (angleOne, angleTwo, angleThree)
    {
    case (1..<90, 1..<90, 1..<90): print("Треугольник остроугольный!")
    case (90,_,_), (_,90,_), (_,_,90): print("Треугольник прямоугольный!")
    case (91..<180,_,_), (_,91..<180,_), (_,_,91..<180): print("Треугольник тупой!")
    default: print("Затрудняюсь определить такой треугольник!")
    }
}
else
{
    print("Треугольник не существует!!!")
    exit(0)
}

// 2. Опредление дня недели по дате

// print("Введите дату в формате д.м.г: ", terminator: "")
// if let inputDate = readLine(), let date =
// Испытываю небольшой затуп с работой с внутренними методами для работы с датой
// upd 25/02/25 попытка номер два

print("Я помогу определить день недели по дате, которую вы введете!")
print("Для начала введите год: ", terminator: "")
if let inputYear = readLine(), let year = Int(inputYear), year > 0
{
    print("Теперь введите месяц года от 1 до 12: ", terminator: "")
    if let inputMonth = readLine(), let month = Int(inputMonth), (month >= 1 && month <= 12)
    {
        print("Теперь введите день от 1 до 31: ", terminator: "")
        if let inputDay = readLine(), let day = Int(inputDay), (day >= 1 && day <= 31)
        {
            var dateParts = DateComponents()
            dateParts.year = year
            dateParts.month = month
            dateParts.day = day
            
            // Из введенных компонентов получаем дату в необходимом для обработки формате
            if let date = Calendar.current.date(from: dateParts)
            {
                // Запрашиваем и получаем с помощью этой даты день недели
                let dayOfWeek = Calendar.current.component(.weekday, from: date)
                // Создаем массив с днями недели для сопоставления полученного значения от 0 до 7 с
                // названием дня недели для вывода на экран пользователю
                // по григориански неделя начинается с воскресенья
                let wholeWeek = ["", "Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
                // Вывод результата
                print("День недели, соответствующий введенной дате: \(wholeWeek[dayOfWeek])")
                
            }
        }
    }
}

// 3. Проверка полиндрома

print("Введите строку для проверки на полиндром: ", terminator: "")
if let inputStr = readLine()
{
    let str = inputStr
    if str == String(str.reversed())
    {
        print("Это полиндром!")
    }
    else
    {
        print("Это не полиндром!")
    }
}

// 4. Определение максимального числа

print("Я определю, какое из трех чисел максимальное!")
print("Введите первое число: ", terminator: "")
if let inputNum1 = readLine(), let num1 = Int(inputNum1)
{
    print("Введите второе число: ", terminator: "")
    if let inputNum2 = readLine(), let num2 = Int(inputNum2)
    {
        print("Введите третье число: ", terminator: "")
        if let inputNum3 = readLine(), let num3 = Int(inputNum3)
        {
            if num1 >= num2 && num1 >= num3
            {
                print("Максимальное число \(num1)")
            }
            else if num2 >= num1 && num2 >= num3
            {
                print("Максимальное число \(num2)")
            }
            else
            {
                print("Максимальное число \(num3)")
            }
        }
    }
}

// 5. Конвертер валют (RUB, USD, EUR)

let exchValues: [String: [String: Double]] =
[
    "RUB": ["USD": 0.011, "EUR": 0.010],
    "USD": ["RUB": 86.63, "EUR": 0.95],
    "EUR": ["USD": 1.04, "RUB": 90.94]
]

print("Введите сумму для конвертации: ", terminator: "")
if let inputTotal = readLine(), let total = Double(inputTotal), total > 0
{
    print("Введите исходную валюту из USD, EUR, RUB: ", terminator: "")
    if let inputSourceCurrency = readLine(), !inputSourceCurrency.isEmpty
    {
        print("Введите валюту, в которую требуется перевод (USD, EUR, RUB):", terminator: "")
        if let inputTargetCurrency = readLine(), !inputTargetCurrency.isEmpty
        {
            if let variantsForSource = exchValues[inputSourceCurrency.uppercased()],
               let variantToTarget = variantsForSource[inputTargetCurrency.uppercased()]
            {
                let converted = total * variantToTarget
                print("\(total) \(inputSourceCurrency) = \(converted) \(inputTargetCurrency)")
            }
        }
    }
}

*/
*/

// Loops
/*
// lvl_1
/*
// 1.

print("Введите до какого числа мы считаем (не более 20): ", terminator: "")
if let inputCount = readLine(), let count = Int(inputCount), (count > 0 && count <= 20)
{
    for number in 1...count {
        print("\(number)")
    }
}

// 2.

print("Введите до какого числа мы считаем и складываем (не более 20): ", terminator: "")
if let inputCount = readLine(), let count = Int(inputCount), (count > 0 && count <= 20)
{
    var sum = 0
    for number in 1...count {
        sum += number
        print("\(number). \(sum)")
    }
}

// 3.

print("Введите для какого числа мы вычисляем факториал (не более 20): ", terminator: "")
if let inputNumber = readLine(), let number = Int(inputNumber), (number > 0 && number <= 20)
{
    var factorial = 1
    for index in 1...number {
        factorial *= index
        print("\(index). \(factorial)")
    }
}

// 4.

print("Выводим все четные числа до 50:")
    for number in 2...50{
        if number % 2 == 0
        {
            print("\(number)")
        }
    }
            
// 5.

print("Выводим все нечетные числа до 50:")
    for number in 2...50{
        if number % 2 != 0
        {
            print("\(number)")
        }
    }
*/

// lvl_2
/*
// 1. Таблица умножения до 10

print("Таблица умножения:")
for index1 in 1...10
{
    for index2 in 1...10
    {
        let result = index1 * index2
        print("\(index1) * \(index2) = \(result)")
    }
}

// 2. Поиск делителей числа

print("Введите число N до 100, а я найду все его делители: ", terminator: "")
if let inputNumber = readLine(), let num = Int(inputNumber), (num > 1 && num <= 100)
{
    print("Число \(num) делится на:")
    for index in 2...num
    {
        if num % index == 0
        {
            print(index)
        }
    }
}

// 3. Поиск простых чисел

print("Простые числа до 100")
for number in 2...100
{
    var isPrime = true
    // Проверим делители числа
    for divider in 2..<number // ищем делители исключая 1 и само число
    {
        if number % divider == 0 // и если нашли, то число точно не простое
        {
            isPrime = false
            break // прерываем дальнешие поиски
        }
    }
    
    // при это если флаг не поменялся за время цикла выводим полученное число
    if isPrime
    {
        print(number, terminator: " ")
    }
}
print("")

// 4. Обратный отсчет

print("Введите число до 50 и я нарисую обратный отсчет:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum), (num > 1 && num <= 50)
{
    for index in (1...num).reversed()
    {
        print(index, terminator: " ")
    }
    print("")
}

// 5. Сумма цифр числа

print("Введите число и я вычислю сумму его цифр:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum)
{
    var absoluteNum = abs(num)
    var sum = 0
    
    while absoluteNum > 0
    {
        let digit = absoluteNum % 10
        sum += digit
        absoluteNum /= 10
    }
    print(sum)
}
*/
 
// lvl_3
/*
// 1. Числа Фибоначчи

print("Введите сколько чисел Фибоначчи хотите вывести: ", terminator: "")
if let inputNum = readLine(), let num = Int(inputNum), (num > 0 && num <= 20)
{
    var fiboPrev = 1
    var fiboActual = 0
    
    for _ in 1...num
    {
        let temp = fiboPrev + fiboActual
        fiboPrev = fiboActual
        fiboActual = temp
        print(fiboActual)
    }
}

// 2. Генерация случайных чисел без повторения

print("Введите сколько уникальных чисел от 1 до 100 нужно сгенерировать")
if let inputNum = readLine(), let num = Int(inputNum)
{
    var uniqueNumbers = [Int]()
    
    while uniqueNumbers.count < num
    {
        let randNum = Int.random(in: 1...100)
        
        if !uniqueNumbers.contains(randNum)
        {
            uniqueNumbers.append(randNum)
        }
    }
    
    print(uniqueNumbers)
}

// 3. Поиск максимального элемента в массиве

// Создадим массив и заполним его случайными числами
let arSize = 20
var numbers = [Int]()
for _ in 0..<arSize
{
    let randomValue = Int.random(in: 1...1000)
    numbers.append(randomValue)
}

print("У нас получился массив: \(numbers)")

// С помощью цикла определим максимальное значение в массиве
var maxNum = numbers[0] // пусть первый элемент будет максиамльным
for number in numbers
{
    if number > maxNum
    {
        maxNum = number
    }
}
print("Найденное максиамльное значение: \(maxNum)")

// 4. Переворот строки

print("Введите строку для переворота:")
if let inputStr = readLine(), !inputStr.isEmpty
{
    var reversedStr = "" // Строка для сохранения результата
    
    // Цикл для прохода строки
    for char in inputStr.reversed()
    {
        reversedStr.append(char) // Добавляем каждый символ в новую строку
    }
    
    print("Ваша строка наоборот: \(reversedStr)")
}
else
{
    print("Пустой ввод?")
}

// 5. Проверка на полиндром

print("Введите строку для проверки на полиндром: ", terminator: "")
if let inputStr = readLine(), !inputStr.isEmpty
{
    var reversedStr = "" // Сохраняем исходную строку для посимвольного сравнения
    
    // Цикл для прохода строки и записи ее наоборот
    for char in inputStr.reversed()
    {
        reversedStr.append(char) // Формируем посимвольно строку наоборот
    }
    
    if inputStr == reversedStr
    {
        print("Поздравляем! У вас полиндром!")
    }
    else
    {
        print("Увы, это не полиндром!")
    }
    
}
*/

// lvl_dop
/*
// 1. Подсчет количества простых чисел

print("Простые числа до N, мне нужно N:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum), (num > 1 && num <= 10000)
{
    var count = 0
    
    for number in 2...num
    {
        var isPrime = true
        // Проверим делители числа
        for divider in 2..<number // ищем делители исключая 1 и само число
        {
            if number % divider == 0 // и если нашли, то число точно не простое
            {
                isPrime = false
                break // прерываем дальнешие поиски
            }
        }
        
        // при это если флаг не поменялся за время цикла учитываем полученное число
        if isPrime
        {
            count += 1
        }
    }
    print("Насчитал \(count) простых чисел от 2 до \(num)")
}


// 2. Поиск счастливого билета

print("Привет! Я могу определить счастливый ли твой билет, просто введи его 6-значный номер:", terminator: " ")
if let inputNum = readLine(), let ticketNum = Int(inputNum), (ticketNum >= 100_000 && ticketNum <= 999_999)
{
    var tempNum = ticketNum
    var sumHalfOne = 0
    var sumHalfTwo = 0
    
    // Последние три цифры
    for _ in 1...3
    {
        let digit = tempNum % 10
        sumHalfTwo += digit
        tempNum /= 10
    }
    
    // Первые три цифры
    for _ in 1...3
    {
        let digit = tempNum % 10
        sumHalfOne += digit
        tempNum /= 10
    }
    
    if sumHalfOne == sumHalfTwo
    {
        print("У вас счастливый билет!!!")
    }
    else
    {
        print("Билет несчастливый!")
    }
}
else
{
    print("Номер билета должен состоять из 6 цифр!")
}

// 3. Удаление дубликатов из массива

var arrOrig = [1, 3, 5, 2, 5, 7, 8, 1, 2, 4, 3, 3, 5, 2]
print("Найдем дубликаты в массиве \(arrOrig)")

// Создаем новый для хранения уникальных значений
var arrUniq = [Int]()
// Проходим по исходному массиву
for item in arrOrig
{
    var isDuplicate = false // считаем что дубликатов пока нет
    
    for itemUniq in arrUniq
    {
        if item == itemUniq
        {
            isDuplicate = true
            break
        }
    }
    
    // если после прохода циклов флаг не поменялся значит значение уникальное
    // => размещаем его в массив с уникальными значениями
    if !isDuplicate
    {
        arrUniq.append(item)
    }
}

print("Итоговый массив без дублей: \(arrUniq)")

// 4. Поиск числа в массиве

var arrTest = [1, 3, 5, 2, 5, 7, 8, 1, 2, 4, 3, 3, 5, 2]
print("Готов найти заданное положительнеое целое число в массиве (если получится...):", terminator: "")
if let inputNum = readLine(), let num = Int(inputNum), num > 0
{
    var isFound = false // считаем что не содержится при начале поисков
    var count = 0
    
    for found in arrTest
    {
        if num == found
        {
            isFound = true
            break
        }
        count += 1
    }
    
    //если не нашлось выводим сообщение
    if !isFound
    {
        print("Введенного значения в массиве нет!")
    }
    else
    {
        print("Нашел \(num) в массиве под индексом \(count): \(arrTest[count])")
    }
}
else
{
    print("Принимаю положительные целые числа!")
}


// 5. Максимальная серия

var arrRange = [1, 3, 3, 3, 5, 2, 5, 5, 5, 5, 7, 8, 1, 2, 4, 3, 3, 5, 2]

print("Представляю исходный массив \(arrRange)")
print("Сейчас я найду самую длинную серию (или нет)")

var currentNum = arrRange[0] // Начинаем предполагаемую серию
var currentCount = 0
var maxiNum = arrRange[0] // Число с максимальной серией
var maxCount = 1 // Максимальная длина серии

// проходим предполагаемую серию со 2 элемента массива
for i in 1..<arrRange.count
{
    if arrRange[i] == currentNum
    {
        // если такое же как предыдущее, то накапливаем статистику
        currentCount += 1
    }
    else
    {
        // если нет, то проверяем максимальная ли она была
        if currentCount > maxCount
        {
            maxCount = currentCount
            maxiNum = currentNum
        }
        
        // обнуляем результаты и идем дальше
        currentNum = arrRange[i]
        currentCount = 1
    }
}

// надо проверить последнюю серию до выхода их цикла
if currentCount > maxCount
{
    maxCount = currentCount
    maxiNum = currentNum
}

// таким образом получаем исчерпывающую информацию о сериях
if maxCount > 1
{
    print("Самая длинная серия: \(maxCount), состоящая из \(maxiNum)")
}
else
{
    print("В этом массиве не нашлось серий из чисел(")
}
*/
*/

// Functions
/*
// lvl_1
/*
// 1. Приветствие
func greet(name: String) {
    print("Привет, \(name)!")
}

print("Привет! Введите свое имя:", terminator: " ")
if let inputStr = readLine(), !inputStr.isEmpty {
    greet(name: inputStr)
}
else {
    print("Ошибка ввода или пустая строка!")
}

// 2. Сумма двух чисел (я должен строго следовать требованиям задачи или можно называть фукнции/переменные по-своему? )

func sumForTwo(memberOne: Int, memberTwo: Int) {
    print("Вот их сумма: \(memberOne) + \(memberTwo) = \(memberOne + memberTwo)")
}

print("Привет, я умею вычислять сумму двух целых чисел!")
print("Прошу ввести первое число:", terminator: " ")
if let inputNumOne = readLine(), let numOne = Int(inputNumOne) {
    print("Прошу ввести второе число:", terminator: " ")
    if let inputNumTwo = readLine(), let numTwo = Int(inputNumTwo) {
        sumForTwo(memberOne: numOne, memberTwo: numTwo)
    }
    else {
        print("Упс... получится в следующий раз")
    }
}
else {
    print("Упс... что то пошло не так")
}

// 3. Площадь прямоугольника

func rectangleArea(width: Double, height: Double) {
    let result = width * height
    print("У прямоугольника с введенными сторонами площадь составляет:")
    print("\(width) * \(height) = \(result)")
}

print("Привет! Я умею вычислять площадь прямоугольника, для этого мне понадобится две стороны")
print("Введите ширину прямоугольника:", terminator: " ")
if let inputWidth = readLine(), let width = Double(inputWidth), (width > 0) {
    print("Введите длину прямоугольника:", terminator: " ")
    if let inputHeight = readLine(), let height = Double(inputHeight), (height > 0) {
        rectangleArea(width: width, height: height)
    }
    else {
        print("Сторона не может быть отрицательной!")
    }
}
else {
    print("Сторона не может быть отрицательной!")
}

// 4. Факториал числа

func factorial(of: Int) {
    var factorial = 1
    for number in 1...of {
        factorial *= number
    }
    print("Факториал для числа \(of)! = \(factorial)")
}

print("Привет! Я умею вычислять факториалы, для какого числа ты бы хотел узнать факториал?")
print("Введи положительное целое число:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum), (num > 0) {
    factorial(of: num)
}
else {
    print("Требуется ввести целое положительное число!")
}

// 5. Проверка четности

func isEven(number: Int) {
    if number % 2 == 0 {
        print("Число \(number) четное!")
    }
    else {
        print("Число \(number) нечетное!")
    }
}

print("Привет! Я умею определять четность чисел!")
print("Введи число, которые бы ты хотел проверить на четность:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum) {
    isEven(number: num)
}
else {
    print("Введено что-то не то...")
}
*/

// lvl_2
/*
 // 1. Реализация калькулятора с помощью фукнции

func calculate(a: Double, b: Double, operation: String) {
    switch operation {
    case "+": print("Результат: \(a) + \(b) = \(a + b)")
    case "-": print("Результат: \(a) - \(b) = \(a - b)")
    case "*": print("Результат: \(a) * \(b) = \(a * b)")
    case "/":
        if b != 0 {
            print("Результат: \(a) / \(b) = \(a / b)")
        }
        else {
            print("Результат: \(a) / \(b) = 0")
        }
    default: print("Unknown operation")
    }
}

print("Привет, я калькулятор с четырьмя операциями: +, -, *, /")
print("Введите первый операнд:", terminator: " ")
if let inputNum1 = readLine(), let num1 = Double(inputNum1) {
    print("Введите второй операнд:", terminator: " ")
    if let inputNum2 = readLine(), let num2 = Double(inputNum2) {
        print("Введите операцию:", terminator: " ")
        if let inputOp = readLine(), !inputOp.isEmpty {
            calculate(a: num1, b: num2, operation: inputOp)
        }
        else {
            print("Уточните операцию...")
        }
    }
    else {
        print("Уточните операнд...")
    }
}
else {
    print("Уточните операнд...")
}

// 2. Поиск максимального числа

func findMax(numbers: [Int]) -> Int? {
    if !numbers.isEmpty {
        var foundedMax = -1; // Заведомо самое маленькое значение
        for (index, number) in numbers.enumerated() {
            if number >= foundedMax {
                foundedMax = numbers[index]
            }
        }
        return foundedMax
    }
    else {
        return nil
    }
}

print("Привет, я умею находить максимальное значение в введенном массиве!")
print("Прошу ввести некоторый набор целочисленных значений через пробел для анализа:", terminator: " ")
if let inputArr = readLine() {
    let splitParts = inputArr.split(separator: " ")
    
    var numbers: [Int] = []
    for splitPart in splitParts {
        if let number = Int(splitPart) {
            numbers.append(number)
        }
    }
    
    let result = findMax(numbers: numbers)
    if result != nil {
        print("Максимальный элемент введенного массива = \(result!)") // я уверен что опционал не nil, поэтому его распаковываю явно
    }
    else {
        print("Кажется введенный массив пустой...")
    }
}
else {
    print("Ошибка ввода")
}

// 3. Генерация таблицы умножения

func multiplicationTable(for: Int) {
    for multiplicator in 1...10 {
        let index = multiplicator
        print("\(index). \(`for`) * \(multiplicator) = \(`for` * multiplicator)")
    }
}

print("Привет, я умею выводить таблицу умножения для введенного целого числа!")
print("Прошу ввести число:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum) {
    multiplicationTable(for: num)
}
else {
    print("Ошибка ввода...")
}

// 4. Переворот строки

func reverseString(_ stringToReverse: String) {
    for char in stringToReverse.reversed() {
        print(char, terminator: "")
    }
    print("")
}

print("Привет! Я умею переворачивать строки!")
print("Напиши строку:", terminator: " ")
if let inputStr = readLine(), !inputStr.isEmpty {
    reverseString(inputStr)
}
else {
    print("Упс... введено что-то не то...")
}

// 5. Проверка палиндрома

func isPalindrome(_ isPalindrome: String) {
    var reversedStr = ""
    
    for char in isPalindrome.reversed() {
        reversedStr.append(char)
    }
    
    if isPalindrome == reversedStr {
        print("Слово '\(isPalindrome)' является палиндромом!")
    }
    else {
        print("Слово '\(isPalindrome)' не является палиндромом!")
    }
}

print("Привет, я умею проверять палиндром ли введенное слово!")
print("Введи слово для проверки:", terminator: " ")
if let inputStr = readLine(), !inputStr.isEmpty {
    isPalindrome(inputStr)
}
else {
    print("Упс... Введено что-то не то...")
}
*/

// lvl_3
/*
// 1. Функция по возврату N чисел Фибоначчи

func fibonacciSequence(count: Int) {
    var fiboPrev = 1
    var fiboActual = 0
    
    for index in 1...count
    {
        let temp = fiboPrev + fiboActual
        fiboPrev = fiboActual
        fiboActual = temp
        print("\(index). \(fiboActual)")
    }
}

print("Привет, я умею вычислять числа Фибоначчи")
print("Укажите, сколько чисел Фибоначчи требуется вывести:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum), num > 0 {
    fibonacciSequence(count: num)
}
else {
    print("Упс... что-то пошло не так...")
}

// 2. Поиск простых чисел // например, до 40 у нас 12 простых чисел

// потно......
func findPrimes(upTo: Int) -> [Int] {
    var foundedPrimes = [Int](arrayLiteral: 2) // массив для найденных простых чисел
    var count = 1 // счетчик для найденных простых чисел
    
    for number in 3...upTo // проверяем числа с 3 (2 уже в массиве учтено)
    {
        var isPrime = true // считаем число предвариетльно простым
        // Проверим делители числа
        for primeNum in foundedPrimes // делим потенциальное простое на найденные простые из массива
        {
            // если проверили все значения меньше корня потенциального простого числа
            if (primeNum * primeNum) <= number {
                if number % primeNum == 0 {
                    // то оно точно не простое
                    isPrime = false
                    break // прерываем дальнешие поиски
                }
            }
        }
        // если флаг isPrime остался истинным, то добавляем число в массив
        if isPrime
        {
            foundedPrimes.append(number)
            count += 1
        }
    }
    print("Насчитал \(count) простых чисел от 2 до \(upTo)")
    return foundedPrimes
}

print("Привет, я умею выводить список простых чисел до заданного предела (не больше 1000)")
print("Пожалуйста, введите до какого числа мы ищем:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum), (num > 2 && num <= 1000) {
    let foundPrimes = findPrimes(upTo: num)
    print("Вот итоговый массив:")
    print(foundPrimes)
}
else {
    print("Что-то пошло не так...")
    print("Возможно введенное значение вне допустимого диапазона")
}

// 3. Рекурсивный факториал

func factorialRecursive(of: Int) -> Int {
    let next = of - 1
    var res = 1
    // если дошли до единицы, значит можно больше не вызывать
    if next > 1 {
        res = factorialRecursive(of: next)
    }
    // осталось каскадно все это дело перемножить
    // 1 *= 2
    // 2 *= 3 и т.д...
    res *= of
    return res
}

print("Привет! Я умею вычислять факториалы, для какого числа ты бы хотел узнать факториал?")
print("Введи положительное целое число:", terminator: " ")
if let inputNum = readLine(), let num = Int(inputNum), (num > 0) {
    let result = factorialRecursive(of: num)
    print("Факториал числа \(num)! = \(result)")
}
else {
    print("Требуется ввести целое положительное число!")
}

// 4. Разбиение строки

func splitString(by: Character) -> [Substring] {
    var resultStrArr = [Substring]()
    
    print("Введите строку, содержащую пробелы или запятые в качестве разделителя:")
    if let inputStr = readLine() {
        switch by {
        case ",":
            resultStrArr = inputStr.split(separator: ",")
        case " ":
            resultStrArr = inputStr.split(separator: " ")
        default:
            print("Я не знаю такого разделителя...")
        }
    }
    return resultStrArr
}

print("Я могу разделить введенную строку по разделителям ' ' и ','")
print("Введите используемый разделитель - пробел или запятая")
if let inputChar = readLine(), !inputChar.isEmpty {
    let separator = Character(inputChar)
    let separatedStr = splitString(by: separator)
    if !separatedStr.isEmpty {
        print(separatedStr)
    }
    else {
        print("Что-пошло не так, возможно строка была пустой")
    }
}
else {
    print("Кажется был введена пустота...")
}

// 5. Подсчет букв и цифр (решил реализовать через словарь, так вообще делают??)

func countLettersAndDigits(_ inputStr: String) -> (letters: Int, digits: Int) {
    var countTuple = (letters: 0, digits: 0)
    for char in inputStr {
        if char.isLetter {
            countTuple.letters += 1
        }
        else if char.isNumber {
            countTuple.digits += 1
        }
    }
    return countTuple
}

print("Привет, я могу подсчитать колиество букв и цифр в введенной строке!")
print("Мне всего лишь требуется какая нибудь строка:")
if let inputStr = readLine(), !inputStr.isEmpty {
    let resultTuple = countLettersAndDigits(inputStr)
    print("letters: \(resultTuple.letters), digits: \(resultTuple.digits)")
}
else {
    print("Кажется была введена пустая строка...")
}
*/

// lvl_dop
/*
// 1. Перевод температуры

func convertTemperature(value: Double, from: Character, to: Character) -> Double {
    let fromToTempTuple = (from, to)
    /*
     ("K", "K") ("K", "C") ("K", "F")
     ("C", "K") ("C", "C") ("C", "F")
     ("F", "K") ("F", "C") ("F", "F")
     */
    var resValue = value
    
    switch fromToTempTuple {
    case ("K", "K"): break
    case ("K", "C"): resValue -= 273.15
    case ("K", "F"): resValue = (resValue * 1.8) - 459.67
    case ("C", "K"): resValue += 273.15
    case ("C", "C"): break
    case ("C", "F"): resValue = (resValue * 1.8) + 32
    case ("F", "K"): resValue = (resValue + 459.67) / 1.8
    case ("F", "C"): resValue = (resValue - 32) / 1.8
    case ("F", "F"): break
    default: print("Я такой шкалы не знаю...")
    }
    
    return resValue
}

print("Привет! Я умею переводить температуру, давай начнем")
print("Введите значение температуры:", terminator: " ")
if let inputValue = readLine(), let value = Double(inputValue) {
    print("Теперь введите шкалу, в которой вы указали температуру (C, K, F):", terminator: " ")
    if let inputFrom = readLine(), !inputFrom.isEmpty {
        let from = Character(inputFrom.uppercased())
        print("Отлично! Теперь введите шкалу, в которую мы переводим (C, K, F):", terminator: " ")
        if let inputTo = readLine(), !inputTo.isEmpty {
            let to = Character(inputTo.uppercased())
            let convertedTemperature = convertTemperature(value: value, from: from, to: to)
            if convertedTemperature != value {
                print("\(value)\(from) это \(convertedTemperature)\(to)")
            }
            else {
                print("Вы ввели \(value) \(from), но что-то пошло не так...")
            }
        }
        else {
            print("Что-то пошло не так при вводе шкалы перевода...")
        }
    }
    else {
        print("Что-то пошло не так при вводе шкалы...")
    }
}
else {
    print("Что-то произошло при вводе температуры...")
}

// 2. Поиск общих элементов

func commonElements(array1: [Int], array2: [Int]) -> [Int] {
    var resultArray = [Int]()
    for item1 in array1 {
        for item2 in array2 {
            if item1 == item2 {
                resultArray.append(item1)
            }
        }
    }
    return resultArray
}

print("Привет, я могу найти общие элементы двух введенных массивов и вернуть массив общих элементов!")
print("Прошу ввести первый массив через пробел:", terminator: " ")
if let inputArr1 = readLine(), !inputArr1.isEmpty {
    let splitParts1 = inputArr1.split(separator: " ")
    var array1 = [Int]() // хочу обсудить разницу между array1: [Int] = []
    for splitPart in splitParts1 {
        if let number = Int(splitPart) {
            array1.append(number)
        }
        else {
            print("Похоже это не число...")
        }
    }
    
    print("Прошу ввести второй массив через пробел:", terminator: " ")
    if let inputArr2 = readLine(), !inputArr2.isEmpty {
        let splitParts2 = inputArr2.split(separator: " ")
        var array2 = [Int]()
        for splitPart in splitParts2 {
            if let number = Int(splitPart) {
                array2.append(number)
            }
            else {
                print("Похоже это не число...")
            }
        }
        let resultArray = commonElements(array1: array1, array2: array2)
        print("Массив общих элементов: \(resultArray)")
    }
    else {
        print("Похоже, введен пустой массив...")
    }
}
else {
    print("Похоже, введен пустой массив...")
}

// 3. Удаление дубликатов

func removeDuplicates(_ arrWithDuplicates: [Int]) {
    var resultArray = [Int]()
    
    for item in arrWithDuplicates {
        if !resultArray.contains(item) {
            resultArray.append(item)
        }
    }
    print("Массив, без дубликтов: \(resultArray)")
}

print("Привет, я могу найти дубликаты внутри введенного массива и вернуть массив уникальных элементов!")
print("Прошу массив через пробел:", terminator: " ")
if let inputArr = readLine(), !inputArr.isEmpty {
    let splitParts = inputArr.split(separator: " ")
    var array = [Int]() // хочу обсудить разницу между array1: [Int] = []
    for splitPart in splitParts {
        if let number = Int(splitPart) {
            array.append(number)
        }
        else {
            print("Похоже это не число...")
        }
    }
    removeDuplicates(array)
}
else {
    print("Похоже, введен пустой массив...")
}

// 4. Счастливый билет

func isLuckyTicket(_ maybeLuckyTicket: Int) {
    var tempNum = maybeLuckyTicket
    var sumHalfOne = 0
    var sumHalfTwo = 0
    
    // Последние три цифры, отрезаем по одной цифре путем нахождения остатка от деления на 10
    for _ in 1...3
    {
        let digit = tempNum % 10
        sumHalfTwo += digit
        tempNum /= 10
    }
    
    // Первые три цифры, также накапливает сумму цифр путем нахождения остатка от деления на 10
    for _ in 1...3
    {
        let digit = tempNum % 10
        sumHalfOne += digit
        tempNum /= 10
    }
    
    if sumHalfOne == sumHalfTwo
    {
        print("Билет '\(maybeLuckyTicket)' счастливый!!!")
    }
    else
    {
        print("Билет '\(maybeLuckyTicket)' несчастливый!")
    }
}

print("Привет! Я могу определить счастливый ли твой билет, просто введи его 6-значный номер:", terminator: " ")
if let inputNum = readLine(), let ticketNum = Int(inputNum), (ticketNum >= 100_000 && ticketNum <= 999_999)
{
    isLuckyTicket(ticketNum)
}
else
{
    print("Номер билета должен состоять из 6 цифр!")
}


// 5. Вычисление среднего значения

func average(numbers: [Int]) -> Double? {
    var average: Double = 0.0
    var count = 0
    for number in numbers {
        average += Double(number)
        count += 1
    }
    
    if numbers.isEmpty {
        return nil
    }
    else {
        return average
    }
}

print("Привет, я могу вычислить среднее значение введенного массива")
print("Введите массив через пробел:", terminator: " ")
if let inputArr = readLine() {
    
    // Обработка введененой строки
    let splitParts = inputArr.split(separator: " ")
    var array = [Int]() // хочу обсудить разницу между array1: [Int] = []
    for splitPart in splitParts {
        if let number = Int(splitPart) {
            array.append(number)
        }
        else {
            print("Похоже это не число...")
        }
    }
    
    // Обработка возвращаемого функцией значения
    if let average = average(numbers: array) {
        print("Среднее значение введенного массива: \(average)")
    }
    else {
        print("Был введен пустой массив!")
    }
}
else {
    print("Похоже что-то пошло не так...")
}
*/
*/

// Enumerations
/*
// lvl_1
/*
// 1. Дни недели

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func printDayOfWeek(_ dayOfWeek: Weekday) {
    switch dayOfWeek {
    case .monday    : print("Понедельник")
    case .tuesday   : print("Вторник")
    case .wednesday : print("Среда")
    case .thursday  : print("Четверг")
    case .friday    : print("Пятница")
    case .saturday  : print("Суббота")
    case .sunday    : print("Воскресенье")
        
    }
}

let currentDayOfWeek = Weekday.friday

print("Сегодня:", terminator: " ")
printDayOfWeek(currentDayOfWeek)
print("Вызвал функцию без дополнительного диалога")

// 2. Сезоны года

enum Season: String {
    case winter = "Зима"
    case spring = "Весна"
    case summer = "Лето"
    case autumn = "Осень"
}

extension Season {
    func desciption() -> String {
        print("Привожу описание сезона '\(self.rawValue)':")
        switch self {
        case .winter :
            return """
                  Зима - характеризуется отрицательными температурами,
                  отсутсвием роста растений, суровыми условиями окружающей среды.
                  Включает месяцы: декабрь, янаварь, фераль.
                  """
        case .spring :
            return """
                  Весна - характеризуется положительными температурами,
                  цветением природы, постепенным улучшением условий 
                  окружающей среды.
                  Включает месяцы: март, апрель, май.
                  """
        case .summer :
            return """
                   Лето - характеризуется самыми высокими температурами,
                   наличием растений и плодов, благоприятными условиями 
                   окружающей среды.
                   Включает месяцы: июнь, июль, август.
                   """
        case .autumn :
            return """
                   Осень - характеризуется снижением температуры,
                   сбором урожая, опадением листвы, ухудшением
                   условий окружающей среды.
                   Включает месяцы: сентябрь, октябрь, ноябрь.
                   """
        }
    }
}

let seasonDef = Season.spring
print(seasonDef.desciption())

// 3. Цвета светофора

enum TrafficLight: String {
    case red = "Красный"
    case yellow = "Желтый"
    case green = "Зеленый"
}

extension TrafficLight {
    func next() -> TrafficLight {
        print("Следующий цвет в цикле:", terminator: " ")
        switch self {
        case .red       : return .yellow
        case .yellow    : return .green
        case .green     : return .red
        }
    }
}

let currentTrafficLight = TrafficLight.red
print("Текущий сигнал светофора: \(currentTrafficLight.rawValue)")
print("За ним следует: \(currentTrafficLight.next().rawValue)")

// 4. Типы треугольников

enum TriangleType: String {
    case equalateral = "Равносторонний"
    case isosceles = "Равнобедренный"
    case scalene = "Разносторонний"
}

func typeOfTriangle(a: Double, b: Double, c: Double) -> TriangleType {
    var resType = TriangleType.equalateral
    if (a == b && a == c && b == c) {
        resType = TriangleType.equalateral
    }
    if (a == b && a != c) {
        resType = TriangleType.isosceles
    }
    if (a != b && a != c && b != c) {
        resType = TriangleType.scalene
    }
    return resType
}

print("Привет, я умею определять тип треугольника по его сторонам!")
print("Для этого мне нужно получить три стороны")
// Запрашиваем значения для сторон
// 1 сторона
print("Введите первую сторону треугольника:", terminator: " ")
guard let inputSide = readLine(), let sideOne = Double(inputSide), sideOne > 0 else
{
    print("Сторона должны быть положительной...")
    exit(0)
}
// 2 сторона
print("Введите вторую сторну треугольника:", terminator: " ")
guard let inputSide = readLine(), let sideTwo = Double(inputSide), sideTwo > 0 else
{
    print("Сторона должны быть положительной...")
    exit(0)
}
// 3 сторона
print("Введите третью сторону треугольника:", terminator: " ")
guard let inputSide = readLine(), let sideThree = Double(inputSide), sideThree > 0 else
{
    print("Сторона должны быть положительной...")
    exit(0)
}

let myTriangle = typeOfTriangle(a: sideOne, b: sideTwo, c: sideThree)
print("Треугольник \(myTriangle.rawValue)")

// 5. Направления компаса

enum CompassDirection: String {
    case north = "Север"
    case south = "Юг"
    case west = "Запад"
    case east = "Восток"
}

func oppositeDirection(_ direction: CompassDirection) -> CompassDirection {
    switch direction {
    case .north : return .south
    case .west  : return .east
    case .south : return .north
    case .east  : return .west
    }
}

print("Привет, я умею выводить противоположную сторону света")
print("Чтобы в этом убедиться, введите сторону света:", terminator: " ")
if let inputSide = readLine(), !inputSide.isEmpty {
    // создаем сторону котороую пока еще не назначили ни одной стороне света
    // такой подход норм?? или лучше присвоить ей какой нибудь член перечисления сразу??
    // (как я сделал в треугольниках?)
    var side: CompassDirection?
    // принимаем сторону от пользователя и проверяем что там
    switch inputSide.lowercased() {
    case "север"    : side = .north
    case "юг"       : side = .south
    case "запад"    : side = .west
    case "восток"   : side = .east
    default : print("Такой стороны света не существует!")
    }
    // если введена корректная сторона света вызываем функция по нахождению ее противоположности
    if side != nil {
        let oppositeSide = oppositeDirection(side!)
        print("Противоположная сторона света для '\(side!.rawValue)': '\(oppositeSide.rawValue)'")
    }
}
else {
    print("Мне не подойдет пустая строка...")
}
*/

// lvl_2
/*
// 1. Перечисления с raw значениями

enum Month: Int {
    case january = 1, february, march, april, may,
         june, july, august, september, october,
         november, december
}

func whichMonth(_ numberOfMonth: Month) -> String {
    var nameOfMonth = ""
    switch numberOfMonth {
    case .january   : nameOfMonth = "Январь" //
        return nameOfMonth
    case .february  : nameOfMonth = "Февраль"
        return nameOfMonth
    case .march     : nameOfMonth = "Март"
        return nameOfMonth
    case .april     : nameOfMonth = "Апрель"
        return nameOfMonth
    case .may       : nameOfMonth = "Май"
        return nameOfMonth
    case .june      : nameOfMonth = "Июнь"
        return nameOfMonth
    case .july      : nameOfMonth = "Июль"
        return nameOfMonth
    case .august    : nameOfMonth = "Август"
        return nameOfMonth
    case .september : nameOfMonth = "Сентябрь"
        return nameOfMonth
    case .october   : nameOfMonth = "Октябрь"
        return nameOfMonth
    case .november  : nameOfMonth = "Ноябрь"
        return nameOfMonth
    case .december  : nameOfMonth = "Декабрь"
        return nameOfMonth
    }
}

print("Я умею выводить имя месяца по его порядковому номеру!")
print("Название какого из 12 месяцев вы хотите узнать?:", terminator: " ")
if let inputNum = readLine(), let numOfMonth = Int(inputNum), (numOfMonth >= 1 && numOfMonth <= 12) {
    let month = Month.init(rawValue: numOfMonth)
    let strOfMonth = whichMonth(month!)
    print("\(numOfMonth)-й месяц называется \(strOfMonth)")
}
else {
    print("Такого месяца нет!")
}

// 2. HTTP методы

enum HTTPMetod {
    // Перечисляю методы HTTP
    case GET, POST, PUT, DELETE
    // Создаю описание для каждого метода HTTP
    func description() {
        switch self {
        case .GET    :  print("""
                              Метод GET запрашивает представление ресурса. 
                              Запросы с использованием этого метода могут только извлекать данные.
                              """)
        case .POST   :  print("""
                              Метод POST используется для отправки сущностей к определённому ресурсу. 
                              Часто вызывает изменение состояния или какие-то побочные эффекты на сервере.
                              """)
        case .PUT    :  print("""
                              Метод PUT заменяет все текущие представления ресурса данными запроса.
                              """)
        case .DELETE :  print("""
                              Метод DELETE удаляет указанный ресурс.
                              """)
        }
    }
}

let aboutMethod = HTTPMetod.GET
aboutMethod.description()

// 3. Координаты точек

enum Point {
    case coordinates(x: Double, y: Double)
}

func distance(point1 : Point, point2 : Point) -> Double {
    // надо еще раз обсудить доставание значений, я кажется не до конца понимаю эту конструкцию...
    guard case let .coordinates(x1, y1) = point1, // создаем две константы за раз
          case let .coordinates(x2, y2) = point2 else { // создаем еще две константы за раз
        return 0 // возвращаем ноль если не получилось присвоить значения
    }

    // d = sqrt((x2 - x1)^2 + (y2 - y1)^2)
    let dx = x2 - x1
    let dy = y2 - y1
    let result = sqrt(dx * dx + dy * dy)
    return result
}

let pointA = Point.coordinates(x: 2, y: 5)
let pointB = Point.coordinates(x: -2, y: -6)

let distanceBetween = distance(point1: pointA, point2: pointB)
print("Расстояние между точками \(pointA) - \(pointB) = \(distanceBetween)")

// 4. Типы ошибок

enum ErrorType {
    case invalidInput, fileNotFound, networkError
    
    func message() -> String {
        var errorMessage = ""
        switch self {
        case .invalidInput : errorMessage = "Некорректный ввод"
            return errorMessage
        case .fileNotFound : errorMessage = "Файл не найден"
            return errorMessage
        case .networkError : errorMessage = "Ошибка сети"
            return errorMessage
        }
    }
}

let error = ErrorType.fileNotFound
print(error.message())

// 5. Типы данных

enum DataType {
    case integer(value: Int)
    case double(value: Double)
    case string(value: String)
    case bool(value: Bool)
}

let str: DataType = .string(value: "Привет!")

*/

// lvl_3
/*
// 1. Выражения арифметических операций

enum Operation {
    case add(leftOperand: Double, rightOperand: Double)
    case substract(leftOperand: Double, rightOperand: Double)
    case multiply(leftOperand: Double, rightOperand: Double)
    case divide(leftOperand: Double, rightOperand: Double)
}

func calculate(_ operation: Operation) -> Double? {
    switch operation {
    case let .add(leftOperand: leftOp, rightOperand: rightOp) :
        return leftOp + rightOp
    case let .divide(leftOperand: leftOp, rightOperand: rightOp) :
        if rightOp != 0 {
            return leftOp / rightOp
        }
        else {
            print("Деление на ноль!")
            return nil
        }
    case let .multiply(leftOperand: leftOp, rightOperand: rightOp) :
        return leftOp * rightOp
    case let .substract(leftOperand: leftOp, rightOperand: rightOp) :
        return leftOp - rightOp
    }
}

let operationToCalculate: Operation = .divide(leftOperand: 13, rightOperand: 3)
let resultOfCalculate = calculate(operationToCalculate)
if resultOfCalculate != nil { // перед распаковкой опционала проверяю содержит ли он значение
    print("Результат вычисления: \(resultOfCalculate!)")
}

// 2. Фигуры

enum Shape {
    case circle(radius: Double)
    case rectangle(sideA: Double, sideB: Double)
    case triangle(sideForArea: Double, height: Double)
    
    // общий вопрос, должен ли корректность ввода проверять метод, или это обработка при вводе значений пользователем?
    func area() -> Double {
        switch self {
        case let .circle(radius: radiusOfCircle) :
            return Double.pi * radiusOfCircle * radiusOfCircle
        case let .rectangle(sideA: sideA, sideB: sideB) :
            return sideA * sideB
        case let .triangle(sideForArea: side, height: height) :
            return (side * height) / 2
        }
    }
}

let someFigure: Shape = .triangle(sideForArea: 12, height: 23)
print("Площадь выбранной фигуры равна: \(someFigure.area())")

// 3. Монеты

enum Coin: Int {
    case one = 1
    case two = 2
    case five = 5
    case ten = 10
    case fifty = 50
    case hundred = 100
    case twoHundred = 200
    case fiveHundred = 500
    case thousand = 1000
}

func totalValueInWallet(_ coins: [Coin]) -> Int {
    var totalValue = 0
    for coin in coins {
        totalValue += coin.rawValue
    }
    return totalValue
}

let myWallet: [Coin] = [.one, .ten, .twoHundred]

let totalValue = totalValueInWallet(myWallet)
print("Содержимое кошелька: \(totalValue) монет")

// 4. Статус заказа

enum OrderStatus {
    case new
    case inProgress
    case sent
    case delivered
    
    func canCancel() -> Bool {
        switch self {
        case .new        : return true
        case .inProgress : return true
        case .sent       : return false 
        case .delivered  : return false
        }
    }
}

let myOrder = OrderStatus.new

let canCancel = myOrder.canCancel()
if canCancel {
    print("Да, заказ может быть отменен на данном этапе")
}
else {
    print("Нет, к сожалению заказ отменить уже нельзя")
}

// 5. Калькулятор с перечислением

enum CalculatorAction {
    case add(leftOperand: Double, rightOperand: Double)
    case substract(leftOperand: Double, rightOperand: Double)
    case multiply(leftOperand: Double, rightOperand: Double)
    case divide(leftOperand: Double, rightOperand: Double)
}

func actionOfCalc(_ operation: CalculatorAction) -> Double {
    switch operation {
    case let .add(leftOperand: leftOp, rightOperand: rightOp) :
        return leftOp + rightOp
    case let .divide(leftOperand: leftOp, rightOperand: rightOp) :
        if rightOp != 0 {
            return leftOp / rightOp
        }
        else {
            print("Деление на ноль!")
            return 0
        }
    case let .multiply(leftOperand: leftOp, rightOperand: rightOp) :
        return leftOp * rightOp
    case let .substract(leftOperand: leftOp, rightOperand: rightOp) :
        return leftOp - rightOp
    }
}

let mul = CalculatorAction.multiply(leftOperand: 2, rightOperand: 345)

print(actionOfCalc(mul))

*/

// lvl_dop
/*
// 1. Телефонные номера

enum PhoneNumberType {
    case mobile(countryCode: String) // +7 (123) 456-7890
    case home(countryCode: String) // +7 (495) 123-45-67
    case work(countryCode: String) // +7 (495) 123-4567
}

func formatNumber(number: String, typeOfNumber: PhoneNumberType) -> String {
    switch typeOfNumber {
    case .home(countryCode: let code):
        if number.count == 11 {
            let cityCode = number.dropFirst(1).prefix(3)
            let body1 = number.dropFirst(4).prefix(3)
            let body2 = number.dropFirst(7).prefix(2)
            let body3 = number.dropFirst(9).prefix(2)
            return "+\(code) (\(cityCode)) \(body1)-\(body2)-\(body3)"
        }
        else {
            return "Неправильный номер!"
        }
    case .mobile(countryCode: let code):
        if number.count == 11 {
            let cityCode = number.dropFirst(1).prefix(3)
            let body1 = number.dropFirst(4).prefix(3)
            let body2 = number.dropFirst(7).prefix(4)
            return "+\(code) (\(cityCode)) \(body1)-\(body2)"
        }
        else {
            return "Неправильный номер!"
        }
    case .work(countryCode: let code):
        if number.count == 11 {
            let cityCode = number.dropFirst(1).prefix(3)
            let body1 = number.dropFirst(4).prefix(3)
            let body2 = number.dropFirst(7).prefix(4)
            return "+\(code) (\(cityCode)) \(body1)-\(body2)"
        }
        else {
            return "Неправильный номер!"
        }
    }
}

let myNumber = "79992578713"
print(formatNumber(number: myNumber, typeOfNumber: .mobile(countryCode: "7")))

// 2. Режим работы приложения

enum AppMode {
    case LightTheme
    case DarkTHeme
    case BatterySaveMode

    func apply() -> String {
        switch self {
        case .LightTheme: return "Активирована светлая тема"
        case .DarkTHeme: return "Активирована темная тема"
        case .BatterySaveMode: return "Активирован режим энергосбережения"
        }
    }
}

let myApp = AppMode.BatterySaveMode
print(myApp.apply())


// 3. Карты

// Перечисление для масти
enum CardSuit: String {
    case spades = "\u{2660}"
    case hearts = "\u{2665}"
    case diamonds = "\u{2666}"
    case clubs = "\u{2663}"
}

// Перечисление для ранга карт
enum CardRunk: String {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
    case ace = "A"
}

// Структура для отображения
struct Card {
    let suit: CardSuit
    let runk: CardRunk
    
    func description() -> String {
        return "\(runk.rawValue)\(suit.rawValue)"
    }
}

// Функция возвращающая массив структур типа Карта
func generateCardDeck() -> [Card] {
    var cardDeck: [Card] = []
    
    // Массив мастей типа CardSuit
    let suits: [CardSuit] = [.spades, .hearts, .diamonds, .clubs]
    
    // Массив рангов типа CardRank
    let ranks: [CardRunk] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten,
                             .jack, .queen, .king, .ace]
    
    // Сбор колоды
    for suit in suits {
        for rank in ranks {
            let card = Card(suit: suit, runk: rank)
            cardDeck.append(card)
        }
    }
    
    return cardDeck
}

let cardDeck = generateCardDeck()

for card in cardDeck {
    print(card.description())
}

// 4. Команды управления роботом

enum RobotCommand {
    case forward(howMany: Int)
    case backward(howMany: Int)
    case turnLeft(whichAngle: Int)
    case turnRight(whichAngle: Int)
}

func executeCommand(_ command: RobotCommand) -> String {
    switch command {
    case .forward(howMany: let steps):
        return "Робот проехал \(steps) шагов вперед"
    case .backward(howMany: let steps):
        return "Робот проехал \(steps) шагов назад"
    case .turnLeft(whichAngle: let degrees):
        return "Робот повернулся на \(degrees) градусов влево"
    case .turnRight(whichAngle: let degrees):
        return "Робот повернулся на \(degrees) градусов вправо"
    }
}

// Массив для хранения перемещений моего робота
var myWayForRobot: [RobotCommand] = []

// Заполняю массив перемещений для моего робота команадами
myWayForRobot.append(RobotCommand.forward(howMany: 10))
myWayForRobot.append(RobotCommand.turnRight(whichAngle: 36))
myWayForRobot.append(RobotCommand.forward(howMany: 7))

print(executeCommand(myWayForRobot[0]))
print(executeCommand(myWayForRobot[1]))
print(executeCommand(myWayForRobot[2]))

// 5. Типы событий

enum EventType {
    case meeting(date: Date, time: String, location: String)
    case conference(date: Date, time: String, location: String, speakers: [String])
    case seminar(date: Date, time: String, location: String, topic: String)
}

func processEvent(_ event: EventType) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    
    switch event {
    case let .meeting(date, time, location):
        return "Встреча: \(dateFormatter.string(from: date)) - \(time) - \(location)"
    case let .conference(date, time, location, speakers):
        return "Конференция: \(dateFormatter.string(from: date)) - \(time) - \(location)\nСпикеры: \(speakers.joined(separator: ", "))"
    case let .seminar(date, time, location, topic):
        return "Семинар: \(dateFormatter.string(from: date)) - \(time) - \(location)\nТема: \(topic)"
    }
}

let calendar = Calendar.current
let components = DateComponents(year: 2025, month: 03, day: 11)
let date = calendar.date(from: components)!

// Семинар
let seminar = EventType.seminar(date: date, time: "18:30", location: "ConfHall 187", topic: "Swift Vkat")

print(processEvent(seminar))

*/
*/


// Structures and Classes
/*
// lvl_1
/*
// 1. Создание простой структуры && 3. Методы в структуре

struct Person {
    var name: String
    var age: Int
    
    // 3.
    func sayHello() -> String {
        return "Привет, меня зовут \(self.name) и мне \(self.age) лет!"
    }
}

let somebody = Person(name: "Данила", age: 25)
print(somebody.sayHello())


// 2. Создание простого класса && 4. Методы в классе && 5. Инициализатор

class Car {
    var brand: String
    var model: String
    var year: Int
    
    // 4.
    func startEngine() -> String {
        return "Двигатель \(self.brand) \(self.model) запущен!"
    }
    
    // 5.
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
}

let someCar = Car(brand: "Honda", model: "CR-V", year: 2013)
// 2.
print("У нас тут машина \(someCar.brand) \(someCar.model) \(someCar.year) года.")
// 4.
print(someCar.startEngine())

*/

// lvl_2
/*
// 1. Различия между классами и структурами

struct Point {
    var x: Int
    var y: Int
}

var point1 = Point(x: 21, y: 19)
var point2 = point1

print("До изменений экземпляра структуры:")
print(point1.x, point1.y)
print(point2.x, point2.y)

point1.x = 10

print("После изменений экземпляра структуры:")
print(point1.x, point1.y)
print(point2.x, point2.y)

// => экземляры point1 point2 получили копии структуры для работы

class PointClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

var point3 = PointClass(x: 34, y: 17)
var point4 = point3

print("До изменений экземпляра класса:")
print(point3.x, point3.y)
print(point4.x, point3.y)

point3.x = 10

print("После изменений экземпляра класса:")
print(point3.x, point3.y)
print(point4.x, point3.y)

// => экземпляры point3 point4 ссылаются на одну область в памяти, полученную при инициализации point3
 
// 2. Вычисляемые свойства

//struct Person {
//    var name: String
//    var age: Int
//    
//    func isAdult() -> Bool {
//        return self.age >= 18
//    }
//    
//    func sayHello() -> String {
//        return "Привет, меня зовут \(self.name) и мне \(self.age) лет!"
//    }
//}
//
//var me = Person(name: "Данила", age: 25)
//if me.isAdult() {
//    print("Вы совершеннолетний.")
//}
//else {
//    print("Вы не достигли совершеннолетия.")
//}

// 3. Свойства только для чтения

//class Car {
//    var brand: String
//    var model: String
//    var year: Int
//    
//    var description: String {
//        return "Это \(self.brand) \(self.model) \(self.year) года выпуска."
//    }
//    
//    func startEngine() -> String {
//        return "Двигатель \(self.brand) \(self.model) запущен!"
//    }
//    
//    init(brand: String, model: String, year: Int) {
//        self.brand = brand
//        self.model = model
//        self.year = year
//    }
//}
//
//var someCar = Car(brand: "Honda", model: "CR-V", year: 2013)
//print(someCar.description)

// 4. Наследование

//class Vehicle {
//    var brand: String
//    var model: String
//    var year: Int
//    
//    func drive() -> String {
//        return "Автомобиль \(self.brand) \(self.model) едет!"
//    }
//    
//    init(brand: String, model: String, year: Int) {
//        self.brand = brand
//        self.model = model
//        self.year = year
//    }
//}
//class Car: Vehicle {
//var numOfDoor: Int
//
//// инициализатор для класса Car
//init(brand: String, model: String, year: Int, numOfDoor: Int) {
//    self.numOfDoor = numOfDoor
//    super.init(brand: brand, model: model, year: year) // Инициализатор родительского класса
//}
//
//// Переопределение метода drive()
//override func drive() -> String {
//    return "\(self.numOfDoor)-дверный автомобиль \(self.brand) \(self.model) едет!"
//}
//}
//
//let someCar = Car(brand: "Honda", model: "CR-V", year: 2013, numOfDoor: 5)
//print(someCar.drive())

// 5. Протоколы

// Усов с. 405
protocol Describable {
    var description: String { get }
}

class Car: Describable {
    var brand: String
    var model: String
    var year: Int
    var description: String {
        return "Это \(self.brand) \(self.model) \(self.year) года выпуска."
    }

    func startEngine() -> String {
        return "Двигатель \(self.brand) \(self.model) запущен!"
    }

    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
}

struct Person: Describable {
    var name: String
    var age: Int
    var description: String {
        return "Привет, меня зовут \(self.name) и мне \(self.age) лет!"
    }
    
    func isAdult() -> Bool {
        return self.age >= 18
    }
    
    func sayHello() -> String {
        return "Привет, меня зовут \(self.name) и мне \(self.age) лет!"
    }
}

var me = Person(name: "Данила", age: 25)
print(me.description)
if me.isAdult() {
    print("Вы совершеннолетний.")
}
else {
    print("Вы не достигли совершеннолетия.")
}

var someCar = Car(brand: "Honda", model: "CR-V", year: 2013)
print(someCar.description)

*/


// lvl_3
/*
// 1. Композиция

class Address {
    var street: String
    var city: String
    var zipCode: Int?
    
    init(street: String, city: String, zipCode: Int?) {
        self.street = street
        self.city = city
        self.zipCode = zipCode
    }
}

class Person {
    var name: String
    var age: Int
    var address: Address
    
    init(name: String, age: Int, address: Address) {
        self.name = name
        self.age = age
        self.address = address
    }
}

var me = Person(name: "Данила", age: 25, address: .init(street: "Скарятинский пер.", city: "Москва", zipCode: 121069))
print("\(me.name) живет в городе \(me.address.city), на \(me.address.street),")
print("ему \(me.age), возможно вы можете отправить ему письмо на \(me.address.zipCode ?? 0)")


// 2. Статические свойства и методы

class Car {
    var brand: String
    var model: String
    var year: Int
    
    // статическое свойство
    static var totalCars: Int  = 0

    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
        
        // при инициализации свойство увеличивается
        Car.totalCars += 1
    }
    
    // статический метод для вывода
    static func printTotalCars() {
        print("Всего создано \(totalCars) автомобилей")
    }
}

let car1 = Car(brand: "Honda", model: "CR-V", year: 2013)
let car2 = Car(brand: "Lada", model: "Vesta", year: 2024)
let car3 = Car(brand: "Skoda", model: "Octavia", year: 2019)

Car.printTotalCars()

// 3. Кастомный инициализатор

struct Rectangle {
    var width: Double
    var height: Double
    
    init(area: Double) {
        self.height = sqrt(area)
        self.width = sqrt(area)
    }
}

var rect = Rectangle(area: 256.87)
print("При введенной площади")
print("Ширина: \(rect.width), высота: \(rect.height)")

// 4. Копирование объектов

class Book {
    // Свойства класса
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    
    // Методы класса
    func copy() -> Book {
        return Book(title: title, author: author)
    }
}

let book1 = Book(title: "Кровь эльфов", author: "А. Сапковский")
let book2 = book1.copy()
print(book1 === book2) // определяем тожественность данных экземпляров

// 5. Сравнение объектов

struct Point {
    var x: Int
    var y: Int
    
    func isEqual(to other: Point) -> Bool {
        return x == other.x && y == other.y
    }
}

let point1 = Point(x: 1, y: 2)
let point2 = Point(x: 3, y: 3)
print(point1.isEqual(to: point2))

*/

// lvl_dop
/*
// 1. Хранение массива объектов

class Student {
    var name: String
    var grade: Int
    
    init(name: String, grade: Int) {
        self.name = name
        self.grade = grade
    }
}

class Classroom {
    // Свойства класса
    var students: [Student] = []
    
    // Методы класса
    // Добавление студента
    func addStudent(_ student: Student) {
        students.append(student)
    }
    // Отчисление студента
    func removeStudent(_ who: String) {
        for (position, student) in students.enumerated() {
            if student.name == who {
                students.remove(at: position)
            }
        }
    }
    // Получить среднюю оценку
    func getAverageGrade() -> Double {
        var sumOfGrades = 0
        for student in students {
            sumOfGrades += student.grade
        }
        return Double(sumOfGrades) / Double(students.count)
    }
}

let student1 = Student(name: "Иван", grade: 4)
let student2 = Student(name: "Петр", grade: 5)
let student3 = Student(name: "Мария", grade: 5)
let student4 = Student(name: "Дарья", grade: 4)
let student5 = Student(name: "Александр", grade: 4)

var myClass = Classroom()
myClass.addStudent(student1)
myClass.addStudent(student2)
myClass.addStudent(student3)
myClass.addStudent(student4)
myClass.addStudent(student5)
print("Средняя оценка: \(myClass.getAverageGrade())")
print("Отчислим одного студента...")
myClass.removeStudent("Мария")
print("Теперь студентов у нас:")
for student in myClass.students {
    print(student.name)
}
print("Средняя оценка: \(myClass.getAverageGrade())")

// 2. Константные свойства

class Circle {
    // изменяемое свойство
    var radius: Double
    // статическое свойство константное
    static let pi = 3.14159
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return Circle.pi * radius * radius
    }
}

let myCircle = Circle(radius: 24.3)
print("Площадь круга с радиусом \(myCircle.radius) = \(myCircle.area())")

// 3. Расширения

extension String {
    func isPalindrome() -> Bool {
        // Строка содержащая перевернутую изначальную
        var reversedStr = ""
        // Наполняем строку перевертыш
        for char in self.reversed() {
            reversedStr.append(char)
        }
        // Проверяем по итогу
        if self == reversedStr {
            return true
        }
        else {
            return false
        }
    }
}

let testStr = "привет"
if testStr.isPalindrome() {
    print("'\(testStr)' является палиндромом!")
}
else {
    print("'\(testStr)' не является палиндромом!")
}

*/

*/

// Closures
//*
// lvl_1
/*
// 1. Протокол Describable

protocol Describeable {
	var description: String { get }
}

class Person: Describeable {
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
	var description: String {
		return "Привет! Я \(name)!"
	}
}

class Car: Describeable {
	var model: String
	
	init(model: String) {
		self.model = model
	}
	
	var description: String {
		return "Перед нами \(model)!"
	}
}

let myCar = Car(model: "Honda CR-V")
let iAmPerson = Person(name: "Данила")

print(iAmPerson.description)
print(myCar.description)

// 2. Протокол Comparable

protocol Comparable {
	func isBigger(_ thanWho: Student) -> Bool // Сранивает больше ли у выбранного студента средний бал
}

class Student: Comparable {
	var name: String
	var averageScore: Double
	
	init(name: String, score: Double) {
		self.name = name
		self.averageScore = score
	}
	
	func isBigger(_ thanWho: Student) -> Bool {
		if self.averageScore > thanWho.averageScore {
			return true
		}
		else {
			return false
		}
	}
}

let student1 = Student(name: "Петр", score: 4.2)
let student2 = Student(name: "Анна", score: 4.1)
let isBigger = student1.isBigger(student2)
print(isBigger)

// 3. Расширение String

extension String {
	func isPalindrome() {
		var reversedStr = ""
		
		for char in self.reversed() {
			reversedStr.append(char)
		}
		
		if self.uppercased() == reversedStr.uppercased() {
			print("Слово '\(self)' является палиндромом!")
		}
		else {
			print("Слово '\(self)' не является палиндромом!")
		}
	}
}

let someStr = "Anna"
someStr.isPalindrome()

// 4. Протокол Equatable

protocol Equateble {
	func isEqual(to other: Self) -> Bool
}

struct Point {
	var x: Int
	var y: Int
	
	func isEqual(to other: Point) -> Bool {
		return x == other.x && y == other.y
	}
}

let point1 = Point(x: 1, y: 2)
let point2 = Point(x: 3, y: 3)
print(point1.isEqual(to: point2))

// 5. Расширение Array

extension Array where Element: Numeric {
	func average() -> Double? {
		guard !self.isEmpty else {
			return nil //если массив пустой
		}
		
		let sum = self.reduce(0, +)
		
		if let numericSum = sum as? Double {
			return numericSum / Double(self.count)
		} else if let numericSum = sum as? Int {
			return Double(numericSum) / Double(self.count)
		} else if let numericSum = sum as? Float {
			return Double(numericSum) / Double(self.count)
		}
		
		return nil
	}
}

let testArr = [43.5, 23.23, 76.21]
if let res = testArr.average() {
	print("Среднее значение: \(res)")
} else {
	print("Массив пустой")
}

*/

// lvl_2
//*
// 1. Протокол Identifiable

protocol Indentifiable {
	var id: String { get }
}

class User: Identifiable {
	let name: String
	let id: String
	static var counter: Int = 0
	
	init(_ name: String) {
		self.name = name
		self.id = String(User.counter)
		User.counter += 1
	}
}

struct Product: Identifiable {
	let name: String
	let id: String
	static var counter: Int = 0
	
	init(_ name: String) {
		self.name = name
		self.id = String(Product.counter)
		Product.counter += 1
	}
}

let someProduct1 = Product("Apple iPhone 14 Pro")
let someProduct2 = Product("Samsung Galaxy S25")

let somePerson1 = User("Василий")
let somePerson2 = User("Данила")

print(somePerson1.id)
print(somePerson2.id)
print(someProduct1.id)
print(someProduct2.id)

// 2. Расширение Int

extension Int {
	func isEven() -> Bool {
		self % 2 == 0 ? true : false
	}
}

let someNum = 1243231234
if someNum.isEven() {
	print("Число четное!")
}
else {
	print("Число нечетное!")
}

// 3. Протокол CustomStringConvertible

protocol CustomStringConvertible: AnyObject {
	var description: String { get }
}

class Book: CustomStringConvertible {
	let author: String
	let title: String
	
	init(author: String, title: String) {
		self.author = author
		self.title = title
	}
	
	var description: String {
		"""
		Автор: \(author) 
		Книга: \(title)
		"""
	}
}

let myBook = Book(author: "Таненбаум Эндрю", title: "Архитектура компьютера")
print(myBook.description)

// 4. Протокол Delegate

protocol Delegate: AnyObject {
	func timerDidStop()
}

class TimerClass {
	weak var delegate: Delegate?
	private var timer: Timer?
	
	func start(duration: TimeInterval) {
		print("Таймер на \(duration) секунд")
		timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { [weak self] _ in
			self?.timerFinished()
		}
	}
	
	private func timerFinished() {
		print("Таймер закончился!")
		delegate?.timerDidStop()
	}
}

class ViewController: Delegate {
	private let timer = TimerClass()
	
	init() {
		timer.delegate = self
	}
	
	func startTimer() {
		timer.start(duration: 5)
	}
	
	func timerDidStop() {
		print("ViewController: Таймер закончился!")
	}
}

let viewController = ViewController()
viewController.startTimer()

RunLoop.main.run(until: Date().addingTimeInterval(6))

// 5. Расширение Dictionary

extension Dictionary {
	func keysAsString() -> String {
		let keysArray = self.keys.map { String(describing: $0) }
		
		return keysArray.joined(separator: ", ")
	}
}

let dictOne = ["name" : "Данила", "age" : "25", "city" : "Moscow"]
let dictTwo = [1 : "one", 2 : "two", 3 : "three"]

print(dictOne.keysAsString())
print(dictTwo.keysAsString())

//*/

// lvl_3
//*
// 1.


//*/

// lvl_dop
//*
// 1.


//*/

//*/
