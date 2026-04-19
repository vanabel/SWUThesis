# 用户 TEX 树（`TEXMFHOME`）

本目录为 **TDS 布局** 下的本地补充树，当前包含 **`lineno`** 宏包（[CTAN](https://ctan.org/pkg/lineno)）的 `.sty` 文件，与 TeX Live 发行版中的文件一致。

## 为何放在仓库里

在 GitHub Actions 上，`tlmgr install lineno` 可能因 **historic `tlnet-final` 镜像下载失败**（例如 `lineno.tar.xz` 校验/网络问题）而无法安装。将 `lineno` 纳入仓库并在 CI 中设置 `TEXMFHOME` 指向本目录，可避免手册 `swuthesis-doc.pdf` 因缺 `lineno.sty` 而失败。

## 许可证

`lineno` 以 **LaTeX Project Public License** 分发，允许再分发与修改；版权与版本见各 `.sty` 文件头部说明。

## 本地使用（可选）

若你本机 TeX 也未装上 `lineno`，可在编译前执行：

```bash
export TEXMFHOME="$(pwd)/texmf-local"
mktexlsr "$TEXMFHOME"
```

一般完整 TeX Live / MacTeX 已含 `lineno`，无需设置。
