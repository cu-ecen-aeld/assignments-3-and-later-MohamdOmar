#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    openlog(NULL,0,LOG_USER);

    if (argc != 3)
    {
        syslog(LOG_ERR, "In Correct number of args.... args-> file name and string to be written");
        return 1;
    }

    char *writefile= argv[1];
    char *writestr = argv[2];

    // Open the file for writing
    FILE *fp = fopen(writefile, "w");
    if (fp == NULL) 
    {
        syslog(LOG_ERR,"Failed to open file %s (FILE DONOT Exist)",writefile);
        return 1;
    }
    else
    {
        fwrite(writestr, strlen(writestr), 1, fp);
        //fprintf(fp, "%s", writestr);
        syslog(LOG_DEBUG,"Writing %s to %s",writestr,writefile);
    }

    fclose(fp);
    closelog();
}