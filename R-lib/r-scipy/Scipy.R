# ==========================================
# R + SCIPY + NUMPY INTEGRATION
# ==========================================

# Install reticulate if missing
if (!require("reticulate")) {
    install.packages("reticulate")
    library(reticulate)
}

# ==========================================
# CREATE / USE PYTHON ENVIRONMENT
# ==========================================

# Optional:
# use_python("/usr/bin/python3")

# Install required Python packages
py_install(c(
    "numpy",
    "scipy"
), pip = TRUE)

# ==========================================
# IMPORT PYTHON MODULES
# ==========================================

np <- import("numpy")
scipy <- import("scipy")

# ==========================================
# NUMPY EXAMPLE
# ==========================================

cat("\n=== NUMPY ARRAY ===\n")

arr <- np$array(c(1, 2, 3, 4, 5))

print(arr)

# ==========================================
# SCIPY LINEAR ALGEBRA EXAMPLE
# ==========================================

cat("\n=== SCIPY MATRIX INVERSE ===\n")

matrix_data <- np$array(
    matrix(
        c(1, 2,
          3, 4),
        nrow = 2,
        byrow = TRUE
    )
)

inverse_matrix <- scipy$linalg$inv(matrix_data)

print(inverse_matrix)

# ==========================================
# SCIPY OPTIMIZATION EXAMPLE
# ==========================================

cat("\n=== SCIPY OPTIMIZATION ===\n")

objective_function <- function(x) {
    return((x - 5)^2 + 10)
}

optimize <- scipy$optimize$minimize(
    objective_function,
    x0 = 0
)

print(optimize)

# ==========================================
# FFT EXAMPLE
# ==========================================

cat("\n=== SCIPY FFT ===\n")

signal <- np$array(c(1, 2, 1, -1, 1.5))

fft_result <- scipy$fft$fft(signal)

print(fft_result)

# ==========================================
# STATS EXAMPLE
# ==========================================

cat("\n=== SCIPY STATS ===\n")

data <- np$array(c(
    12, 15, 14, 10, 9,
    13, 15, 17, 19, 21
))

mean_val <- np$mean(data)
std_val <- np$std(data)

cat("Mean:", mean_val, "\n")
cat("Std Dev:", std_val, "\n")

# ==========================================
# SUCCESS MESSAGE
# ==========================================

cat("\nR + SciPy integration complete.\n")
