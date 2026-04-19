# Changelog

本文件记录**面向使用者的可见变更**；与 `swuthesis.cls` 中 `\ProvidesClass`、手册 `swuthesis-doc.pdf` 扉页版本及（可选）`.dtx` 内 `\PrintChanges` 条目对照使用。

格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，版本号遵循语义化习惯（主项目仍以模板维护者声明为准）。

## [0.2] - 2026-04-19

### Added

- 根目录本文件（`CHANGELOG.md`），便于在 GitHub 上直接查看历史。
- `examples/swusetup-bachelor.tex` 及 `swusetup-master.tex`、`swusetup-doctor.tex`、`swusetup-postdoc.tex`：各文档类选项下 `\swusetup{...}` 最小示例片段，便于在编辑器中整段复制。
- `swuthesis-doc-patch.sty`（手册 driver 专用）：`\DescribeOpt`、`\DescribeEnvs`、旁注与 `marginnote`、`theglossary` 单栏等。须单独加载，勿内联进 `.dtx` 的 `driver`：`\DocInput` 二次读入时 `\iffalse` 跳过分支仍会扫描源码，内联补丁中的 `#`、`\@…` 等与 preamble 词法不一致易触发隐蔽错误。
- `\ProvidesFile{swuthesis.dtx}[...]`：与 `\ProvidesClass` 同步的版本信息，供 `\GetFileInfo` 与手册扉页 `\date{\filedate\quad\fileversion}`。

### Changed

- 用户手册：摘要与「手册阅读指南」分工；§ 简介增加「获取源码与版本」及 GitHub 说明；安装与生成中补充 `make`、ripgrep（`rg`）等工具提示。
- 手册版面：旁注宽度与 `marginnote` 等，减轻 `\DescribeMacro` / `\DescribeOpt` / `\DescribeEnv` 与正文对齐问题。

### Notes

- 发布新版本时，请同步更新 `swuthesis.dtx` 中 **`\ProvidesFile{swuthesis.dtx}[...]`** 与 **`<*class>*` 内 `\ProvidesClass{swuthesis}[...]`** 的日期与版本号，并更新本文件与（若使用）`\changes` 记录。

## [0.1] - 2026-04-17

### Added

- 初版对外声明（`v0.1`）：西南大学博士后 / 博士 / 硕士 / 本科毕业论文（设计）LaTeX 文档类骨架，`dtx` + `ins` 抽取 `swuthesis.cls` 与示例主文档。
