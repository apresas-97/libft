NAME =	libft.a

SRC_DIR = src
INCLUDE_DIR = include
OBJ_DIR = obj
DEPS_DIR = deps

SRC_FILES =	ft_isalpha.c \
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

SRC = $(addprefix $(SRC_DIR)/,$(SRC_FILES))
OBJ = $(addprefix $(OBJ_DIR)/,$(SRC_FILES:%.c=%.o))
DEPS = $(addprefix $(DEPS_DIR)/,$(SRC_FILES:%.c=%.d))

BONUS_FILES =	ft_lstnew.c \
				ft_lstadd_front.c \
				ft_lstsize.c \
				ft_lstlast.c \
				ft_lstadd_back.c \
				ft_lstdelone.c \
				ft_lstclear.c \
				ft_lstiter.c \
				ft_lstmap.c

BONUS_SRC = $(addprefix $(SRC_DIR)/,$(BONUS_FILES))
BONUS_OBJ = $(addprefix $(OBJ_DIR)/,$(BONUS_FILES:%.c=%.o))
DEPS += $(addprefix $(DEPS_DIR)/,$(BONUS_FILES:%.c=%.d))

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Werror -Wextra -g
DFLAGS = -MD -MF
INCLUDE =

# Commands and utilities
RM = rm -rf
MKDIR = mkdir -p
AR = ar
AR_FLAGS = rcs
MUTE = &> /dev/null
MK = Makefile

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(AR_FLAGS) $(NAME) $(OBJ)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(MK) | $(OBJ_DIR) $(DEPS_DIR)
	$(CC) $(CFLAGS) $(DFLAGS) $(DEPS_DIR)/$*.d -c $< -o $@ -I $(INCLUDE_DIR)

$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

$(DEPS_DIR):
	$(MKDIR) $(DEPS_DIR)

clean:
	@$(RM) $(OBJ)
	@$(RM) $(BONUS_OBJ)
	@$(RM) $(OBJ_DIR)
	@$(RM) $(DEPS)
	@$(RM) $(BONUS_DEPS)
	@$(RM) $(DEPS_DIR)

fclean: clean
	@$(RM) $(NAME)

re:	fclean all

bonus: $(OBJ) $(BONUS_OBJ)
	$(AR) $(AR_FLAGS) $(NAME) $(OBJ) $(BONUS_OBJ)

.PHONY: all clean fclean re bonus
-include $(DEPS)