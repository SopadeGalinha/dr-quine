# ==============================================================================
# Dr. Quine - C Makefile
# ==============================================================================
# Project: Quine implementations (Colleen, Grace, Sully)
# Description: Programs that output their own source code
# ==============================================================================

# Program Names
COLLEEN		= Colleen
GRACE		= Grace
SULLY		= Sully

ALL_TARGETS	= $(COLLEEN) $(GRACE) $(SULLY)

# Compiler and Flags
CC			= clang
CFLAGS		= -Wall -Wextra -Werror

# Source Files
COLLEEN_SRC	= Colleen.c
GRACE_SRC	= Grace.c
SULLY_SRC	= Sully.c

# Object Files
COLLEEN_OBJ	= $(COLLEEN_SRC:.c=.o)
GRACE_OBJ	= $(GRACE_SRC:.c=.o)
SULLY_OBJ	= $(SULLY_SRC:.c=.o)

# Utility Variables
RM			= rm -f

# ==============================================================================
# COLOR DEFINITIONS (ANSI Escape Codes)
# ==============================================================================

COLOR_RESET	= \033[0m
COLOR_RED	= \033[0;31m
COLOR_GREEN	= \033[0;32m
COLOR_YELLOW	= \033[0;33m
COLOR_BLUE	= \033[0;34m
COLOR_CYAN	= \033[0;36m


# ==============================================================================
# MAIN RULES
# ==============================================================================

all: $(ALL_TARGETS)
	@echo "$(COLOR_GREEN)[✓] All programs compiled successfully.$(COLOR_RESET)"

re: fclean all

# ==============================================================================
# COLLEEN - Outputs its own source code to stdout
# ==============================================================================

colleen: $(COLLEEN)

$(COLLEEN): $(COLLEEN_OBJ)
	@$(CC) $(CFLAGS) $(COLLEEN_OBJ) -o $(COLLEEN)
	@echo "$(COLOR_GREEN)[✓] $(COLLEEN) compiled.$(COLOR_RESET)"

test_colleen: $(COLLEEN)
	@echo "$(COLOR_CYAN)[*] Testing $(COLLEEN)...$(COLOR_RESET)"
	@./$(COLLEEN) > /tmp/$(COLLEEN)_tmp
	@if diff /tmp/$(COLLEEN)_tmp $(COLLEEN_SRC) > /dev/null 2>&1; then \
		echo "$(COLOR_GREEN)[OK] $(COLLEEN): Output matches source code.$(COLOR_RESET)"; \
	else \
		echo "$(COLOR_RED)[KO] $(COLLEEN): Output differs from source!$(COLOR_RESET)"; \
		diff /tmp/$(COLLEEN)_tmp $(COLLEEN_SRC); \
	fi
	@$(RM) /tmp/$(COLLEEN)_tmp

# ==============================================================================
# GRACE - Writes its own source code to Grace_kid.c
# ==============================================================================

grace: $(GRACE)

$(GRACE): $(GRACE_OBJ)
	@$(CC) $(CFLAGS) $(GRACE_OBJ) -o $(GRACE)
	@echo "$(COLOR_GREEN)[✓] $(GRACE) compiled.$(COLOR_RESET)"

test_grace: $(GRACE)
	@echo "$(COLOR_CYAN)[*] Testing $(GRACE)...$(COLOR_RESET)"
	@$(RM) Grace_kid.c
	@./$(GRACE)
	@if [ -f Grace_kid.c ]; then \
		if diff Grace_kid.c $(GRACE_SRC) > /dev/null 2>&1; then \
			echo "$(COLOR_GREEN)[OK] $(GRACE): Grace_kid.c matches source.$(COLOR_RESET)"; \
		else \
			echo "$(COLOR_RED)[KO] $(GRACE): Grace_kid.c differs!$(COLOR_RESET)"; \
			diff Grace_kid.c $(GRACE_SRC); \
		fi; \
	else \
		echo "$(COLOR_RED)[KO] $(GRACE): Grace_kid.c was not created!$(COLOR_RESET)"; \
	fi
	@$(RM) Grace_kid.c

# ==============================================================================
# SULLY - Creates recursively decreasing numbered copies
# ==============================================================================

sully: $(SULLY)

$(SULLY): $(SULLY_OBJ)
	@$(CC) $(CFLAGS) $(SULLY_OBJ) -o $(SULLY)
	@echo "$(COLOR_GREEN)[✓] $(SULLY) compiled.$(COLOR_RESET)"

test_sully: $(SULLY)
	@echo "$(COLOR_CYAN)[*] Testing $(SULLY)...$(COLOR_RESET)"
	@./$(SULLY)
	@if [ -f Sully_0.c ]; then \
		echo "$(COLOR_GREEN)[OK] $(SULLY): Recursion completed (Sully_0.c created).$(COLOR_RESET)"; \
		if diff Sully_0.c $(SULLY_SRC) | grep "^<.*int i = 0" > /dev/null && \
		   diff Sully_0.c $(SULLY_SRC) | grep "^>.*int i = 5" > /dev/null; then \
			echo "$(COLOR_GREEN)[OK] $(SULLY): Decrement logic verified.$(COLOR_RESET)"; \
		fi; \
	else \
		echo "$(COLOR_RED)[KO] $(SULLY): Sully_0.c not found!$(COLOR_RESET)"; \
	fi
	@echo "$(COLOR_YELLOW)    Cleaning up generated files...$(COLOR_RESET)"
	@$(RM) Sully_*.c Sully_* 2>/dev/null || true

# ==============================================================================
# TESTING
# ==============================================================================

test: test_colleen test_grace test_sully
	@echo "$(COLOR_GREEN)[✓] All tests completed.$(COLOR_RESET)"

# ==============================================================================
# COMPILATION RULES
# ==============================================================================

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

# ==============================================================================
# CLEANUP RULES
# ==============================================================================

clean:
	@$(RM) $(COLLEEN_OBJ) $(GRACE_OBJ) $(SULLY_OBJ)
	@echo "$(COLOR_YELLOW)[*] Object files removed.$(COLOR_RESET)"

fclean: clean
	@$(RM) $(ALL_TARGETS)
	@$(RM) /tmp/$(COLLEEN)_tmp
	@$(RM) Grace_kid.c
	@$(RM) Sully_*.c Sully_* 2>/dev/null || true
	@echo "$(COLOR_YELLOW)[*] All generated files removed.$(COLOR_RESET)"

# ==============================================================================
# HELP
# ==============================================================================

help:
	@echo "$(COLOR_BLUE)"
	@echo "╔═════════════════════════════════════════════════════════════════╗"
	@echo "║                  Dr. Quine - C Implementation                   ║"
	@echo "║            Build targets for Colleen, Grace, and Sully          ║"
	@echo "╚═════════════════════════════════════════════════════════════════╝"
	@echo "$(COLOR_RESET)"
	@echo "$(COLOR_CYAN)Usage:$(COLOR_RESET)"
	@echo "  make              - Compile all programs"
	@echo "  make colleen      - Compile Colleen"
	@echo "  make grace        - Compile Grace"
	@echo "  make sully        - Compile Sully"
	@echo ""
	@echo "$(COLOR_CYAN)Testing:$(COLOR_RESET)"
	@echo "  make test         - Run all tests"
	@echo "  make test_colleen - Test Colleen (diff output with source)"
	@echo "  make test_grace   - Test Grace (check Grace_kid.c)"
	@echo "  make test_sully   - Test Sully (check recursion to Sully_0.c)"
	@echo ""
	@echo "$(COLOR_CYAN)Cleanup:$(COLOR_RESET)"
	@echo "  make clean        - Remove object files"
	@echo "  make fclean       - Remove all compiled files and artifacts"
	@echo "  make re           - Recompile everything"
	@echo ""
	@echo "$(COLOR_CYAN)Other:$(COLOR_RESET)"
	@echo "  make help         - Display this help message"
	@echo ""

.PHONY: all colleen grace sully clean fclean re test test_colleen test_grace \
	test_sully help