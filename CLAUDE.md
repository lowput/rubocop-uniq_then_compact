# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

**rubocop-uniq_then_compact** は、RuboCop プラグインとして開発されている Ruby gem です。現在は開発初期段階で、プレースホルダーコンテンツが含まれています。

## 開発コマンド

### セットアップ

```bash
bin/setup                    # 依存関係のインストール
bundle install              # 代替のセットアップ方法
```

### テスト実行

```bash
rake spec                    # 全テストの実行
bundle exec rspec           # RSpecによるテスト実行
```

### リンティング

```bash
rake rubocop                # RuboCopによるリンティング
rubocop                     # 直接RuboCopを実行
```

### 統合タスク

```bash
rake default               # テストとリンティングの両方を実行 (spec + rubocop)
```

### 開発ツール

```bash
bin/console                 # インタラクティブコンソール
bundle exec rake new_cop[Department/Name]  # 新しいcopのテンプレート生成
```

### ビルドとリリース

```bash
bundle exec rake install   # ローカルにgemをインストール
bundle exec rake release   # 新バージョンのリリース
```

## アーキテクチャ

### プラグインシステム

- **LintRoller**を使用した現代的な RuboCop プラグイン統合
- `LintRoller::Plugin`インターフェースの実装
- `config/default.yml`による設定管理

### 主要ファイル構造

```
lib/
├── rubocop-uniq_then_compact.rb      # メインエントリーポイント
└── rubocop/
    ├── cop/
    │   └── uniq_then_compact_cops.rb  # 実際のcopの実装
    └── uniq_then_compact/
        ├── plugin.rb                  # LintRollerプラグイン統合
        └── version.rb                 # バージョン定数
```

### テスト

- **RSpec**を使用、RuboCop のテストサポート機能を利用
- Cop のテストは`rubocop/rspec/support`の DSL を使用
- テストファイルは`spec/rubocop/cop/`ディレクトリに配置

### 現在の実装状況

プロジェクトは現在、プレースホルダーの`RuboCop::Cop::Classi::NewMyCop`が実装されており、`current_user`メソッドの使用を検出します。実際の`uniq.compact`パターン検出機能はまだ実装されていません。

### 依存関係

- Ruby >= 2.7.0
- RuboCop >= 1.72.2
- LintRoller ~> 1.1
