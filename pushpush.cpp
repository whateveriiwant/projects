#include <stdio.h>
#include <windows.h>
#include <conio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream> 
	 
using namespace std;

void gotoxy(int x,int y)
{
     COORD pos={x,y};
     SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), pos);
}

void map_loading(int s, int stage[13][13])
{
	
	char mapdata[170];
    ifstream Readfile("map0308.txt");
    
	for(int i=0; i<s; i++)
	{
		Readfile.getline(mapdata,sizeof(char)*170);
	}
    Readfile.close();
    
    int n=0;
    
    for(int i=0; i<=12; i++)
    {
    	for(int j=0; j<=12; j++)
    	{
    		stage[i][j] = mapdata[n]-48;
    		n++;
   		}
	}
	gotoxy(35,1);
	printf("STAGE : %d", s);
		
}




	int main()
	{
		int stage[13][13];
		int s=1, y, x, d=0;
		map_loading(s, stage);
		
		for(int i=0; i<=12; i++)
		{
			for(int j=0; j<=12; j++)
			{
				if(stage[i][j]==3)
				{
					y=i;
					x=j;
				}
			}
		}
		
		
		
		int b=0;
		
		for(int i=0; i<=12; i++) 
		{
			for(int j=0; j<=12; j++)
			{
				switch(stage[i][j])
				{
					case 0: printf("　");
							break;
					
					case 1: printf("▨");
							break;
					
					case 3: printf("♀");
							break;
					
					case 5: printf("●");
							break;
							
					case 6: printf("♡");
							break;
							
					case 7: printf("♥");
							break;
				}
			}
			printf("\n");
		}
		
		while(1)
		{
			int p_key=getch();
			
			switch(p_key)
			{
				case 114: //R키 리셋
					map_loading(s, stage);
					for(int i=0; i<=12; i++)
					{
						for(int j=0; j<=12; j++)
						{
							if(stage[i][j]==3)
							{
									y=i;
									x=j;
							}
						}
					}
					b=0;
					d=0;
					break;
				
				case 111: //O키 이전스테이지
					if(s>1)
					{
						s--;
						map_loading(s, stage);
						for(int i=0; i<=12; i++)
						{
							for(int j=0; j<=12; j++)
							{
								if(stage[i][j]==3)
								{
									y=i;
									x=j;
								}
							}
						}
						b=0;
						d=0;
					}
					
					break;
				
				case 112: //P키 다음스테이지 
					if(s<50)
					{
						s++;
						map_loading(s, stage);
						for(int i=0; i<=12; i++)
						{
							for(int j=0; j<=12; j++)
							{
								if(stage[i][j]==3)
								{
									y=i;
									x=j;
								}
							}
						}
						b=0;
						d=0;
					}
					
					
					break;
				case 77: //오른쪽
					
					if(stage[y][x+1]==0)
						{
							stage[y][x]=b;
							stage[y][x+1]=3;
							b=0;
							x++;
							d++;
						} 
					else if(stage[y][x+1]==5 && stage[y][x+2]==0)
						{
							stage[y][x]=b;
							stage[y][x+1]=3;
							stage[y][x+2]=5;
							b=0;
							x++;
							d++;
						}
					else if(stage[y][x+1]==5 && stage[y][x+2]==6)
						{
							stage[y][x]=b;
							stage[y][x+1]=3;
							stage[y][x+2]=7;
							b=0;
							x++;
							d++;
						}
					else if(stage[y][x+1]==6)
						{
							stage[y][x]=b;
							stage[y][x+1]=3;
							b=6;
							x++;
							d++;
						}
					else if(stage[y][x+1]==7 && stage[y][x+2]==0)
						{
							stage[y][x]=b;
							stage[y][x+1]=3;
							stage[y][x+2]=5;
							b=6;
							x++;
							d++;
						}
					else if(stage[y][x+1]==7 && stage[y][x+2]==6)
						{
							stage[y][x]=b;
							stage[y][x+1]=3;
							stage[y][x+2]=7;
							b=6;
							x++;
							d++;
						}
					
					break;
				
				case 75: //왼쪽이동
					
					if(stage[y][x-1]==0) 
						{
							stage[y][x-1]=3;
							stage[y][x]=b;
							b=0;
							x--;
							d++;
						}
					else if(stage[y][x-2]==0 && stage[y][x-1]==5)
						{
							stage[y][x-2]=5;
							stage[y][x-1]=3;
							stage[y][x]=b;
							b=0;
							x--;
							d++;
						}
					else if(stage[y][x-2]==6 && stage[y][x-1]==5)
						{
							stage[y][x-2]=7;
							stage[y][x-1]=3;
							stage[y][x]=b;
							b=0;
							x--;
							d++;
						}
					else if(stage[y][x-1]==6)
						{
							stage[y][x-1]=3;
							stage[y][x]=b;
							b=6;
							x--;
							d++;
						}
					else if(stage[y][x-2]==0 && stage[y][x-1]==7)
						{
							stage[y][x-2]=5;
							stage[y][x-1]=3;
							stage[y][x]=b;
							b=6;
							x--;
							d++;
						}
					else if(stage[y][x-2]==6 && stage[y][x-1]==7)
						{
							stage[y][x-2]=7;
							stage[y][x-1]=3;
							stage[y][x]=b;
							b=6;
							x--;
							d++;
						}
					
					break;
				
				case 80: //위로이동
					if(stage[y+1][x]==0)
						{
							stage[y+1][x]=3;
							stage[y][x]=b;
							b=0;
							y++;
							d++;
						} 
					else if(stage[y+2][x]==0 && stage[y+1][x]==5)
						{
							stage[y+2][x]=5;
							stage[y+1][x]=3;
							stage[y][x]=b;
							b=0;
							y++;
							d++;
						}
					else if(stage[y+2][x]==6 && stage[y+1][x]==5)
						{
							stage[y+2][x]=7;
							stage[y+1][x]=3;
							stage[y][x]=b;
							b=0;
							y++;
							d++;
						}
					else if(stage[y+1][x]==6)
						{
							stage[y+1][x]=3;
							stage[y][x]=b;
							b=6;
							y++;
							d++;
						}
					else if(stage[y+2][x]==0 && stage[y+1][x]==7)
						{
							stage[y+2][x]=5;
							stage[y+1][x]=3;
							stage[y][x]=b;
							b=6;
							y++;
							d++;
						}
					else if(stage[y+2][x]==6 && stage[y+1][x]==7)
						{
							stage[y+2][x]=7;
							stage[y+1][x]=3;
							stage[y][x]=b;
							b=6;
							y++;
							d++;
						}
					
					break;
				
				case 72: //아래이동
					if(stage[y-1][x]==0)
						{
							stage[y-1][x]=3;
							stage[y][x]=b;
							b=0;
							y--;
							d++;
						} 
					else if(stage[y-2][x]==0 && stage[y-1][x]==5)
						{
							stage[y-2][x]=5;
							stage[y-1][x]=3;
							stage[y][x]=b;
							b=0;
							y--;
							d++;						
						}
					else if(stage[y-2][x]==6 && stage[y-1][x]==5)
						{
							stage[y-2][x]=7;
							stage[y-1][x]=3;
							stage[y][x]=b;
							b=0;	
							y--;
							d++;					
						}
					else if(stage[y-1][x]==6)
						{
							stage[y-1][x]=3;
							stage[y][x]=b;
							b=6;	
							y--;
							d++;					
						}
					else if(stage[y-2][x]==0 && stage[y-1][x]==7)
						{
							stage[y-2][x]=5;
							stage[y-1][x]=3;
							stage[y][x]=b;
							b=6;	
							y--;
							d++;					
						}
					else if(stage[y-2][x]==6 && stage[y-1][x]==7)
						{
							stage[y-2][x]=7;
							stage[y-1][x]=3;
							stage[y][x]=b;
							b=6;	
							y--;
							d++;					
						}
					
					break;	
			}
			gotoxy(0,0);
			for(int i=0; i<=12; i++) 
			{
				for(int j=0; j<=12; j++)
				{
					switch(stage[i][j])
					{
						case 0: printf("　");
								break;
						
						case 1: printf("▨");
								break;
						
						case 3: printf("♀");
								break;
						
						case 5: printf("●");
								break;
								
						case 6: printf("♡");
								break;
								
						case 7: printf("♥");
								break;
					}
				}
				printf("\n");
			}
			gotoxy(35,2);
			printf("이동수: %d   ", d);
			
			int bc=0;
			for(int i=0; i<=12; i++)
			{
				for(int j=0; j<=12; j++)
				{
					if(stage[i][j]==5)
					{
						bc++;
					}
				}
			}
			
			if(bc==0)
			{
				s++;
				map_loading(s, stage);
				for(int i=0; i<=12; i++)
				{
					for(int j=0; j<=12; j++)
					{
						if(stage[i][j]==3)
						{
							y=i;
							x=j;
						}
					}
				}
				b=0;
				d=0;
			}
			
		}
		
		return 0;
	}
	
	

