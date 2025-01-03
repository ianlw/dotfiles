-- " Compilar y crear ejetuable en c++
-- "map <F12> :!g++ % -o %.bin<CR> <F10>./bin<TAB>
-- " autocmd FileType cpp map <F12> :split<CR>:term echo "Compilado con G++";g++ % -o %.bin && echo •••••••••• && echo "\033[0;32m ¡Compilado! \033[0m " && echo •••••••••• && echo && ./%.bin<CR><CR>:resize -6<CR>i
--
    -- Live server html
-- vim.cmd([[
-- augroup html_autocmd
  -- autocmd!
  -- autocmd BufRead,BufNewFile *.css :TSDisable highlight
-- augroup END
-- ]])

vim.cmd[[autocmd FileType cpp map <leader>a :AssistantToggle <CR> R]]
vim.cmd[[autocmd FileType html map <F12> :LiveServerStart <CR>]]
    -- " con la ventana flotante
vim.cmd[[autocmd FileType cpp map <F12> :w<CR>:FloatermNew clear; echo "Compilado con G++"; g++ % -o %:r -fopenmp -lGL -lglut -lGLU -lGLEW && echo •••••••••• && clear && echo "\033[0;32m ¡Compilado! \033[0m " && echo •••••••••• && echo && ./%:r<CR><CR>]]
-- Mpi
vim.cmd[[autocmd FileType cpp map <F11> :w<CR>:FloatermNew clear; echo "Compilado con MPI"; mpicxx % -o %:r && echo •••••••••• && clear && echo "\033[0;32m ¡Compilado! \033[0m " && echo •••••••••• && echo && mpirun -np 4 %:r<CR><CR>]]
-- lexer c
vim.cmd[[autocmd FileType lex map <F12> :w<CR>:FloatermNew clear; echo "Compilado con Flex"; flex -o %:r.yy.c % && gcc %:r.yy.c -o %:r && echo •••••••••• && clear && echo "\033[0;32m ¡Compilado! \033[0m " && echo •••••••••• && echo && ./%:r<CR><CR>]]

-- "Clases de c
-- vim.cmd[[autocmd FileType cpp map <F11> :w<CR>:split<CR>:term echo "Compilado con G++";g++ % && echo •••••••••• && echo "\033[0;32m ¡Compilado! \033[0m " && echo •••••••••• && <CR><CR>:resize -6<CR>i]]
-- " Para C
-- "autocmd FileType c map <F12> :split<CR>:term echo "Compilado con GCC";gcc % -o %.bin && echo •••••••••• && echo "\033[0;32m ¡Compilado! \033[0m " && echo •••••••••• && echo && ./%.bin<CR><CR>:resize -6<CR>i
    -- " con la ventana flotante
vim.cmd[[autocmd FileType c map <F12> :w<CR>:FloatermNew clear; echo "Compilado con GCC"; gcc -lGL -lGLU -lglut % -o %:r -lm -fopenmp && echo •••••••••• && clear && echo "\033[0;32m ¡Compilado! \033[0m " && echo •••••••••• && echo && ./%:r<CR><CR>]]

-- " Para c#
vim.cmd[[autocmd FileType cs map <F10> :w<CR>:split<CR>:term echo "Compilando...";echo && dotnet run<CR><CR>:resize -6<CR>i]]
    -- " con la ventana flotante
vim.cmd[[autocmd FileType cs map <F12> :w<CR>:FloatermNew clear; dotnet run<CR>]]

-- " Formatear el código de C#
vim.cmd[[autocmd FileType cs map <F11> :OmniSharpCodeFormat <CR>]]

-- " Python
vim.cmd[[autocmd FileType python map <F12> :w<CR>:FloatermNew clear; python %<CR>]]

-- " Terminal flotante 
vim.cmd[[map <F9> :FloatermNew<CR>]]

-- " Latex Compile 
vim.cmd[[autocmd FileType tex map <F12> :VimtexCompile <CR>]]
