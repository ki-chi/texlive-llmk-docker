FROM ubuntu:22.04

# Install required packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    # Basic tools
    wget unzip ghostscript \
    # texlive
    texlive-full \
    # Fonts
    fonts-ipafont fonts-noto-cjk fonts-noto-cjk-extra \
    # for XeTeX
    fontconfig && \
    # Clean caches
    apt-get autoremove -y && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Set up fonts and llmk
RUN \
    # Run cjk-gs-integrate
    cjk-gs-integrate --cleanup --force && \
    cjk-gs-integrate --force && \
    # Copy CMap: 2004-{H,V}
    # cp -f ${TL_PATH}/texmf-dist/fonts/cmap/ptex-fontmaps/2004-* /var/lib/ghostscript/CMap/ && \
    kanji-config-updmap-sys --jis2004 haranoaji && \
    # Re-index LuaTeX font database
    luaotfload-tool -u -f && \ 
    # Create a symbolic link to llmk
    ln -s /usr/share/texlive/texmf-dist/scripts/light-latex-make/llmk.lua /usr/local/bin/llmk

VOLUME ["/root/.texlive2021/texmf-var/luatex-cache"]

WORKDIR /workdir

CMD ["llmk"]
