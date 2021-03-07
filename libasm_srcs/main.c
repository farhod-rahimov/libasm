/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btammara <btammara@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/04 14:21:06 by btammara          #+#    #+#             */
/*   Updated: 2021/03/07 10:22:57 by btammara         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/errno.h>

char *ft_clear_buf(char *buf, size_t n);

size_t ft_strlen(const char *s);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strcpy(char *dst, const char *src);
ssize_t ft_write(int fd, const void *buf, size_t nbyte);
ssize_t ft_read(int fd, void *buf, size_t nbyte);
char *ft_strdup(const char *s1);

int main()
{
	/*-----------------------FT_STRLEN-----------------------*/
	printf ("std strlen = %lu\n", strlen("789789"));
	printf ("own strlen = %lu\n", ft_strlen("789789"));
	printf("-----------------------------------------\n");
	
	/*-----------------------FT_STRCPY-----------------------*/
	char dst[10];
	char *ret;
	const char *src = "12456789";
			
	dst[0] = '\0';
	printf ("std strcpy %s\n", ret = strcpy(dst, src));
	ft_clear_buf(dst, 10);
	printf ("own strcpy %s\n", ret = ft_strcpy(dst, src));
	printf("-----------------------------------------\n");
	
	/*-----------------------FT_STRCMP-----------------------*/
	printf ("std strcmp %d\n", strcmp("hello2", "hello1"));
	printf ("own strcmp %d\n", ft_strcmp("hello2", "hello1"));
	printf ("std strcmp %d\n", strcmp("789789", "789789"));
	printf ("own strcmp %d\n", ft_strcmp("789789", "789789"));
	printf ("std strcmp %d\n", strcmp("111111", "789789"));
	printf ("own strcmp %d\n", ft_strcmp("111111", "789789"));
	printf ("std strcmp %d\n", strcmp("\xff\xff", "\xff"));
	printf ("own strcmp %d\n", ft_strcmp("\xff\xff", "\xff"));
	printf ("std strcmp %d\n", strcmp("\xff", "\xff\xff"));
	printf ("own strcmp %d\n", ft_strcmp("\xff", "\xff\xff"));
	printf("-----------------------------------------\n");
	
	/*-----------------------FT_WRITE-----------------------*/
	ssize_t r;
	r = write(1, "std write 123456789\n", 20);
	printf("std ret %lu\n", r);
	r = ft_write(1, "own write 123456789\n", 20);
	printf("own ret %lu\n", r);
	printf("-----------------------------------------\n");
	
	/*-----------------------FT_READ-----------------------*/
	ssize_t r2;
	char buf[1000];

	ft_clear_buf(buf, 1000);
	printf("write less than 998 symbols for testing STD READ and PRESS CTRL + D.\n");
	r2 = read(0, buf, 998);
	buf[999] = '\0';
	printf("\n--------------\n");
	printf("STD READ: %s, return value %zd\n", buf, r2);
	
	ft_clear_buf(buf, 1000);
	printf("write the SAME symbols for testing OWN READ and PRESS CTRL + D\n");
	r2 = ft_read(0, buf, 998);
	buf[999] = '\0';
	printf("\n--------------\n");
	printf("OWN READ: %s, return value %zd\n", buf, r2);
	printf("-----------------------------------------\n");
	
	/*-----------------------FT_STRDUP-----------------------*/
	char *str;
	char *src1 = "This string is copied with STRDUP!";
	char *src2 = "This string is copied with FT_STRDUP!";
	
	printf("STD STRDUP: %s\n", str = strdup(src1));
	free(str);
	printf("OWN STRDUP: %s\n", str = ft_strdup(src2));
	free(str);
	
	return (0);	
}

char *ft_clear_buf(char *buf, size_t n)
{
	size_t i;
	
	i = 0;
	while (i < n)
		buf[i++] = '\0';
	return (buf);
}