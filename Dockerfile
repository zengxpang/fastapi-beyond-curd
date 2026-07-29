FROM python:3.12-slim

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY pyproject.toml uv.lock ./

# --frozen：强制严格按照 uv.lock 安装，不自动升级任何包，lock 文件改动则直接报错，保证环境一致性
# --no-dev：不安装开发依赖（pytest、ruff、debug 工具等只本地用的包，打包不需要），减小镜像体积
# --no-install-project：只安装第三方依赖，不把当前项目自身当做包安装（你的 fastapi 源码只是业务文件，不需要被安装成 Python 包）
RUN uv sync --frozen --no-dev --no-install-project

COPY . .

EXPOSE 8000


CMD ["uv", "run", "fastapi", "run", "src", "--port", "8000", "--host", "0.0.0.0"]
