# ==============================================================================
# Dr. Quine - Python Makefile
# ==============================================================================
# Project: Quine implementations (Colleen, Grace, Sully)
# Description: Test harness for Python quines
# ==============================================================================

COLLEEN_SRC	= Colleen.py
GRACE_SRC	= Grace.py
SULLY_SRC	= Sully.py

COLOR_RESET	= \033[0m
COLOR_RED	= \033[0;31m
COLOR_GREEN	= \033[0;32m
COLOR_YELLOW	= \033[0;33m
COLOR_CYAN	= \033[0;36m

.PHONY: all test test_colleen test_grace test_sully clean fclean

all:
	@echo "$(COLOR_GREEN)[✓] Nothing to build for Python.$(COLOR_RESET)"

# ==============================================================================
# COLLEEN - Outputs its own source code to stdout
# ==============================================================================

test_colleen:
	@echo "$(COLOR_CYAN)[*] Testing Colleen (Python)...$(COLOR_RESET)"
	@python3 $(COLLEEN_SRC) > /tmp/colleen_py_tmp
	@if diff /tmp/colleen_py_tmp $(COLLEEN_SRC) > /dev/null 2>&1; then \
		echo "$(COLOR_GREEN)[OK] Colleen: Output matches source code.$(COLOR_RESET)"; \
	else \
		echo "$(COLOR_RED)[KO] Colleen: Output differs from source!$(COLOR_RESET)"; \
		diff /tmp/colleen_py_tmp $(COLLEEN_SRC) || true; \
	fi
	@rm -f /tmp/colleen_py_tmp

# ==============================================================================
# GRACE - Writes its own source code to Grace_kid.py
# ==============================================================================

test_grace:
	@echo "$(COLOR_CYAN)[*] Testing Grace (Python)...$(COLOR_RESET)"
	@rm -f Grace_kid.py
	@python3 $(GRACE_SRC) 2>&1 || true
	@if [ -f Grace_kid.py ]; then \
		if diff Grace_kid.py $(GRACE_SRC) > /dev/null 2>&1; then \
			echo "$(COLOR_GREEN)[OK] Grace: Grace_kid.py matches source.$(COLOR_RESET)"; \
		else \
			echo "$(COLOR_RED)[KO] Grace: Grace_kid.py differs!$(COLOR_RESET)"; \
			diff Grace_kid.py $(GRACE_SRC) || true; \
		fi; \
	else \
		echo "$(COLOR_RED)[KO] Grace: Grace_kid.py was not created!$(COLOR_RESET)"; \
	fi || true
	@rm -f Grace_kid.py

# ==============================================================================
# SULLY - Creates recursively decreasing numbered copies
# ==============================================================================

test_sully:
	@echo "$(COLOR_CYAN)[*] Testing Sully (Python)...$(COLOR_RESET)"
	@timeout 120 python3 $(SULLY_SRC) 2>&1 || true
	@if [ -f Sully_0.py ]; then \
		echo "$(COLOR_GREEN)[OK] Sully: Recursion completed (Sully_0.py created).$(COLOR_RESET)"; \
		if diff Sully_5.py $(SULLY_SRC) > /dev/null 2>&1; then \
			echo "$(COLOR_GREEN)[OK] Sully: Sully_5.py matches source exactly.$(COLOR_RESET)"; \
		else \
			echo "$(COLOR_RED)[KO] Sully: Sully_5.py differs from source!$(COLOR_RESET)"; \
		fi; \
		for i in 0 1 2 3 4; do \
			if [ ! -f Sully_$$i.py ]; then \
				echo "$(COLOR_RED)[KO] Sully: Sully_$$i.py not found!$(COLOR_RESET)"; \
				continue; \
			fi; \
			sed 's/^    i = [0-9][0-9]*/    i = IDX/' $(SULLY_SRC) > /tmp/sully_py_base_$$i; \
			sed 's/^    i = [0-9][0-9]*/    i = IDX/' Sully_$$i.py > /tmp/sully_py_cmp_$$i; \
			if diff /tmp/sully_py_base_$$i /tmp/sully_py_cmp_$$i > /dev/null 2>&1; then \
				echo "$(COLOR_GREEN)[OK] Sully: Sully.py vs Sully_$$i.py differ only by index.$(COLOR_RESET)"; \
			else \
				echo "$(COLOR_RED)[KO] Sully: Unexpected diffs between Sully.py and Sully_$$i.py.$(COLOR_RESET)"; \
				diff -u /tmp/sully_py_base_$$i /tmp/sully_py_cmp_$$i || true; \
			fi; \
			rm -f /tmp/sully_py_base_$$i /tmp/sully_py_cmp_$$i; \
		done; \
	else \
		echo "$(COLOR_RED)[KO] Sully: Sully_0.py not found! (Recursion incomplete)$(COLOR_RESET)"; \
	fi || true

# ==============================================================================
# AGGREGATE TESTS
# ==============================================================================

test: test_colleen test_grace test_sully
	@echo "$(COLOR_GREEN)[✓] Python tests completed.$(COLOR_RESET)"

# ==============================================================================
# CLEANUP
# ==============================================================================

clean:
	@echo "$(COLOR_YELLOW)[*] Cleaning generated Python artifacts.$(COLOR_RESET)"
	@rm -f /tmp/colleen_py_tmp
	@rm -f Grace_kid.py
	@rm -f Sully_*.py Sully_*

fclean: clean
	@true
