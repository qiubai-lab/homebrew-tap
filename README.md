# homebrew-tap

[qiubai-lab](https://github.com/qiubai-lab) 的 Homebrew 第三方仓库（tap），目前提供以下 Cask：

- **Qterm** — 跨平台 SSH 终端（[项目主页](https://github.com/qiubai-lab/Qterm)），支持 Apple Silicon（aarch64）和 Intel（x86_64）芯片的 Mac。

## 安装

```bash
brew tap qiubai-lab/tap
brew install --cask qterm
```

也可以跳过 tap，直接一条命令安装：

```bash
brew install --cask qiubai-lab/tap/qterm
```

## 升级

```bash
brew update
brew upgrade --cask qterm
```

注意：第三方 tap 通过 git 仓库分发，必须先执行 `brew update` 拉取 tap 的最新定义，否则 `brew upgrade` 可能基于过期的本地缓存判断"已是最新版本"。

## 卸载

普通卸载（保留配置文件）：

```bash
brew uninstall --cask qterm
```

彻底卸载（连同配置、缓存等用户数据一并清理）：

```bash
brew uninstall --cask --zap qterm
```

`--zap` 会删除以下目录中的 Qterm 相关数据：

- `~/Library/Application Support/com.qiubai.qterm`
- `~/Library/Caches/com.qiubai.qterm`
- `~/Library/HTTPStorages/com.qiubai.qterm`
- `~/Library/Preferences/com.qiubai.qterm.plist`
- `~/Library/Saved Application State/com.qiubai.qterm.savedState`
- `~/Library/WebKit/com.qiubai.qterm`

如需移除 tap 本身：

```bash
brew untap qiubai-lab/tap
```

## 维护者：发布新版本

在 [Qterm](https://github.com/qiubai-lab/Qterm) 发布新 release 后，运行脚本自动更新 cask 的版本号和 sha256（脚本会下载两个架构的 dmg 计算校验和）：

```bash
scripts/update-qterm.sh            # 仅更新 Casks/qterm.rb
scripts/update-qterm.sh --commit   # 更新并创建 git commit
```

确认无误后 `git push`，用户执行 `brew update && brew upgrade --cask qterm` 即可升级。

## 常见问题

**Q: 已发布新版本，但 `brew upgrade` 提示 "the latest version is already installed"？**

A: 通常是本地 tap 缓存未更新，先运行 `brew update` 再重试。如果更新 tap 后仍提示已是最新，说明 tap 中定义的版本与你安装的版本一致 —— 检查一下 Qterm 是否真的发布了新 release。
