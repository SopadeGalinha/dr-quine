# ==============================================================================
# Dr. Quine - ASM Makefile
# ==============================================================================
# Project: Quine implementations (Colleen, Grace, Sully)
# Description: x86-64 Assembly programs that output their own source code
# ==============================================================================

# Program Names
COLLEEN		= Colleen
GRACE		= Grace
SULLY		= Sully

ALL_TARGETS	= $(COLLEEN) $(GRACE) $(SULLY)

# Assembler and Linker
NASM		= nasm
NASM_FLAGS	= -f elf64
LD		= gcc
LD_FLAGS	= -no-pie

# Source Files
COLLEEN_SRC	= Colleen.s
GRACE_SRC	= Grace.s
SULLY_SRC	= Sully.s

# Object Files
COLLEEN_OBJ	= $(COLLEEN_SRC:.s=.o)
GRACE_OBJ	= $(GRACE_SRC:.s=.o)
SULLY_OBJ	= $(SULLY_SRC:.s=.o)

# Utility Variables
RM		= rm -f

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
# PHONY TARGETS
# ==============================================================================

.PHONY: all colleen grace sully clean fclean re test test_colleen test_grace \
	test_sully help

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
	@$(LD) $(LD_FLAGS) $(COLLEEN_OBJ) -o $(COLLEEN)
	@echo "$(COLOR_GREEN)[✓] $(COLLEEN) linked.$(COLOR_RESET)"

test_colleen: $(COLLEEN)
	@echo "$(COLOR_CYAN)[*] Testing $(COLLEEN)...$(COLOR_RESET)"
	@./$(COLLEEN) > /tmp/$(COLLEEN)_tmp
	@diff /tmp/$(COLLEEN)_tmp $(COLLEEN_SRC) > /dev/null 2>&1; \
	if [ $$? -eq 0 ]; then \
		echo "$(COLOR_GREEN)[OK] $(COLLEEN): Output matches source code.$(COLOR_RESET)"; \
	else \
		echo "$(COLOR_RED)[KO] $(COLLEEN): Output differs from source!$(COLOR_RESET)"; \
		diff /tmp/$(COLLEEN)_tmp $(COLLEEN_SRC) || true; \
	fi
	@$(RM) /tmp/$(COLLEEN)_tmp

# ==============================================================================
# GRACE - Writes its own source code to Grace_kid.s
# ==============================================================================

grace: $(GRACE)

$(GRACE): $(GRACE_OBJ)
	@$(LD) $(LD_FLAGS) $(GRACE_OBJ) -o $(GRACE)
	@echo "$(COLOR_GREEN)[✓] $(GRACE) linked.$(COLOR_RESET)"

test_grace: $(GRACE)
	@echo "$(COLOR_CYAN)[*] Testing $(GRACE)...$(COLOR_RESET)"
	@$(RM) Grace_kid.s
	@./$(GRACE) 2>&1 || true
	@if [ -f Grace_kid.s ]; then \
		if diff Grace_kid.s $(GRACE_SRC) > /dev/null 2>&1; then \
			echo "$(COLOR_GREEN)[OK] $(GRACE): Grace_kid.s matches source.$(COLOR_RESET)"; \
		else \
			echo "$(COLOR_RED)[KO] $(GRACE): Grace_kid.s differs!$(COLOR_RESET)"; \
			diff Grace_kid.s $(GRACE_SRC) || true; \
		fi; \
	else \
		echo "$(COLOR_RED)[KO] $(GRACE): Grace_kid.s was not created!$(COLOR_RESET)"; \
	fi || true
	@$(RM) Grace_kid.s

# ==============================================================================
# SULLY - Creates recursively decreasing numbered copies
# ==============================================================================

sully: $(SULLY)

$(SULLY): $(SULLY_OBJ)
	@$(LD) $(LD_FLAGS) $(SULLY_OBJ) -o $(SULLY)
	@echo "$(COLOR_GREEN)[✓] $(SULLY) linked.$(COLOR_RESET)"

