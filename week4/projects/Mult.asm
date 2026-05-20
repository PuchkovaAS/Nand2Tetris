// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.


// 1. Инициализация (запускаем только один раз в начале)
@1      // A = 1 (адрес регистра R1)
D=M     // D = RAM[1] (читаем значение из R1)
@16     // A = 16 (адрес нашей переменной)
M=D     // RAM[16] = D (записываем значение в переменную)
@0
D=A
@2
M=D
@0
D=A
@17
M=D

@0         // A = 1 
D=M         // D = RAM[0]
@0         // Проверяем условие: если x, выходим
@END
D;JEQ       // Если результат 0, прыгаем на END


@1         // A = 1 
D=M         // D = RAM[1]
@0         // Проверяем условие: если x, выходим
@END
D;JEQ       // Если результат 0, прыгаем на END

// 2. Начало цикла
(LOOP)
@16         // A = 16 
D=M         // D = RAM[16] 

@0         // Проверяем условие: если x, выходим
@END
D;JEQ       // Если результат 0, прыгаем на END

// 3. Тело: 
@16
D=M         // D = x
@1
D=D-A       // D = x - 1
@16
M=D         // Записываем новое значение обратно в RAM[16]


@17     // A = 17 (адрес первой ячейки)
D=M     // D = RAM[17] (читаем значение в "буфер" D)
@0      // A = 0 (адрес второй ячейки, это же регистр R0)
D=D+M   // D = D + RAM[0] (складываем то, что в D, с тем, что по адресу 0)
@17     // A = 17 (снова указываем на ячейку результата)
M=D     // RAM[17] = D (записываем сумму обратно)


@LOOP
0;JMP       // Прыгаем в начало
(END)
//запись результиата в r2
@17
D=M
@2
M=D
@END
0;JMP       // Зацикливаемся на конце