 @echo off
       echo Hey, Anderson. Me chamo Jarvis e fui projetado por Vinicius T. Ferreira para facilitar o seu dia!
       echo Vamos ao trabalho...
       echo Para iniciar a leitura dos arquivos precisarei de uma ajudinha sua :-)
    
       timeout /t -1
        for /f "tokens=1 delims=:" %%L in ('findstr /n "<tagTest>" test.xml') do ( 
         set begin_line=%%L
        )

        for /f "tokens=1 delims=:" %%L in ('findstr /n "</tagTest>" test.xml') do ( 
         set /a end_line=%%L
        )

        echo A tag procurada existe entre as linhas %end_line% e %begin_line% do arquivo test.xml 
        break>"%temp%\logJarvis.txt"
        for /f "delims=" %%l in ('fc "%temp%\logJarvis.txt" "test.xml" /lb  %end_line% /t ^|more +4 ^| findstr /B /E /V "Hey" ^| more +%begin_line%') do (
         set "location=%%l"
         goto :break_for
        )
        :break_for
          echo.
          echo Para acessar o meu log de processamento, procure file seguinte file: %temp%\logJarvis.txt.
          echo Conte sempre comigo, mestre.
          timeout /t -1