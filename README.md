# GeneratorImage
Тестовое задание

Написать приложение для iPhone генерирующее картинки по запросу. 

Приложение состоит из двух табов.

Первый таб - главная страница. На ней содержится поле ввода в которое пользователь будет вводить запрос и кнопка подтверждения. 
По нажатию кнопки происходит генерация картинки после чего она выводится на эту же форму. Так же на этой форме есть кнопка чтобы
добавить полученную картинку в избранное. 

Второй таб - избранное. Форма состоит из таблицы в каждой строчке которой находится 1 картинка добавленная пользователем в избранное и 
запрос по которому картинка была сгенерирована. Тут же картинку можно удалить из избранного. 
Ограничить кол-во картинок которое можно хранить в избранном. По достижении лимита удаляется самая старая картинка из избранного, 
после чего добавляется новая не выводя ошибок пользователю. Избранное должно сохраняться между сессиями.

Для генерации картинок можно использовать сервис https://dummyimage.com/
Пример запроса:https://dummyimage.com/500x500&text=some+text где "500x500" размер картинки (выбрать какой-то размер и зафиксировать), а "text=" запрос от пользователя.

![](https://github.com/SancheKharzeev/GeneratorImage/blob/main/ezgif.com-video-to-gif.gif)
