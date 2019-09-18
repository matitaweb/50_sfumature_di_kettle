
Per creare un proprio file bat esempio myspoon.bat
settano la PENTAHO_JAVA_HOME 
e nel caso la KETTLE_HOME

rem *************************
setlocal
set PENTAHO_JAVA_HOME=<java_home 1.8+>
Set KETTLE_HOME=<path kettle my home>
spoon.bat %*