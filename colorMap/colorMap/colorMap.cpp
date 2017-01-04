#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string>

using namespace std;
//BGRA
/*#define pink "FF00FFFF";
#define black "000000FF";
#define white "FFFFFFFF";
#define gold  "0EC9FFFF";
#define blue  "D93426FF";
#define red  "241CEDFF";
#define purple "FF0080FF";
#define orange "277FFFFF";
#define maroon "150088FF";
#define beige "C1CEE6FF";
#define lightblue "E8A200FF";
#define darkgreen "000800FF";
#define darkred "0E005EFF";
#define lightgreen "4CB122FF";
#define brown "344F7EFF";*/

FILE * convert(FILE * in);

int main()
{	
	FILE * raw;
	raw = fopen("poolcue180.txt", "r");
	FILE * mapped = convert(raw);
	fclose(raw);
	return 0;
}

FILE * convert(FILE * in)
{

	uint16_t counter = 0;
	uint16_t bigCount = 0;
	FILE * out;
	out = fopen("poolcue180.hex", "w");
	char * line = new char[1];
	*line = '0';

	while (feof(in) == 0)
	{
		fgets(line, 10, in);
		if (feof(in) != 0)
			break;
		string sline = line;
		uint8_t temp = 200;
		if (sline == "FF00FFFF\n") // pink
		{
			temp = 0;
		}
		else if (sline == "000000FF\n") // black
		{
			temp = 1;
		}
		else if (sline == "FFFFFFFF\n") // white
		{
			temp = 2;
		}
		else if (sline == "0EC9FFFF\n") // gold
		{
			temp = 3;
		}
		else if (sline == "D93426FF\n") // blue
		{
			temp = 4;
		}
		else if (sline == "241CEDFF\n") // red
		{
			temp = 5;
		}
		else if (sline == "FF0080FF\n") // purple
		{
			temp = 6;
		}
		else if (sline == "277FFFFF\n") // orange
		{
			temp = 7;
		}
		else if (sline == "150088FF\n") // maroon
		{
			temp = 8;
		}
		else if (sline == "C1CEE6FF\n") // beige
		{
			temp = 9;
		}
		else if (sline == "E8A200FF\n") // light blue
		{
			temp = 10;
		}
		else if (sline == "008000FF\n") // dark green
		{
			temp = 11;
		}
		else if (sline == "0E005EFF\n") // dark red
		{
			temp = 12;
		}
		else if (sline == "4CB122FF\n") // light green
		{
			temp = 13;
		}
		else if (sline == "344F7EFF\n") // brown
		{
			temp = 14;
		}
		else
			temp = 13;

		uint8_t bitmask = 255;
		uint8_t interm = counter & bitmask;
		uint8_t whatever = counter >> 8;
		interm = whatever + interm;
		uint8_t check =-( 1 + interm + temp);
	

		fprintf(out, ":01%04x00%02x%02x\n", counter, temp, check);

		if (counter == 65535)
		{
			bigCount++;
			counter = -1;
			check = -(2 + bigCount + 4);
			fprintf(out, ":02000004%04x%02x\n", bigCount, check);
		}
		counter++;
	}

	fprintf(out,":00000001ff");
	fclose(out);
	printf("%d\n", counter);
	return out;
}