# copilot-instructions

GitHub Copilot のコードレビュー指示を管理するためのリポジトリです。
各プロジェクトにサブモジュールとして追加し、共通のレビュールールを適用できます。

## リポジトリ構成

```
copilot-instructions/
├── base.md          # 共通レビュールール
├── Makefile
└── README.md
```

## Makefile

| コマンド     | 説明                                                       |
| ------------ | ---------------------------------------------------------- |
| `make setup` | 親プロジェクトの `.github/copilot-instructions.md` にシンボリックリンクを作成します |
| `make clean` | シンボリックリンクを削除します                             |

## セットアップ

### 1. サブモジュールとして追加（初回のみ）

```bash
cd your-project
git submodule add git@github.com:touka-aoi/review-instructions.git .copilot-instructions
```

### 2. シンボリックリンクを作成

```bash
cd .copilot-instructions
make setup
```

これで `.github/copilot-instructions.md` が作成され、Copilot のレビューに反映されます。

### 3. 変更をコミット

```bash
cd ..
git add .copilot-instructions .github/copilot-instructions.md
git commit -m "chore: add copilot-instructions"
```

## 既存プロジェクトを clone した場合

サブモジュールは通常の clone では取得されません。以下のいずれかを実行してください。

```bash
# clone 時に一緒に取得する場合
git clone --recurse-submodules <your project clone link>

# 既に clone 済みの場合
git submodule update --init
cd .copilot-instructions
make setup
```

## instruction を最新に更新する

```bash
cd .copilot-instructions
git pull origin main
cd ..
git add .copilot-instructions
git commit -m "chore: update copilot-instructions"
```
