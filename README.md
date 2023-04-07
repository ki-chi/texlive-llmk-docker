# texlive-llmk-docker

This repository contains a Dockerfile that sets up a TeXLive full environment with llmk installed. This makes it easy to compile LaTeX documents using llmk without worrying about dependencies and version conflicts.

## Usage
To use this Dockerfile, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the cloned repository's directory.
3. Build the Docker image by running the following command:
  ```
  $ docker build . -t texlive-llmk
  ```
4. This will download and install all the required dependencies and tools, including TeXLive and llmk.
   Once the image is built, you can use it to compile your LaTeX documents. To do this, run the following command from your TeX working directory:
   ```
   $ docker run --rm -it -v $(pwd):/workdir -w /workdir texlive-llmk llmk
   ```
   This command will mount your working directory to the container and execute llmk to compile your LaTeX document.
