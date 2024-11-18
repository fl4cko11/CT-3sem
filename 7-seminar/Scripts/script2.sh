#!/bin/bash
# Скрипт создает структуру каталогов и файлов на основе переданного аргумента

# Проверяем, существует ли директория "dirs"
if [ -d dirs ]
then
  # Если директория "dirs" существует, удаляем её рекурсивно (вместе с её содержимым)
  rm -r dirs
fi

# Читаем первый аргумент командной строки (количество уровней вложенности каталогов)
# Этот аргумент задает количество уровней в структуре директорий
num=$1

# Инициализируем переменную x, которая будет использоваться для нумерации первых уровней каталогов
x=1

# Создаем основную директорию "dirs"
mkdir dirs

# Переходим в директорию "dirs", в которой будем создавать структуру каталогов
cd dirs

# Внешний цикл для создания первого уровня каталогов (от 1 до num)
while [ $x -le $num ]
do
  # Создаем директорию с номером $x (например, 1, 2, 3 и т.д.)
  mkdir dir$x

  # Переходим в созданный каталог
  cd dir$x

  # Инициализируем переменную y для нумерации второго уровня каталогов
  y=1

  # Внутренний цикл для создания второго уровня каталогов внутри каждого каталога на первом уровне
  while [ $y -le $num ]
  do
    # Создаем каталог с номером $x$y (например, 11, 12, 13 для x=1, 21, 22 для x=2 и т.д.)
    mkdir $x$y

    # Создаем файл с именем $x$y в каталоге $x$y и записываем в него строку "$x$y"
    echo "$x$y" > $x$y/$x$y

    # Увеличиваем значение y для следующего вложенного каталога
    y=$(( $y+1 ))
  done

  # Возвращаемся в родительский каталог (куда были созданы каталоги $x)
  cd ..

  # Увеличиваем значение x для следующего каталога на первом уровне
  x=$(( $x+1 ))
done
