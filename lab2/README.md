# Лабораторная работа №2

## Задание 1

1. set
2. Переменная среды - устанавливаются и могут использоваться программами, запущенными в терминале
   Переменная оболочки - устанавливается, но не может использоваться программами
   Все они стираются при закрытии терминала

MY_LOCAL_VAR="local_var_value"
echo $MY_LOCAL_VAR

В новом окне ничего не вывелось, так как переменная живет только в окне, в котором была создана

3. echo 'export MY_SHELL_VAR="shell_var_value"' >> ~/.bashrc
4. echo 'MY_GLOBAL_VAR="global_var_value"' | sudo tee -a /etc/environment
   grep MY_GLOBAL_VAR /etc/environment

Если их много
sudo sed -i '/^MY_GLOBAL_VAR=/d' /etc/environment

## Задание 2
