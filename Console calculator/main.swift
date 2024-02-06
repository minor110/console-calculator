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
let personalValueA = readLine() ?? ""

//Предлагаем ввести второе целое число.
print("Введите второе целое число: ")
let personalValueB = readLine() ?? ""

// Выводим выражение, которое получилось.
print("Идет вычисление примера: \(personalValueA) \(personalOperation!) \(personalValueB)" )

//Пишем логику программы, обработку ошибок пользователя, вывод значения
if let personalValueA = Int(personalValueA) {
    if let personalValueB = Int(personalValueB) {
        switch personalOperation {
            case "+": print("Результат: " + String(personalValueA + personalValueB))
            case "-": print("Результат: " + String(personalValueA - personalValueB))
            case "*": print("Результат: " + String(personalValueA * personalValueB))
            case "/": if personalValueB != 0 {
                            print("Результат: " + String(personalValueA / personalValueB))
                        } else {
                            print("Делить на ноль нельзя!")
                        }
            default: print("Вы ввели неверную операцию.")
        }
    } else {
        print("Вы ввели некорректное второе число.")
    }
} else {
        print("Вы ввели некорректное первое число.")
}
