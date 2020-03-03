#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char ** argv){
        int size = 0;
        char res;
        char name [50];
	char id [50];
        FILE *f;
        f = fopen("Datalog.txt", "w");
        if(!f){
            fprintf(stderr, "No se pudo abrir el archivo Datalog.txt\n");
            exit(1);
        }
        if (argc!=3){
            printf("Usage:\t ./LittleBlackboard\t-s\tSIZE\n");
            return 1;
        }
        for(int i = 1; i<argc; i++){
            if(strncmp("-s", argv[i], strlen("-s"))==0){
                size = atoi(argv[i+1]);
            }
        }
        
        for (int i = 0; i<size; i++){
            
            printf("Enter Name: \n");
            scanf("%s", &name);
            printf("Enter ID: \n");
            scanf("%s", &id);
<<<<<<< HEAD
            fprintf(f,"%s\t%s\n\r", name, id);
            if(i!=size-1){
            printf("Do you wish to add more? [Y/n]\n");
            while(1){

                
=======
            fprintf(f,"%s\t%s\n", name, id);
		printf("Do you wish to add more? [y/n]\n");
            while(1){
             
>>>>>>> 500ced9ef3a1a395f1492c62b5ede211f94ad9bb
                scanf("%c", &res);
                if(res=='Y'|| res =='y')goto x;
                if(res =='n'|| res == 'N') goto end;
            }
            x: ;
            }
        }
        end:
        printf("Students information stored in Datalog.txt\n");
        fclose(f);
        return 0;
}
