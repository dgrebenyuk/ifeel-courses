### Overview
Есть четыре вида скобок `'{' '[' '(' '<'`. Каждой из них соответствуют закрывающиеся скобки `'}' ']' ')' '>'`.

Дана строка которая состоит только из этих скобок

Расширить класс String методом valid_brackets? для проверки строки на валидность открытых и закрытых скобок а так же их очерёдностью

```
# "{(})".valid_brackets? => false
# "{{[]".valid_brackets? => false
# "{[()]}".valid_brackets? => true
# "{{()}[<>](){}}()".valid_brackets? => true
```
