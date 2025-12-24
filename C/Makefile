# ==============================================================================
# VARIABLES
# ==============================================================================

# Executable Names
NAME_1      = Colleen
NAME_2      = Grace
NAME_3      = Sully

# Compiler and Flags
CC          = clang
CFLAGS      = -Wall -Wextra -Werror

# Source and Object Files
SRC_1       = Colleen.c
SRC_2       = Grace.c
SRC_3       = Sully.c

OBJ_1       = $(SRC_1:.c=.o)
OBJ_2       = $(SRC_2:.c=.o)
OBJ_3       = $(SRC_3:.c=.o)

# Shell Commands
RM          = rm -f

# ==============================================================================
# COLORS (ANSI Escape Codes)
# ==============================================================================
NC          = \033[0m
BOLD        = \033[1m
RED         = \033[0;31m
GREEN       = \033[0;32m
YELLOW      = \033[0;33m
BLUE        = \033[0;34m
CYAN        = \033[0;36m

# ==============================================================================
# MAIN RULES
# ==============================================================================

all: $(NAME_1) $(NAME_2) $(NAME_3) ## Compile all programs

# ------------------------------------------------------------------------------
# Colleen
# ------------------------------------------------------------------------------
colleen: $(NAME_1) ## Compile only Colleen

$(NAME_1): $(OBJ_1)
	@$(CC) $(CFLAGS) $(OBJ_1) -o $(NAME_1)
	@echo "$(GREEN)✔ $(NAME_1) compiled successfully.$(NC)"

test_colleen: $(NAME_1) ## Run and test Colleen (Diff check)
	@echo "$(CYAN)Testing $(NAME_1)...$(NC)"
	@./$(NAME_1) > tmp_$(NAME_1)
	@if diff tmp_$(NAME_1) $(SRC_1) > /dev/null; then \
		echo "$(GREEN)[OK] Output matches source code.$(NC)"; \
	else \
		echo "$(RED)[KO] Output differs from source code!$(NC)"; \
		echo "$(YELLOW)Diff output:$(NC)"; \
		diff tmp_$(NAME_1) $(SRC_1); \
	fi
	@$(RM) tmp_$(NAME_1)

# ------------------------------------------------------------------------------
# Grace
# ------------------------------------------------------------------------------
grace: $(NAME_2) ## Compile only Grace

$(NAME_2): $(OBJ_2)
	@$(CC) $(CFLAGS) $(OBJ_2) -o $(NAME_2)
	@echo "$(GREEN)✔ $(NAME_2) compiled successfully.$(NC)"

test_grace: $(NAME_2) ## Run and test Grace (Diff check)
	@echo "$(CYAN)Testing $(NAME_2)...$(NC)"
	@./$(NAME_2)
	@if diff Grace_kid.c $(SRC_2) > /dev/null; then \
		echo "$(GREEN)[OK] Grace_kid.c matches source code.$(NC)"; \
	else \
		echo "$(RED)[KO] Grace_kid.c differs from source code!$(NC)"; \
		echo "$(YELLOW)Diff output:$(NC)"; \
		diff Grace_kid.c $(SRC_2); \
	fi
	@$(RM) Grace_kid.c

# ------------------------------------------------------------------------------
# Sully
# ------------------------------------------------------------------------------
sully: $(NAME_3) ## Compile only Sully

$(NAME_3): $(OBJ_3)
	@$(CC) $(CFLAGS) $(OBJ_3) -o $(NAME_3)
	@echo "$(GREEN)✔ $(NAME_3) compiled successfully.$(NC)"

test_sully: $(NAME_3) ## Run and test Sully (Execution check)
	@echo "$(CYAN)Testing $(NAME_3) (This creates many files)...$(NC)"
	@./$(NAME_3)
	@if [ -f Sully_0.c ]; then \
		echo "$(GREEN)[OK] Sully executed and reached Sully_0.c.$(NC)"; \
	else \
		echo "$(RED)[KO] Sully_0.c was not found.$(NC)"; \
	fi
	@# Optional: Check difference between original and first copy if logic allows
	@echo "$(YELLOW)Cleaning up Sully mess...$(NC)"
	@$(RM) Sully_*

# ==============================================================================
# STANDARD RULES
# ==============================================================================

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

clean: ## Remove object files
	@$(RM) $(OBJ_1) $(OBJ_2) $(OBJ_3)
	@echo "$(YELLOW)Object files removed.$(NC)"

fclean: clean ## Remove executables and generated files
	@$(RM) $(NAME_1) $(NAME_2) $(NAME_3)
	@$(RM) tmp_$(NAME_1)
	@$(RM) Grace_kid.c
	@$(RM) Sully_*
	@echo "$(YELLOW)Executables and temporary files removed.$(NC)"

re: fclean all ## Recompile everything

# ==============================================================================
# HELP
# ==============================================================================

help: ## Display this help message
	@echo "${BLUE}\n\t=== Available commands ===${NC}"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
	awk 'BEGIN {FS = ":.*?## "}; \
	{printf "$(GREEN)%-20s$(NC)$(BOLD) %s$(NC)\n", $$1, $$2}'

.PHONY: all clean fclean re help colleen grace sully test_colleen test_grace test_sully