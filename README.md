# Local Llama-3.1-8B-Instruct GGUF Project

This project sets up a local environment to run the Llama-3.1-8B-Instruct model in GGUF format using llama.cpp on Windows with NVIDIA GPU acceleration.

## Prerequisites

- Windows 10/11
- Python 3.8+ (installed: 3.13.5)
- Git (installed)
- NVIDIA GPU with CUDA support (1660 Super, CUDA 13.1 detected)
- Visual Studio Build Tools (download from https://visualstudio.microsoft.com/downloads/, select "Build Tools for Visual Studio")
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
   - Download the Q4_K_M quantized model (~4.9GB) from Hugging Face:
     - Go to https://huggingface.co/bartowski/Llama-3.1-8B-Instruct-GGUF
     - Download `Llama-3.1-8B-Instruct-Q4_K_M.gguf`
     - Place it in the `models` folder
   - Alternatively, use Python (after installing huggingface_hub):
     ```
     pip install huggingface_hub
     huggingface-cli login  # If needed for large files
     python -c "from huggingface_hub import hf_hub_download; hf_hub_download(repo_id='bartowski/Llama-3.1-8B-Instruct-GGUF', filename='Llama-3.1-8B-Instruct-Q4_K_M.gguf', local_dir='models', local_dir_use_symlinks=False)"
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

## GitHub Setup

To upload this project to GitHub:

1. Create a new repository on GitHub.com (name: `local-llama-inference`)
2. Copy the repository URL
3. Run in terminal:
   ```
   git remote add origin <your-repo-url>
   git push -u origin main
   ```
4. Authenticate with your GitHub credentials when prompted.