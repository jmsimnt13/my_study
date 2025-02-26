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

// lvl_2
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


// lvl_3
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


// lvl_dop
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


// Loops
// lvl_1
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


// lvl_2
// 1.



// 2.



// 3.



// 4.



// 5.
