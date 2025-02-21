//
//  main.swift
//  tasks
//
//  Created by Данила on 20.02.2025.
//

import Foundation

print("Hello, World!")

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

//4.
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

//5.
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
