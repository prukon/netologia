import UIKit
//: Домашнее задание необходимо выполнить в данном файле, перед отправкой переименуйте название файла (латиницей) в формате ФамилияГруппаDZ4_3, например, *IvanovIOS4_DZ4_3*, заархивировать и приложить в личном кабинете для проверки.
/*:
 Чтобы успешно выполнить это домашнее задание, необходимо усвоить следующие темы:
 * [Коллекции eng.](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
 * [Коллекции  рус.](https://swiftbook.ru/content/languageguide/collection-types/)
 * [Управление потоком eng.](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
 * [Управление потоком рус.](https://swiftbook.ru/content/languageguide/control-flow/)
 * [Функции eng.](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
 * [Функции рус.](https://swiftbook.ru/content/languageguide/functions/)
*/
//: ## Задача №1
//: В данной задаче Вы тренируетесь Добавлять и Удалять значения в **`Хранилище (массив)`** при помощи двух функций, которые Вам и нужно реализовать. Функции принимают значение, но ничего не возвращают.
//: Первая функция добавляет элемент в массив, вторая функция удаляет элемент из массива, вы сами можете выбрать любой удобный для вас вариант добавления и удаления элементов из массива.
//: ### Алгоритм решения:
//:  * Создайте пустой массив строк типа String на любимую тематику, например, это будет Хранилище столовых приборов (этот пример не использовать), в который вы будете поочередно добавлять или удалять ложки, вилки и т.п. приборы.
//: * Создайте 2 функции в соответствии с условием.
//: * Попробуйте добавлять и удалять значения в массиве при помощи созданных функций.
//: * Что произойдет, если попытаетесь удалить значение, которого нет в Хранилище? Напишите, что в этом случае вы можете изменить в своей функции и внесите в нее изменения.
//: * *(условие со звездочкой - не обязательное) обе функции должны принимать массив и значение. Они должны добавлять или удалять значения в массиве. Функция удаления должна быть безопасной, т.е. если Хранилище пустое, мы должны сообщить об этом пользователю, если запрашиваемое на удаление значение отсутствует, необходимо также сообщить, что такого элемента нет. Запрещается использование forced unwrapping, если в вашем варианте будет необходимость работать с опционалами.*
// Решение задачи №1:
//task1
var clother : [String] = []
func addClother(add addClother : String) {
    clother.append(addClother)
}
func deleteClother(del deleteClother : String) {
    if let index = clother.firstIndex(of: deleteClother) {
        clother.remove(at: index)
    } else {
        print("Удаляемой одежды нет в списке")
    }
}
addClother(add: "Штаны")
deleteClother(del: "Штаны")
print(clother)
print("___________")

//task1*
var chancellery : [String] = []
func addPencil(items: inout Array<String>, add addPencil : String) {
    items.append(addPencil)
}
func deletePencil(items: inout Array<String>, del deletePencil : String) {
    if let index = items.firstIndex(of: deletePencil) {
        items.remove(at: index)
    } else {
        print("Удаляемой канцелярии нет в списке")
    }
}
addPencil(items: &chancellery, add: "Карандаш")
deletePencil(items: &chancellery, del: "Карандаш")
print(chancellery)
print("___________")
//: ## Задача №2
//: Вы получили тестовое задание от службы доставки еды: преобразовать бонусные баллы клиентов, которые хранятся на сайте, в денежные единицы. Со стороны сайта приходит словарь, содержащий ID клиента **(Int)** и накопленную сумму Бонусов **(Double)**. Ваша задача вернуть на сайт словарь, содержащий ID клиента **(Int)** и конвертированные денежные единицы **(Int)**, каждые 100 бонусов равны 10 денежным единицам.
//: ### Алгоритм решения:
//: * Словарь со своими значениями создавать не нужно. Значения, с которыми вы будете работать, инкапсулированы и переданы в `userPoints`.
//: * Распечатайте словарь и посмотрите, с какими значениями вы будете работать.
//: * Создайте функцию, которая принимаем словарь, ключом которого будет тип Integer, значением число с плавающей точкой Double, вернуть необходимо словарь ключом и значением, которого будет Integer.
//: * Вызовите функцию и распечатайте полученный результат.
//: * Дополнительно(не обязательно) входящих параметров может быть больше, например, для коэффициента пересчета баллов в денежные единицы.
// Решение задачи №2:
// подготовленный словарь
userPoints
print(userPoints)
print("___")
var resultPoints: [Int: Int] = [:]
func convertPoints(userPoints: Dictionary<Int, Double>, rate : Double = 0.1) -> [Int : Int] {
    for data in userPoints {
        let dataValueRate =  round(data.value * rate)
        resultPoints[data.key] = Int(dataValueRate)
    }
    return resultPoints
}
print(convertPoints(userPoints: userPoints))
print("___________")

//: ## Задача №3 (*)
//:  Вам необходимо реализовать функцию, которая принимаем массив опциональных значений типа Integer и возвращает кортеж, в который необходимо передать сумму четных и нечетных значений.
//: - Массив может содержать повторяющиеся и nil значения, например: `[1, 2, nil, 12, 1, nil, 3, 2]`.
//: - В вычислении должны быть использованы только уникальные значения, а повторяющиеся учитываться не должны. Например, у нас повторяются числа 1 и 2, но попадать в результат они должны один раз; сумма нечетных будет `(1 + 3 = 4)`, четных `(2 + 12 = 14)`.
//:  - Так как в массиве могут быть nil, а вернуть необходимо неопциональное значение, необходимо использовать безопасное развертывание опционала (optional binding).
//:  - Для проверки вашего решения передайте в функцию подготовленный массив `arrayOfNumbers`.
//:  - Массив со своими значениями создавать не нужно. Значения, с которыми вы будете работать, инкапсулированы и переданы в `arrayOfNumbers`.
//:  - Распечатайте массив и посмотрите, с какими значениями вы будете работать.
//:  - Если вы все правильно сделаете, то получите ответ: `сумма четных: 1378, нечетных: 1304`.
// Решение задачи №3(*)
// подготовленный массив
//arrayOfNumbers
print(arrayOfNumbers)
print("---")
func calculateSumEvenOddValues(from array: [Int?]) -> (Int, Int) {
    var evenNumber : Int = 0
    var oddNumber  : Int = 0
    let uniqueNumber = Set(arrayOfNumbers)
    for key in uniqueNumber {
        if let key{
                if key % 2 == 0 {
                    evenNumber = evenNumber + key
                } else if key % 1 == 0 {
                    oddNumber = oddNumber + key
                }
            }
    }
    let tuple = (even: evenNumber, odd: oddNumber)
    return (tuple.even,tuple.odd)
}
// проверка решения Задача №3
print(calculateSumEvenOddValues(from: arrayOfNumbers))


