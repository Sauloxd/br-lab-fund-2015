rm  *.mvn;
rm  *.lst;
rm  *.run;

java -cp MLR.jar montador.MvnAsm T5G08A03E01_const.asm;
java -cp MLR.jar montador.MvnAsm T5G08A03E01_main.asm;
java -cp MLR.jar montador.MvnAsm T5G08A03E01_rotinas.asm;


java -cp MLR.jar linker.MvnLinker T5G08A03E01_main.mvn T5G08A03E01_rotinas.mvn T5G08A03E01_const.mvn -s part1.mvn;

java -cp MLR.jar relocator.MvnRelocator part1.mvn final.mvn 0000 000;

java -Dfile.encoding=cp850 -jar mvn.jar