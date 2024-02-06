//
//  main.swift
//  Console calculator
//
//  Created by Sergey Filippov on 06.02.2024.
//

// MARK: - Описание проекта и задачи
/*
    Программа представляет собой простейший калькулятьр с вводом и выводом значений с помощью консоли.
 */

import Foundation

// Приветствуем пользователя и предлагаем выбрать необходимую операцию.
print("Добро пожаловать в программу калькулятор. \nВыберите операцию: +, -, * или /.")

//Пользователь вводит операцию.
let personalOperation: String? = readLine()

//Предлагаем ввести первое целое число.
print("Введите первое целое число:")
let personalValueA = Int(readLine()!)!

//Предлагаем ввести второе целое число.
print("Введите второе целое число: ")
let personalValueB = Int(readLine()!)!

// Выводим выражение, которое получилось.
print("Идет вычисление примера: \(personalValueA) \(personalOperation!) \(personalValueB)" )

var resultValue: Any?

switch personalOperation {
    case "+": resultValue = personalValueA + personalValueB
    case "-": resultValue = personalValueA - personalValueB
    case "*": resultValue = personalValueA * personalValueB
    case "/": resultValue = personalValueA / personalValueB
    default: print("Ничего не получилось")
}
// Выводим результат:
print("Результат: \(resultValue as! Int)")
