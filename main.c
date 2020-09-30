 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <inttypes.h>
#include <string.h>

extern  void   controller();
extern  size_t  ft_strlen(char *s);
extern  void    ft_strcmp(char *s1, char *s2);
int    get_len()
{
    int     i;
    i = strlen("hello motherfuckersssss\n");
    return (i);
}

void    print_len(int   i)
{
    printf("hello motherfuckersssss\n");
    printf("len is - ");
    printf("%u\n", i);
}


int main()
{
    // char *str;
	
    // controller();
    // str = "hello bitches...\n";
	printf("--- FT_STRLEN ---\n");
	// printf("ft : [%zu]  real : [%zu]\n", ft_strlen(""), strlen(""));
	// printf("ft : [%zu]  real : [%zu]\n", ft_strlen(str), strlen(str));
	printf("ft : [%zu]  real : [%zu]\n", ft_strlen(" "), strlen(" "));

    printf("------Ft_strcmp-------\n\n");
    ft_strcmp("hello", "world");
}