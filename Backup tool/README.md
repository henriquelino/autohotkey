# Backup tool

**[Download link](https://github.com/henriquelino/autohotkey/raw/master/Backup%20tool/backup%20tools.exe)**

<p align="center">
  <img src="https://raw.githubusercontent.com/henriquelino/autohotkey/master/Backup%20tool/backuptool%20interface.PNG" alt="Backup tool image"/>
</p>

### br
Cria backup incremental do arquivo ou pasta selecionada, criando X arquivos a cada Y minutos, após o X+1 ser criado, o mais antigo será deletado e um novo será criado no lugar, mantendo sempre um número X de backups.  

* Cria utilizando o padrão ANO_MES_DIA_HORA_MINUTO_SEGUNDO

### en
Creates an incremental backup of file or folder, creating X files each Y minutes, after X+1 file is created, oldest one is deleted and a new one is created, retaining X numbers of backups.  

* Creates new files using the pattern YEAR_MONTH_DAY_HOUR_MINUTE_SECOND

___

## To Do:

### br
- [ ] Continuar backup de onde parou.  
 Até o momento após fechar e reabrir, será reacriado os arquivos mantendo os antigos, enquanto o esperado é continuar na sequencia deletando os antigos e criando novos.

- [ ] Juntar botões start e stop.  
 Ao juntar os botões alguns erros serão evitados, por exemplo, atualmente ao selecionar start várias vezes a contagem de backups é reiniciada.

### en
- [ ] Keep going from where it left.  
 Now it starts creating files again when program is re-open, the idea is to keep going from where it stops, so the files it  creates don't go up each time program is restarted.

- [ ] Merge start and stop buttons.  
 Merging will suppress some issues, eg, after starting, and pressing start again, time and backup numbers are messed causing time erros or backup number errors.