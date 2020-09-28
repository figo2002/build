## 关于
这个项目旨在自动构建 Naiveproxy (Caddy) 至最新版，支持7种架构	

Caddy 也可使用 Caddyfile 启动，**本人思考过后决定暂不支持这种启动方式**，原因如下：	

- 在 Caddy2 的官方文档中，对于 Json 配置文件的介绍更多更彻底，很明显这是官方更为推崇的配置方式		

- 众所周知 Naiveproxy 无法作为主力使用，因为其客户端极为不完善，因此绝大部分情况下你需要配合其他软件使用，当涉及复杂配置时，Json 文件带来了更多的可能性		

**如果你很想用 Caddyfile ，很简单：**

- 从本项目的 Release 中下载对应架构的编译文件，并对其赋予可运行权限 (例如 caddy-linux-amd64
可使用 chmod +x caddy-linux-amd64 命令)	

- 假设你的 Caddyfile 位于 /etc/caddy/Caddyfile ,运行 /path/to/caddy run --config /etc/caddy/Caddyfile 即可