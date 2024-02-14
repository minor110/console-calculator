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

func calculcate() {
    let operation = getDataFromUser(description: "Выберите операцию: +, -, * или /.")
    guard operation == "+" || operation == "-" || operation == "*" || operation == "/" else  {
    print("Вы ввели неверную операцию.")
        return
    }
    
    let firstNumber = getDataFromUser(description: "Введите первое число: ")
    guard let firstNumber = Int(firstNumber) else {
        print("Вы ввели неверное число.")
        return
    }
    
    let secondNumber = getDataFromUser(description: "Введите второе число: ")
    guard let secondNumber = Int(secondNumber) else {
        print("Вы ввели неверное число.")
        return
    }
    
    let example = String(firstNumber) + " " + operation + " " + String(secondNumber)
    print("Идет вычисление примера: \(example)" )
    
    let result = calculate(personalOperation: operation, personalValueA: firstNumber, personalValueB: secondNumber)
    guard let result = result else {
        return
    }
    showResult(result)
    history.append(example + " = " + String(result))
}

func showResult(_ result: Int) {
    let result = String(result)
    print("Результат: " + result )
}

//Вывод истории операций
func showHistory() {
    for example in history {
        print(example)
    }
}

func calculate(personalOperation: String, personalValueA: Int, personalValueB: Int) -> Int? {
    switch personalOperation {
    case "+": 
        return personalValueA + personalValueB
    case "-": 
        return personalValueA - personalValueB
    case "*": 
        return personalValueA * personalValueB
    case "/" where personalValueB == 0: 
        print("Делить на 0 нельзя!")
        return nil
    case "/":
        return personalValueA / personalValueB
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
    //Спрашиваем пользователя, что будем делать дальше.
    let action = getDataFromUser(description: "Что вы хотите сделать? c - расчет примета, h - просмотр истории, q - завершение работы." )
    
    switch action {
    case "c":
        calculcate()
    case "h":
        showHistory()
    case "q":
        exit(0)
    default:
        print("Недопустимое действие.")
    }
    
    print("")
    print("--------------------------------------")
    print("")
}
