/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: apresas- <apresas-@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/15 11:59:40 by apresas-          #+#    #+#             */
/*   Updated: 2024/11/15 19:50:41 by apresas-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	count_words(char const *s, char c)
{
	size_t	count;

	count = 0;
	while (*s)
	{
		while (*s == c)
			s++;
		if (*s)
			count++;
		while (*s && *s != c)
			s++;
	}
	return (count);
}

static size_t	wordlen(char const *s, char c)
{
	size_t	len;

	len = 0;
	while (s[len] && s[len] != c)
		len++;
	return (len);
}

static void	*free_array(char **array, size_t i)
{
	while (i-- > 0)
		free(array[i]);
	free(array);
	return (NULL);
}

/*
Allocates (with malloc(3)) and returns an array
of strings obtained by splitting ’s’ using the
character ’c’ as a delimiter. The array must end
with a NULL pointer.
*/
char	**ft_split(char const *s, char c)
{
	char			**array;
	size_t			i;

	if (!s)
		return (NULL);
	array = (char **)ft_calloc(count_words(s, c) + 1, sizeof(char *));
	if (!array)
		return (NULL);
	i = 0;
	while (*s && *s == c)
		s++;
	while (*s)
	{
		array[i] = ft_substr(s, 0, wordlen(s, c));
		if (!array[i])
			return (free_array(array, i));
		while (*s && *s != c)
			s++;
		while (*s && *s == c)
			s++;
		i++;
	}
	return (array);
}
