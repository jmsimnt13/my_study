//
//  main.swift
//  tasks
//
//  Created by Данила on 20.02.2025.
//

import Foundation

print("Hello, World! Here's my tasks")

// Conditions
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
