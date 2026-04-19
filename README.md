<div align="center">

# swuthesis

**西南大学** 博士后 / 博士 / 硕士 / 本科毕业论文 **LaTeX 文档类**  
源码与手册集中在 `swuthesis.dtx`，由 `swuthesis.ins`（DocStrip）抽取 `swuthesis.cls` 与各示例主文件。

[![GitHub stars](https://img.shields.io/github/stars/vanabel/SWUThesis?style=flat-square&logo=github&label=Stars)](https://github.com/vanabel/SWUThesis/stargazers)
[![License](https://img.shields.io/badge/license-SWUThesis-5c4ee5?style=flat-square)](LICENSE)
[![XeLaTeX](https://img.shields.io/badge/engine-XeLaTeX-008080?style=flat-square&logo=latex&logoColor=white)](https://tug.org/xetex/)
[![Changelog](https://img.shields.io/badge/changelog-CHANGELOG-6e7681?style=flat-square)](CHANGELOG.md)

[**官方仓库**](https://github.com/vanabel/SWUThesis) · [**变更记录**](CHANGELOG.md) · 完整手册：运行 `make doc` 得到 `swuthesis-doc.pdf`（见下文「发布级手册与文档」）

<br/>

[![Star History Chart](https://api.star-history.com/svg?repos=vanabel/SWUThesis&type=Date)](https://star-history.com/#vanabel/SWUThesis&Date)

<sub>星标趋势由 <a href="https://star-history.com">Star History</a> 提供；点击图片可打开交互页面。</sub>

</div>

---

## 概览

**请以此官方仓库为准下载与提 issue**：<https://github.com/vanabel/SWUThesis>  

版本号见 `swuthesis.cls` 中 `\ProvidesClass{swuthesis}[...]`，或运行 `make doc` 查看 `swuthesis-doc.pdf` 扉页。请勿只依赖他人转发的压缩包，以免版本混杂、难以对照文档排错。

---

## 30 秒快速上手

在仓库根目录执行：

```sh
latex swuthesis.ins
make main
```

| 步骤 | 说明 |
|------|------|
| `latex swuthesis.ins` | 生成 `swuthesis.cls` 与示例 `swuthesis-main.tex` 等 |
| `make main` | 用 **XeLaTeX + biber** 完整编译本科示例（与 `Makefile` 的 `main` 目标一致） |

**`make` 需单独安装**（不随 TeX 发行版提供）：macOS 可装 Xcode Command Line Tools（`xcode-select --install`）；Linux 用包管理器安装 `make` 或 `build-essential`；Windows 可用 MSYS2、Git Bash 或 WSL。未安装时可对照仓库内 `Makefile` 在终端手动执行相同命令。

研究生、博士后示例：

```sh
make graduate
make postdoc
```

完整用户手册（由 `dtx` 生成）：

```sh
make doc
```

产物为 `swuthesis-doc.pdf`。

### 中文与 `fontset`（跨平台）

示例主文件**不写** `\documentclass` 的 `fontset` 时，由 **`ctex` 自动按环境选择**：Windows 为 `windows`，**其它环境（含 Linux、GitHub Actions）为 Fandol**（随 TeX Live 的 `fandol` 包）。在 **macOS** 上，`swuthesis` 类会在载入 `ctex` 前检测系统字体 `Menlo.ttc`（与 `ctex` 一致），并**显式传入 `fontset=macnew`**，使 `\songti`/`\kaishu` 与 `\bfseries` 的组合与手动写 `fontset=macnew` 一致；若仅依赖 `ctex` 的 `fontset=mac` 间接载入，部分环境下粗体联动可能异常。若写死 `fontset=macnew`，在无「华文宋体」等字体的机器上会报错。需要其它方案时可显式指定，例如 `fontset=windows`、`fontset=founder`（需本机已装方正字库）。

**Fandol 与隶书/圆体**：`ctex` 的 **fandol** 字库（Linux 常见默认）不含 `\lishu`、`\youyuan`。本模板在二者未由 `ctex` 定义时，将 **`\lishu` 回退为 `\kaishu`**、**`\youyuan` 回退为 `\heiti`**，以便封面等在 Linux 上可编译；与 Windows / macOS / founder 下的专用隶书、圆体字形会有视觉差异。

### 方正字库（`founder`）与 Windows 圆体：本地安装与 CI

**本地使用 `fontset=founder`（方正）**

1. 通过**正规授权**取得方正字库（随产品附带的 `.ttf` / `.ttc` 等）。
2. **Linux / WSL**：将字体文件放入用户目录，例如 `~/.local/share/fonts/founder/`，执行 `fc-cache -fv`；可用 `fc-list | rg -i fangzheng`（或 `FZ`）确认系统已识别。
3. **macOS**：双击安装到「字体册」，或复制到 `~/Library/Fonts/` 后视需要刷新缓存。
4. 主文件中写 `\documentclass[...,fontset=founder]{swuthesis}`（与其它类选项并列）。若 `ctex` 仍报字库不可用，请对照 TeX Live 中 `ctex-fontset-founder.def` 所期望的**字体文件名/字族名**是否与本机安装一致。

**Windows 上的「圆体」等**

- 在 **Windows** 上编译时，使用 `\documentclass[...,fontset=windows]{swuthesis}` 即可依赖系统中的中易/微软正黑等配置；圆体、隶书等随系统或 Office 安装，**路径通常在** `C:\Windows\Fonts\`。
- 这些字体受**微软等许可协议**约束，**不得**复制进本开源仓库或随发行版再分发；仅在你已合法取得使用权的机器上使用。

**CI（如 GitHub Actions）里能否安装「Windows 圆体」或方正？**

- **默认做法**：本仓库的公开工作流**不**附带任何商业或微软受限字体，Linux runner 上仍用 **Fandol** + 模板对 `\youyuan` 等的回退，避免许可风险。
- **技术上可行，但许可自负**：若你**确有权利**在自动化构建环境中使用某套字体，可在 workflow 里增加步骤：例如用 [Encrypted secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions) 存放经 base64 编码的字体压缩包（**切勿**把字体文件提交进 git），在 job 中解码并解压到 `~/.fonts` 或 `/usr/share/fonts`，再 `fc-cache -fv`，必要时设置 `fontset=founder` 或配合 `ctex` 的 Windows 字集（需自行确认 `fontspec` 能解析到的字体名）。**公开仓库**若将 Secret 用于受控字体，仍须保证使用场景符合字体授权；**无法**从微软服务器在 CI 里「合法自动下载」完整 Windows 中文字体集。
- **务实建议**：公开项目以 **Fandol + 回退** 作为 CI 结果即可；与最终 Word/校内印刷稿一致时，在**本地 Windows / 已装方正的 Linux** 上出最终 PDF。

### `\swusetup` 示例片段（复制到导言区）

在编辑器中打开后**全选复制**，粘贴到导言区；**勿单独编译**该文件：

| 文件 | 模式 |
|------|------|
| [`examples/swusetup-bachelor.tex`](examples/swusetup-bachelor.tex) | 本科 `bachelor` |
| [`examples/swusetup-master.tex`](examples/swusetup-master.tex) | 硕士 `master` |
| [`examples/swusetup-doctor.tex`](examples/swusetup-doctor.tex) | 博士 `doctor` |
| [`examples/swusetup-postdoc.tex`](examples/swusetup-postdoc.tex) | 博士后 `postdoc` |

---

## 常用构建目标

| 命令 | 说明 |
|------|------|
| `make cls` | 仅抽取类文件与示例主文档 |
| `make main` | 本科示例 |
| `make graduate` | 研究生示例（`doctor` / `master` 共用主文件） |
| `make postdoc` | 博士后报告示例 |
| `make doc` | 生成手册 `swuthesis-doc.pdf` |
| `make all` | 上述组合（耗时较长） |
| `make install` | 按 **TDS** 写入用户 TEX 树 `TEXMFHOME`：`tex/latex/swuthesis/`（类与 sty）、`source/latex/swuthesis/`（`dtx`、`ins`）、`doc/latex/swuthesis/`（`swuthesis-doc.pdf`，需已 `make doc`）、`doc/latex/swuthesis/examples/`（`examples/*.tex` 与抽取的 `*-main.tex`）；并刷新文件名数据库 |
| `make uninstall` | 移除上述路径中由本规则安装的文件 |

**系统说明**：`install` / `uninstall` 依赖 `sh`、`cp`、`mkdir`、`rm` 以及 TeX 自带的 `kpsewhich`（及 `mktexlsr` / `texhash` / MiKTeX 的 `initexmf`）。在 **Windows** 上请使用 **Git Bash、MSYS2 或 WSL**，并保证 TeX 的 `bin` 在 `PATH` 中。可选覆盖：`make install TEXMFHOME=/path/to/texmf`。目录名 **`source/`** 为 TeX 目录结构惯例（与口语中的「sources」对应）；**`doc/examples`** 即手册树下的示例子目录。

各示例主文件对应的 `swuthesis-*-main.bib` 一旦存在（含由 `filecontents*` 首次写出），`Makefile` 会将其作为 `*.pdf` 的依赖：**修改 `.bib` 后再 `make` 会重跑 XeLaTeX + biber**。若你在主文件中改用其它 `\addbibresource{…}` 文件名，请同步把该 `.bib` 写进 `Makefile` 里对应 `*.pdf` 规则的依赖列表。

持续编译可配合仓库内 `.latexmkrc` 使用 `latexmk -pvc`（引擎须为 XeLaTeX）。

---

## FAQ：最常见的 8 个坑

1. **用 pdfLaTeX 一键编译**  
   正文为中文且依赖 `ctex`，须用 **XeLaTeX**。不要用默认走 pdfLaTeX 的「一键 PDF」类流程。

2. **参考文献空白或格式不对**  
   模板使用 **biblatex**，须在 XeLaTeX 之间运行 **biber**（`Makefile` 已按正确顺序写好）。

3. **忘记先跑 `latex swuthesis.ins`**  
   没有 `swuthesis.cls` 时主文件无法编译；任何修改 `dtx` 后若需更新抽取结果，也应重新执行。

4. **摘要/关键词顺序错乱**  
   建议顺序：`cnabstract` → `cnkeywords` → `enabstract` → `enkeywords`，最后调用 `\makeabstract`。不要在 `\makeabstract` 之后再写摘要环境。

5. **关键词分隔混乱**  
   中文关键词建议用全角分号「；」；英文建议用半角「;」。

6. **日志里大量 `Overfull \hbox` 不知如何下手**  
   优先处理 **Overfull** 与 **Missing character**。可在工程目录对日志检索（需已安装 [ripgrep](https://github.com/BurntSushi/ripgrep) `rg`）：

   ```sh
   rg Overfull *.log
   rg Underfull *.log
   rg "Missing character" *.log
   ```

7. **`Missing character`（缺字）**  
   多为当前西文字体不含某字符（例如特殊罗马数字等）。应替换字符、换字体或在局部改用兼容写法。

8. **手册与示例不同步**  
   接口与正文说明以 **`swuthesis-doc.pdf`（`make doc`）** 与 **`swuthesis.dtx` 注释**为准；本 README 只保留最短路径与排错要点。

---

## 维护手册 driver（`swuthesis.dtx` 开发者须知）

本仓库的 `.dtx` 在文件首用 `% \iffalse` … `% \fi` 包住 **driver**（`%<*driver>` … `%</driver>`），以便 DocStrip 与二次 `\DocInput` 共用同一文件。内层 `\DocInput{swuthesis.dtx}` 读入时会把行首 `%` 设为「忽略」，**第一行的假条件仍会执行**，从而整块跳过上述 driver 段。

**经验规则**：在上述 **被假条件跳过的 driver 段** 里，注释中不要再写会被 TeX 读成 **字面控制序列** 的 `\iffalse`、`\if...` 等（例如说明文字里常见的 `|\iffalse|`）。否则会与第一行的 `\iffalse` **错误嵌套**，破坏 `\if…\fi` 配对，使跳过范围一直延伸到实现区之后，表现为实现代码在正文里执行，典型报错：**`\LoadClass` / `\RequirePackage` 只能在 preamble 使用**。

**`swuthesis-doc-patch.sty`**：由 `swuthesis.ins` 从 `swuthesis.dtx` 的 `docpatch` 模块抽取，**以 `.dtx` 为唯一源码**。可以不在仓库里保留该文件（仅保留 `swuthesis.dtx` + `swuthesis.ins`），编译手册前请先执行 `latex swuthesis.ins` 或 `make cls` 生成它；若希望他人克隆后无需先抽取即可编译，也可继续把生成结果纳入版本控制。`Makefile` 中 `make doc` 会先满足 `cls` 目标，保证抽取文件存在。

---

## 术语约定（与手册一致）

| 类型 | 含义 | 示例 |
|------|------|------|
| **类选项** | `\documentclass[...]{swuthesis}` 方括号内 | `master`、`doctor`、`bachelor`、`postdoc` |
| **键（key）** | `\swusetup{ key = {值}, ... }` 中的字段名 | `title`、`defense-date` |
| **命令** | 以反斜杠开头的可调用宏 | `\maketitlepage`、`\makeabstract` |
| **环境** | `\begin{名称}...\end{名称}` | `cnabstract`、`ack`（兼容 `acknowledgements`） |

---

## 发布级手册与文档

若将手册做成「发布级」结构，建议在 **`swuthesis.dtx` 的手册部分**（非本 README）中保持：

- 一页 **30 秒快速上手**（与上文命令一致，可略展开编辑器配置）；
- 一页 **FAQ（固定 8 条）**（与本 README 同步或略详）；
- 全文统一 **命令 / 键 / 环境** 三类术语的写法和交叉引用。

本 README 负责仓库入口与复制即用的最短说明；完整接口与实现细节请以 `make doc` 生成的 **`swuthesis-doc.pdf`** 为准。

---

## 仓库主要文件

| 文件 | 说明 |
|------|------|
| `LICENSE` | 使用、二次开发与机构采纳相关权利说明（SWUThesis License） |
| `swuthesis.dtx` | 类实现、示例与手册源码 |
| `swuthesis.ins` | DocStrip 控制文件（生成 `swuthesis.cls`、`swuthesis-doc-patch.sty`、各示例主文件等） |
| `swuthesis-doc-patch.sty` | 手册 **driver** 专用补丁（由 `swuthesis.ins` 抽取；勿手改） |
| `Makefile` | 抽取与编译命令封装 |

---

## 许可证与作者

版权：Van Abel。完整条款见仓库根目录 **[LICENSE](LICENSE)**（**SWUThesis License**：非商业学术使用、署名与二次开发义务、**机构采纳不转让著作权**、作者保留申请科研项目/建设经费等支持的权利等）。

**重要**：上述文件便于理解与合作安排，**不构成法律意见**；正式校内采纳或对外合作前，建议咨询本校法务或专业律师。

手册与源码中的作者、版本信息仍见 `swuthesis.dtx` 与 `swuthesis.cls` 的 `\ProvidesFile` / `\ProvidesClass`。
