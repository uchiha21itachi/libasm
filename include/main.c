#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

extern  size_t 	ft_strlen(char *s);
extern  int		ft_strcmp(char *s1, char *s2);
extern  char	*ft_strcpy(char *s, char *d);
extern  size_t 	ft_write(int fd, const void *buf, size_t count);
extern  size_t	ft_read(int fd,  void *buf, size_t count);
extern	char	*ft_strdup(char *s);

void	test_read_write(void)
{
	char *str;

	int i = 0;
	str = "hello guys";

    printf("--- FT_WRITE ---\n");
	

	i = write(1, NULL, 10);
	printf("OG -> i - [%d]\n", i);
	i = ft_write(1, NULL, 10);
	printf("FT -> i - [%d]\n", i);
	
	printf("\n\n");
	i = write(10, "bonjour", 10);
	printf("OG -> i - [%d]\n", i);
	i = ft_write(10, "bonjour", 10);
	printf("FT -> i - [%d]\n", i);


	printf("\n\n");
	i = write(-31, str, 10);
	printf("OG -> i - [%d]\n", i);
	i = ft_write(-31, str, 10);
	printf("FT -> i - [%d]\n", i);

    printf("\n\n--------- FT_READ --------\n");
   
    i = read(-1, "", 15);
	printf("OG -> i - [%d]\n", i);
	i = ft_read(-1, "", 15);
	printf("FT -> i - [%d]\n", i);
    
	printf("\n\n");
    i = read(0, str, 1);
	printf("OG -> i - [%d]\n", i);
	i = ft_read(0, str, 1);
	printf("FT -> i - [%d]\n", i);

	printf("\n\n");


    printf("--- END ---\n");
	
}

void	test_strlen(void)
{
	char str[15] = "hello world\n\t\n";
	char *str2;

	printf("--- FT_STRLEN ---\n");
	
	str2 = "\0";
    printf("ft : [%zu]  real : [%zu]\n", ft_strlen(""), strlen(""));
	printf("ft : [%zu]  real : [%zu]\n", ft_strlen(str), strlen(str));
	printf("ft : [%zu]  real : [%zu]\n", ft_strlen(str2), strlen(str2));
	printf("ft : [%zu]  real : [%zu]\n", ft_strlen(" "), strlen(" "));
	
}


void	test_strcpy(void)
{
	char	str1[10];
	char	str2[7] = "hell";
	char	*str3 = str2;
	
	printf("--- FT_STRCPY ---\n");
    printf("real - [%s] ft_strcpy - [%s]\n", strcpy(str1, "\0"), ft_strcpy(str1, "\0"));
    printf("real - [%s] ft_strcpy - [%s]\n", strcpy(str1, str2), ft_strcpy(str1, str2));	
	printf("real - [%s]\n", strcpy(str3, "yeah"));
	printf("ft_strcpy - [%s]\n", ft_strcpy(str3, "yeah"));
}

void	test_strcmp(void)
{
	char	str1[20] = "hello world\n";
	char	str2[8];
	char	*str3;

	str2[0] = 'H';
	str2[1] = 'F';
	str2[2] = '\0';
	str2[3] = 'Y';
	str3 = "wasssaaa\0uppp";
	
	printf("--- FT_STRCMP ---\n");

	printf("ft : [%d]  real : [%d]\n", ft_strcmp("", ""), strcmp("", ""));
	printf("ft : [%d]  real : [%d]\n", ft_strcmp("", " "), strcmp("", " "));
	printf("ft : [%d]  real : [%d]\n", ft_strcmp("  ", "  "), strcmp("  ", "  "));
	printf("ft : [%d]  real : [%d]\n", ft_strcmp("salut", "coucou"), strcmp("salut", "coucou"));
	printf("ft : [%d]  real : [%d]\n", ft_strcmp("13", str3), strcmp("13", str1));
	printf("ft : [%d]  real : [%d]\n", ft_strcmp("1113", "1116"), strcmp("1113", "1116"));
	printf("ft : [%d] \n", ft_strcmp(str1, str2));   
	printf("real : [%d] \n", strcmp(str1, str2));   
	printf("ft : [%d]  real : [%d]\n", ft_strcmp(str1, str3), strcmp(str1, str3));   
}

void	test_strdup(void)
{

    printf("\n-------FT_STRDUP-------\n");
	char *str_dup;
	char *str_dup2;

	str_dup2 = "";

	str_dup = ft_strdup("sachin");
	printf("my - [%s]\n", str_dup);
	free(str_dup);
	str_dup = strdup("sachin");
	printf("og - [%s]\n", str_dup);
	free(str_dup);
	
	str_dup = ft_strdup(str_dup2);
	printf("my - [%s]\n", str_dup);
	free(str_dup);
	str_dup = strdup(str_dup2);
	printf("og - [%s]\n", str_dup);
	free(str_dup);

}

int main()
{
   test_strlen();
   test_strcpy();
   test_strcmp();
   test_strdup();
   test_read_write();
}
