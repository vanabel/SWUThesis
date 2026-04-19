# Changelog

本文件记录**面向使用者的可见变更**；与 `swuthesis.cls` 中 `\ProvidesClass`、手册 `swuthesis-doc.pdf` 扉页版本及（可选）`.dtx` 内 `\PrintChanges` 条目对照使用。

格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，版本号遵循语义化习惯（主项目仍以模板维护者声明为准）。

## [0.2] - 2026-04-19

### Added

- 根目录 `LICENSE`（SWUThesis License）：限制商业使用；要求二次开发与分发时署名并说明修改；明确**学校官方采纳不导致著作权转让**，作者保留申请校内/机构科研项目与支持的权利。
- 根目录本文件（`CHANGELOG.md`），便于在 GitHub 上直接查看历史。
- `examples/swusetup-bachelor.tex` 及 `swusetup-master.tex`、`swusetup-doctor.tex`、`swusetup-postdoc.tex`：各文档类选项下 `\swusetup{...}` 最小示例片段，便于在编辑器中整段复制。
- `swuthesis-doc-patch.sty`（手册 driver 专用）：`\DescribeOpt`、`\DescribeEnvs`、旁注与 `marginnote`、`theglossary` 单栏等。须单独加载，勿内联进 `.dtx` 的 `driver`：`\DocInput` 二次读入时 `\iffalse` 跳过分支仍会扫描源码，内联补丁中的 `#`、`\@…` 等与 preamble 词法不一致易触发隐蔽错误。
- `\ProvidesFile{swuthesis.dtx}[...]`：与 `\ProvidesClass` 同步的版本信息，供 `\GetFileInfo` 与手册扉页 `\date{\filedate\quad\fileversion}`。

### Changed

- **`texmf-local/tex/latex/lineno/`**：纳入 [lineno](https://ctan.org/pkg/lineno) 宏包 `.sty`（LPPL），因 CI 上 `tlmgr install lineno` 常因 **historic 镜像 `lineno.tar.xz` 下载失败** 无法安装；`build-dist.yml` 设置 **`TEXMFHOME=$GITHUB_WORKSPACE/texmf-local`** 并 **`mktexlsr`**，已从 `texlive-packages.txt` **移除**对 `lineno` 的 tlmgr 安装以免装包步骤失败。
- `.github/workflows/build-dist.yml` 与 README：说明 `setup-texlive-action` **整树缓存**、键随完整包列表变化，**不支持**官方「分阶段 / 仅增量下新包」。
- 类文件在载入 `biblatex` 之前增加 **`\RequirePackage{csquotes}`**（与 `biblatex` 推荐顺序一致；CI 包列表已含 `csquotes`）。
- **`figures/`**：纳入版本库（`.gitignore` 对 `*.pdf` 增加 `figures/**/*.pdf` 例外），含封面用 `swu-badge.pdf`、`swu-name-stxingkai.pdf`（当前为可编译占位页，可自行替换为正式校徽/校名稿）；并跟踪 `swu-logo-source.pdf`。GitHub Actions 分发 ZIP 同步打包 `figures/`。
- GitHub Actions：`.github/texlive-packages.txt` 补充 **`csquotes`**、**`lineno`**（`csquotes`/`fvextra`/手册等依赖，`lineno.sty` 属独立包）；补充 **`upquote`**；文件头增加用 `\listoffiles` / `tlmgr search --file` 查漏的说明。
- GitHub Actions：`.github/texlive-packages.txt` 将错误的 `biblatex-gb7714` 改为 **`biblatex-gb7714-2015`**（CTAN/TeX Live 中提供 `style=gb7714-2025` 的包名），修复 CI 中「Style 'gb7714-2025' not found」；并补充 **`xstring`**（`biblatex-gb7714-2015` 等依赖，最小安装下需显式列出）。
- README：增加「方正字库（founder）与 Windows 圆体：本地安装与 CI」小节，说明本地 `fontset=founder`、Windows 字体许可约束，以及 CI 中通过 Secret 注入字体的可行性与风险。
- `ctex` 的 **fandol**（Linux 默认）未提供 `\lishu`/`\youyuan` 时，由类文件回退为 `\kaishu`/`\heiti`，避免封面等使用 `\youyuan` 时未定义；与 Windows / macnew / founder 专用隶书、圆体字形可能有差异。
- macOS：在载入 `ctex` 前若检测到系统 `Menlo.ttc`（与 `ctex` 的 macOS 判定一致），则显式传入 `fontset=macnew`，使 `\songti`/`\kaishu` 与 `\bfseries` 的联动与手动指定 `fontset=macnew` 一致；Linux / Windows 不受影响。
- 用户手册：摘要与「手册阅读指南」分工；§ 简介增加「获取源码与版本」及 GitHub 说明；安装与生成中补充 `make`、ripgrep（`rg`）等工具提示。
- 手册版面：旁注宽度与 `marginnote` 等，减轻 `\DescribeMacro` / `\DescribeOpt` / `\DescribeEnv` 与正文对齐问题。

### Notes

- 发布新版本时，请同步更新 `swuthesis.dtx` 中 **`\ProvidesFile{swuthesis.dtx}[...]`** 与 **`<*class>*` 内 `\ProvidesClass{swuthesis}[...]`** 的日期与版本号，并更新本文件与（若使用）`\changes` 记录。

## [0.1] - 2026-04-17

### Added

- 初版对外声明（`v0.1`）：西南大学博士后 / 博士 / 硕士 / 本科毕业论文（设计）LaTeX 文档类骨架，`dtx` + `ins` 抽取 `swuthesis.cls` 与示例主文档。
