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

// MARK: - Описание функций

func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? ""
}


func showResult(_ result: Int) {
    let result = String(result)
    print("Результат: " + result )
}


func calculate(personalOperation: String, personalValueA: Int, personalValueB: Int) {
    switch personalOperation {
    case "+": showResult(personalValueA + personalValueB)
    case "-": showResult(personalValueA - personalValueB)
    case "*": showResult(personalValueA * personalValueB)
    case "/": if personalValueB != 0 {
                showResult(personalValueA / personalValueB)
                } else {
                    print("Делить на ноль нельзя!")
                }
    default: print("Вы ввели неверную операцию.")
    }
}


// MARK: - Логика программы

// Приветствуем пользователя и предлагаем выбрать необходимую операцию.
print("Добро пожаловать в программу калькулятор.")

//Пользователь вводит операцию. Предлагаем ввести первое и второе целое число.
let personalOperation = getDataFromUser(description: "Выберите операцию: +, -, * или /." )
let personalValueA = getDataFromUser(description: "Введите первое целое число:")
let personalValueB = getDataFromUser(description: "Введите второе целое число:")

// Выводим выражение, которое получилось.
print("Идет вычисление примера: \(personalValueA) \(personalOperation) \(personalValueB)" )

//Пишем логику программы, обработку ошибок пользователя, вывод значения
if let personalValueA = Int(personalValueA) {
    if let personalValueB = Int(personalValueB) {
        calculate(personalOperation: personalOperation, personalValueA: personalValueA, personalValueB: personalValueB)
    } else {
        print("Вы ввели некорректное второе число.")
    }
} else {
    print("Вы ввели некорректное первое число.")
}
