/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: apresas- <apresas-@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/15 11:46:46 by apresas-          #+#    #+#             */
/*   Updated: 2024/11/15 11:59:14 by apresas-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

// OG:
// char	*ft_strtrim(char const *s1, char const *set)
// {
// 	size_t	i;
// 	size_t	j;

// 	i = 0;
// 	j = ft_strlen(s1);
// 	while (ft_strrchr(set, s1[i]))
// 		i++;
// 	while (ft_strrchr(set, s1[j]))
// 		j--;
// 	return (ft_substr(s1, i, (j - i) + 1));
// }

char	*ft_strtrim(char const *s1, char const *set)
{
	char	*start;
	char	*end;

	if (!s1)
		return (NULL);
	start = (char *)s1;
	end = (char *)s1 + ft_strlen(s1) - 1;
	if (!set)
		return (start);
	while (*start && ft_strchr(set, *start))
		start++;
	while (end > start && ft_strchr(set, *end))
		end--;
	return (ft_substr(start, 0, end - start + 1));
}
