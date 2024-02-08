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


func calculate(personalOperation: String, personalValueA: Int, personalValueB: Int) -> Int? {
    switch personalOperation {
    case "+": return personalValueA + personalValueB
    case "-": return personalValueA - personalValueB
    case "*": return personalValueA * personalValueB
    case "/": if personalValueB != 0 {
                return personalValueA / personalValueB
                } else {
                    print("Делить на ноль нельзя!")
                    return nil
                }
    default: print("Вы ввели неверную операцию.")
            return nil
    }
}


// MARK: - Логика программы
// В массиве history хранится история посчитанных примеров пользователя.
var history: [String] = []

// Приветствуем пользователя и предлагаем выбрать необходимую операцию.
print("Добро пожаловать в программу калькулятор.")

while true {
    //Пользователь вводит операцию. Предлагаем ввести первое и второе целое число.
    let personalOperation = getDataFromUser(description: "Выберите операцию: +, -, * или /. \nДля завершения роботы введите q \nДля просмотра истории введите h")
    
    //Выход из программы
    if personalOperation == "q" {
        exit(0)
    }else if personalOperation == "h" {
        for example in history {
            print(example)
        }
        continue
    }
    //Просмотр истории примеров
    
    
    let personalValueA = getDataFromUser(description: "Введите первое целое число:")
    let personalValueB = getDataFromUser(description: "Введите второе целое число:")
    
    //Храним пример пользователя
    let example: String = personalValueA + " " + personalOperation + " " + personalValueB
    
    // Выводим выражение, которое получилось.
    print("Идет вычисление примера: \(example)" )

    //Пишем логику программы, обработку ошибок пользователя, вывод значения
    if let personalValueA = Int(personalValueA) {
        if let personalValueB = Int(personalValueB) {
           let result = calculate(personalOperation: personalOperation, personalValueA: personalValueA, personalValueB: personalValueB)
            if let result = result {
                showResult(result)
                history.append(example + " = " + String(result))
            }
        } else {
            print("Вы ввели некорректное второе число.")
        }
    } else {
        print("Вы ввели некорректное первое число.")
    }
    
    print("")
    print("--------------------------------------")
    print("")
}
