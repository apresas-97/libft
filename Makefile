NAME =	libft.a

SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
LIB_DIR = lib

SRC =	ft_isalpha.c \
		ft_isdigit.c \
		ft_isalnum.c \
		ft_isascii.c \
		ft_isprint.c \
		ft_strlen.c \
		ft_memset.c \
		ft_bzero.c \
		ft_memcpy.c \
		ft_memmove.c \
		ft_strlcpy.c \
		ft_strlcat.c \
		ft_toupper.c \
		ft_tolower.c \
		ft_strchr.c \
		ft_strrchr.c \
		ft_strncmp.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_strnstr.c \
		ft_atoi.c \
		ft_calloc.c \
		ft_strdup.c \
		ft_putnbr_fd.c \
		ft_putchar_fd.c \
		ft_putstr_fd.c \
		ft_putendl_fd.c \
		ft_substr.c \
		ft_strjoin.c \
		ft_strtrim.c \
		ft_itoa.c \
		ft_strmapi.c \
		ft_striteri.c \
		ft_split.c

OBJECTS = $(SRC:%.c=%.o)

BONUS =	ft_lstnew.c \
		ft_lstadd_front.c \
		ft_lstsize.c \
		ft_lstlast.c \
		ft_lstadd_back.c \
		ft_lstdelone.c \
		ft_lstclear.c \
		ft_lstiter.c \
		ft_lstmap.c

B_OBJ	=	$(BONUS:%.c=%.o)

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Werror -Wextra
DFLAGS = -MD -MF
INCLUDE =

# Commands and utilities
RM = rm -rf
MKDIR = mkdir -p
AR = ar rcs
MUTE = &> /dev/null
MK = Makefile

$(NAME):
	$(CC) $(CFLAGS) -c $(SRC) -I ./
	@ar rc $(NAME) $(OBJECTS)

all: $(NAME)

clean:
	@rm -f $(OBJECTS)
	@rm -f $(B_OBJ)

fclean: clean
	@rm -f $(NAME)
	@rm -f $(BONUS_NAME)

re:	fclean all

bonus:
	$(CC) $(CFLAGS) -c $(BONUS) -I ./
	@ar r $(NAME) $(B_OBJ)

.PHONY: all clean fclean re bonus