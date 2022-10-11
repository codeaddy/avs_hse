
    .intel_syntax noprefix
    .section .rodata
format_out:
    .string      "max_fact(%u) = %lu\n"

    .section .data
n:      .long   0

    .text               # Code
    .globl  main
    .type   main, @function
main:
    push    rbp
    mov     rbp, rsp

    # Реализация алгоритма
    mov     rax, 1                  # первое число
    mov     ecx, 2                  # индекс текущего используемого числа
loop_start:
    mov     r11, rax                # сохранение для вывода в случае переполнения
    mov     rbx, rcx
    mul     rbx                     # следующее число
    jo      loop_out                # выход из цикла, если переполнилось
    inc     ecx
    jmp     loop_start
loop_out:
    dec     ecx                     # коррекция i

    # Вывод результата
    lea     rdi, format_out[rip]    # формат вывода
    mov     esi, ecx                # номер выводимого числа
    mov     rdx, r11                # значение выводимого числа
    xor     eax, 0                  # вывод целых чисел
    call    printf@PLT

    mov	eax, 0
    pop	rbp
    ret
