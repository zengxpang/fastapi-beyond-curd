# FastAPI Beyond CRUD

## 目录

1. [环境要求](#环境要求)
2. [项目安装](#项目安装)
3. [启动应用](#启动应用)
4. [运行测试](#运行测试)
5. [技术栈](#技术栈)

## 环境要求

请确保已安装以下工具：

- Python >= 3.12
- [uv](https://docs.astral.sh/uv/)（包管理器）
- PostgreSQL
- Redis

## 项目安装

1. 克隆项目仓库：

   ```bash
   git clone https://github.com/jod35/fastapi-beyond-CRUD.git
   ```

2. 进入项目目录：

   ```bash
   cd fastapi-beyond-CRUD/
   ```

3. 使用 uv 安装依赖（自动创建虚拟环境）：

   ```bash
   uv sync
   ```

4. 配置环境变量，复制示例配置文件：

   ```bash
   cp .env.example .env
   ```

   然后根据实际环境填写 `.env` 中的配置项（数据库连接、JWT 密钥、Redis 地址、邮件服务等）。

5. 执行数据库迁移，初始化数据表：

   ```bash
   uv run alembic upgrade head
   ```

6. （可选）打开新终端，启动 Celery Worker 处理异步任务：
   ```bash
   uv run sh runworker.sh
   ```

## 启动应用

开发模式启动：

```bash
uv run fastapi dev src/
```

启动后访问 http://127.0.0.1:8000/api/v1/docs 查看 API 文档。

使用 Docker 部署：

```bash
docker compose up -d
```

## 运行测试

```bash
uv run pytest
```

## 技术栈

| 组件             | 用途                              |
| ---------------- | --------------------------------- |
| FastAPI          | Web 框架                          |
| SQLModel         | ORM（基于 SQLAlchemy + Pydantic） |
| Alembic          | 数据库迁移                        |
| PostgreSQL       | 主数据库                          |
| Redis            | 缓存 & Celery 消息代理            |
| Celery           | 异步任务队列                      |
| PyJWT            | JWT 认证                          |
| passlib + bcrypt | 密码哈希                          |
| uv               | 包管理与虚拟环境                  |
