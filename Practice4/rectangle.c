#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int  calcArea(int l, int w){
	
	return l * w;	

}

int calcPerim(int l,int w){
	
	return  2 * (l + w); 

}

int main(int argc, char *argv[])
{
	int i = 0;
	int l, w, flagArea, flagPerimetro, resultado;
	l  = w = flagArea = flagPerimetro = resultado = 0;

	/*
	for (i = 0; i<argc; i++)
	{
		printf("argv[%d]=%s\n",i, argv[i]);

	}
	*/
	if(argc != 6)
	{
		printf("Faltan o sobran argumentos\n");
		return 1;
	}
	else
	{	
		for(int i = 1; i < 6; i++)
		{	
			printf("%s\n", argv[i]);
			if(strncmp(argv[i], "-a", strlen("-a")) == 0)
			{	
				printf("HOLA");
				flagArea = 1;
			}
			else if(strncmp(argv[i]))
			{
				flagPerimetro = 1;
			}
			else if(argv[i] == "-w")
			{
				w = atoi(argv[i+1]);
			}
			else if(argv[i]== "-l")
			{
				l = atoi(argv[i+1]);
			}

		}

		if(flagArea)
		{
			resultado = calcArea(l,w);
			printf("area = %d units\n", resultado);
		}
		if (flagPerimetro)
		{
			resultado = calcPerim(l,w);
			printf("perimetro = %d units\n", resultado);
		}
		
	}
	
	return 0;
}
