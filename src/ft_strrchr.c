/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: apresas- <apresas-@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/12 17:22:11 by apresas-          #+#    #+#             */
/*   Updated: 2024/11/12 17:25:39 by apresas-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrchr(const char *s, int c)
{
	char	*s_end;

	s_end = (char *)s + ft_strlen(s);
	while (s_end >= s)
	{
		if (*s_end == (char)c)
			return (s_end);
		s_end--;
	}
	return (NULL);
}
