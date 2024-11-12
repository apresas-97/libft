/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnstr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: apresas- <apresas-@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/12 17:36:37 by apresas-          #+#    #+#             */
/*   Updated: 2024/11/12 17:45:57 by apresas-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strnstr(const char *haystack, const char *needle, size_t len)
{
	char	*haystack_str;
	char	*needle_str;

	haystack_str = (char *)haystack;
	needle_str = (char *)needle;
	if (!(*needle))
		return (haystack_str);
	while (*haystack_str && len--)
	{
		if (*haystack_str == *needle
			&& !ft_strncmp(haystack_str, needle_str, ft_strlen(needle_str)))
		{
			return (haystack_str);
		}
	}
	return (NULL);
}
