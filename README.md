# Ethan Tang · Personal Notebook

基于 GitHub Pages 原生 Jekyll 的个人博客。Markdown 是文章唯一来源，不需要手动生成或提交 HTML。

## 第一次上线

1. 将本项目提交并推送到 `ethanzihao/ethanzihao.github.io` 的 `main` 分支。
2. 打开仓库 **Settings → Pages**。
3. 在 **Build and deployment → Source** 选择 **Deploy from a branch**，分支选择 **main**，目录选择 **/(root)**，点击 **Save**。
4. 等待仓库 Actions 中的 Pages 构建完成，访问 <https://ethanzihao.github.io>。

这是一次性设置。之后只要 push，GitHub 就会自动用 Jekyll 构建并发布。无需安装 Node，也无需本地构建。此项目不需要自定义 Actions workflow。

## 发布一篇文章

在 `_posts/` 新建 `2026-09-20-my-first-post.md`。文件名必须采用 `YYYY-MM-DD-slug.md` 格式；slug 建议使用英文和短横线，发布后尽量不要改动（它决定链接）。

```markdown
---
title: "我的第一篇文章"
date: 2026-09-20 12:00:00 +0800
category: Reflections
tags: [生活, 思考]
description: "一两句话概括这篇文章，会显示在首页。"
---

这里直接写 Markdown 正文。不必重复写一级标题。

## 一个小标题

支持列表、引用、链接、图片、表格和带语言标记的代码块。
```

然后正常提交、推送：

```sh
git add .
git commit -m "Write a new post"
git push origin main
```

- `category` 使用 **Notes**、**Solutions** 或 **Reflections**，对应首页三个筛选。省略时默认为 Notes。
- `tags` 可以自由填写；首页搜索匹配标题、摘要和标签，不是全文搜索。
- `description` 建议填写；省略时首页使用正文第一段摘要。
- 日期使用北京时间；未来日期文章在默认构建中不会发布，到达该日期后需要再次触发构建（例如 push）。
- 不想发布的文章放在 `_drafts/`，这里的文件不会出现在正式网站。
- 图片放在 `assets/images/`，正文中写 `![图片说明](/assets/images/example.png)`。
- 同一篇文章只维护 Markdown，不要创建对应 HTML。
- 原来的 Anonymous Recursion 已迁移到 `_posts/2026-09-02-anonymous-recursion.md`；旧 `/notes/anonymous-recursion.html` 地址会跳转到新文章。

## 本地预览（可选）

仅写作、发布时无需执行这些命令。需要预览主题或草稿时，安装受支持的 Ruby 和 Bundler，然后在仓库根目录执行：

```sh
bundle install
bundle exec jekyll serve --host 127.0.0.1
```

打开 <http://127.0.0.1:4000>。预览草稿可增加 `--drafts`。修改 `_config.yml` 后需要重启服务。

验证构建与站内链接：

```sh
bundle exec jekyll build
ruby scripts/check_site.rb
```

## 目录

- `_posts/`：已发布文章。
- `_drafts/`：草稿与写作模板。
- `_layouts/`：公共页面、文章和普通页面模板。
- `assets/`：样式、轻量筛选脚本与图片。
- `_config.yml`：网站名称、简介、域名与默认配置。
- `about.md`：关于页面，可直接修改文字。
- `archive.html`、`feed.xml`：自动生成的时间归档和订阅源。
- `_site/`：本地生成结果，已忽略，不提交。

官方说明：[GitHub Pages 发布源](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)、[Jekyll 文章格式](https://jekyllrb.com/docs/posts/)。