test_sully: $(SULLY)
	@echo "$(COLOR_CYAN)[*] Testing $(SULLY)...$(COLOR_RESET)"
	@timeout 120 ./$(SULLY) 2>&1 || true
	@if [ -f Sully_0.s ]; then \
		echo "$(COLOR_GREEN)[OK] $(SULLY): Recursion completed (Sully_0.s created).$(COLOR_RESET)"; \
		if diff Sully_5.s $(SULLY_SRC) > /dev/null 2>&1; then \
			echo "$(COLOR_GREEN)[OK] $(SULLY): Sully_5.s matches source exactly.$(COLOR_RESET)"; \
		else \
			echo "$(COLOR_RED)[KO] $(SULLY): Sully_5.s differs from source!$(COLOR_RESET)"; \
		fi; \
		for i in 0 1 2 3 4; do \
			if [ ! -f Sully_$$i.s ]; then \
				echo "$(COLOR_RED)[KO] $(SULLY): Sully_$$i.s not found!$(COLOR_RESET)"; \
				continue; \
			fi; \
			sed 's/mov dword\[rbp-0x8\], [0-9][0-9]*/mov dword[rbp-0x8], IDX/' Sully.s > /tmp/sully_base_$$i; \
			sed 's/mov dword\[rbp-0x8\], [0-9][0-9]*/mov dword[rbp-0x8], IDX/' Sully_$$i.s > /tmp/sully_cmp_$$i; \
			if diff /tmp/sully_base_$$i /tmp/sully_cmp_$$i > /dev/null 2>&1; then \
				echo "$(COLOR_GREEN)[OK] $(SULLY): Sully.s vs Sully_$$i.s differ only by index.$(COLOR_RESET)"; \
			else \
				echo "$(COLOR_RED)[KO] $(SULLY): Unexpected diffs between Sully.s and Sully_$$i.s.$(COLOR_RESET)"; \
				diff -u /tmp/sully_base_$$i /tmp/sully_cmp_$$i || true; \
			fi; \
			rm -f /tmp/sully_base_$$i /tmp/sully_cmp_$$i; \
		done; \
	else \
		echo "$(COLOR_RED)[KO] $(SULLY): Sully_0.s not found! (Recursion incomplete)$(COLOR_RESET)"; \
	fi || true

# ==============================================================================
# TESTING
# ==============================================================================

test: test_colleen test_grace test_sully
	@echo "$(COLOR_GREEN)[✓] All tests completed.$(COLOR_RESET)"

# ==============================================================================
# ASSEMBLY RULES
# ==============================================================================

%.o: %.s
	@$(NASM) $(NASM_FLAGS) $< -o $@

# ==============================================================================
# CLEANUP RULES
# ==============================================================================

clean:
	@$(RM) $(COLLEEN_OBJ) $(GRACE_OBJ) $(SULLY_OBJ)
	@echo "$(COLOR_YELLOW)[*] Object files removed.$(COLOR_RESET)"

fclean: clean
	@$(RM) $(ALL_TARGETS)
	@$(RM) /tmp/$(COLLEEN)_tmp
	@$(RM) Grace_kid.s
	@$(RM) Sully_*.s Sully_* 2>/dev/null || true
	@echo "$(COLOR_YELLOW)[*] All generated files removed.$(COLOR_RESET)"

# ==============================================================================
# HELP
# ==============================================================================

help:
	@echo "$(COLOR_BLUE)"
	@echo "╔═════════════════════════════════════════════════════════════════╗"
	@echo "║               Dr. Quine - ASM Implementation                    ║"
	@echo "║       Build targets for Colleen, Grace, and Sully (x86-64)      ║"
	@echo "╚═════════════════════════════════════════════════════════════════╝"
	@echo "$(COLOR_RESET)"
	@echo "$(COLOR_CYAN)Usage:$(COLOR_RESET)"
	@echo "  make              - Assemble and link all programs"
	@echo "  make colleen      - Assemble and link Colleen"
	@echo "  make grace        - Assemble and link Grace"
	@echo "  make sully        - Assemble and link Sully"
	@echo ""
	@echo "$(COLOR_CYAN)Testing:$(COLOR_RESET)"
	@echo "  make test         - Run all tests"
	@echo "  make test_colleen - Test Colleen (diff output with source)"
	@echo "  make test_grace   - Test Grace (check Grace_kid.s)"
	@echo "  make test_sully   - Test Sully (check recursion to Sully_0.s)"
	@echo ""
	@echo "$(COLOR_CYAN)Cleanup:$(COLOR_RESET)"
	@echo "  make clean        - Remove object files"
	@echo "  make fclean       - Remove all compiled files and artifacts"
	@echo "  make re           - Recompile everything"
	@echo ""
	@echo "$(COLOR_CYAN)Other:$(COLOR_RESET)"
	@echo "  make help         - Display this help message"
	@echo ""