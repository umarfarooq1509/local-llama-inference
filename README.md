# Local Llama-3.1-8B-Instruct GGUF Project

This project sets up a local environment to run the Llama-3.1-8B-Instruct model in GGUF format using llama.cpp on Windows with NVIDIA GPU acceleration.

## Prerequisites

- Windows 10/11
- Python 3.8+ (installed: 3.13.5)
- Git (installed)
- NVIDIA GPU with CUDA support (1660 Super, CUDA 13.1 detected)
- Visual Studio Build Tools (for C++ compilation)
- CMake (install from https://cmake.org/download/)
- CUDA Toolkit (if not installed, download from https://developer.nvidia.com/cuda-downloads)

## Setup Instructions

1. **Clone llama.cpp** (already done)
   ```
   git clone https://github.com/ggml-org/llama.cpp.git
   ```

2. **Build llama.cpp with CUDA**
   - Open Developer Command Prompt for VS (search in Start menu)
   - Navigate to the llama.cpp folder
   - Run:
     ```
     cmake -B build -DGGML_CUDA=ON
     cmake --build build --config Release
     ```
   - This creates executables in `build/bin/Release/`

3. **Download the Model**
   - Create `models` folder
   - Download the Q4_K_M quantized model (~4.9GB):
     ```
     curl -L https://huggingface.co/bartowski/Llama-3.1-8B-Instruct-GGUF/resolve/main/Llama-3.1-8B-Instruct-Q4_K_M.gguf -o models/Llama-3.1-8B-Instruct-Q4_K_M.gguf
     ```

4. **Run the Server**
   - Use the batch script `run_server.bat` or manually:
     ```
     build\bin\Release\llama-server.exe -m models\Llama-3.1-8B-Instruct-Q4_K_M.gguf --port 8080
     ```
   - Access the web UI at http://localhost:8080

## Git Version Control

This project uses Git for version control. Basic commands:

- Check status: `git status`
- Stage changes: `git add .`
- Commit: `git commit -m "message"`
- View history: `git log`
- Push to GitHub: `git push origin main` (after adding remote)

## Project Structure

- `llama.cpp/` - Inference tool source
- `models/` - Model files (ignored by Git)
- `README.md` - This file
- `run_server.bat` - Script to start server
- `.gitignore` - Excludes large files

## Troubleshooting

- If build fails, ensure CUDA toolkit matches driver version.
- For CMake issues, install latest version.
- Model download may take time; use a download manager if needed.