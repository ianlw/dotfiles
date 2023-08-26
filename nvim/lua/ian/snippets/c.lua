local date = function() return {os.date('%d-%m-%Y • %H:%M')} end
local current_file = function() return vim.fn.expand('%:r') end

-- Encabezado con información relevante  
return {
    s({trig = "head", dscr = "Encabezado con información relevante"}, {
        t("//Nombre:         : "), f(current_file, {}), t(".asm"),
		t({ "", "" }),
        t("//Propósito:      : "), i(1,"Objetivo del programa"),
		t({ "", "" }),
        t("//Autor:          : Ian Quispe"),
		t({ "", "" }),
        t("//Creación:       : "),f(date, {}),
		t({ "", "" }),
        t("//Modificación:   : "),f(date, {}),
		t({ "", "" }),
        t("//Compílación:    : gcc -o "), f(current_file, {}), t(" "), f(current_file, {}), t(".c"),
		t({ "", "" }),
        t("//Ejecución:      : ./"), f(current_file,{}),
		t({ "", "" }),
		t({ "", "" }),
        t("#include<stdio.h>"),
		t({ "", "" }),
		t({ "", "" }),
    }),
}
