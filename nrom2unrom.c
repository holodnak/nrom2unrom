#include <stdio.h>
#include <stdlib.h>

//file header for unrom
static unsigned char header[16] = {
  'N','E','S',0x1A,   //ident
};

//file handles
static FILE *in = 0,*out = 0,*loader = 0;

//filenames
static char *loader_filename = "loader.bin";
static char *in_filename = 0;
static char *out_filename = 0;

void close_files()
{
  if(loader) fclose(loader);
  if(in)     fclose(in);
  if(out)    fclose(out);
}

void convert_rom()
{

}

int main(int argc,char *argv[])
{
  //check number of command line arguments
  if(argc < 3) {
    printf("usage:  %s infile outfile [loader]\n",argv[0]);
    return(-1);
  }

  //save pointers to the filename
  in_filename = argv[1];
  out_filename = argv[2];
  if(argc > 3) {
    loader_filename = argv[3];
  }

  //open all necessary files
  in = fopen(in_filename,"rb");
  out = fopen(out_filename,"wb");
  loader = fopen(loader_filename,"rb");

  //check for errors
  if(in == 0 || out == 0 || loader == 0) {
    if(in == 0)     printf("error opening input file '%s'\n",in_filename);
    if(out == 0)    printf("error opening output file '%s'\n",out_filename);
    if(loader == 0) printf("error opening loader '%s'\n",loader_filename);
    close_files();
    return(1);
  }

  convert_rom();

  //close all open files and exit
  close_files();
  return(0);
}
