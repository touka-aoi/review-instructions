# copilot-instructions/Makefile

.PHONY: setup clean

setup: ## 親プロジェクトに対してシンボリックリンクを作成
	mkdir -p ../.github
	ln -sf ../.copilot-instructions/base.md ../.github/copilot-instructions.md
	@echo "copilot-instructions をセットアップしました"

clean: ## シンボリックリンクを削除
	rm -f ../.github/copilot-instructions.md
	@echo "copilot-instructions を削除しました"