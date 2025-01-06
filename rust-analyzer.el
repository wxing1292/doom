;;; rust-analyzer.el -*- lexical-binding: t; -*-
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))
(after! lsp-mode
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-command '("/opt/homebrew/bin/rust-analyzer"))
  (setq lsp-rust-full-docs nil
        lsp-completion-enable t
        lsp-eldoc-render-all nil
        lsp-idle-delay 0.8
        lsp-inlay-hint-enable nil

        lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-border "orange"

        lsp-ui-sideline-enable t
        lsp-ui-sideline-delay 0.4
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-symbol t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-update-mode 'point

        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-closure-return-type-hints t
        lsp-rust-analyzer-display-parameter-hints t
        lsp-rust-analyzer-display-reborrow-hints t

        lsp-rust-analyzer-cargo-watch-enable t
        lsp-rust-analyzer-cargo-watch-command "clippy"
        lsp-rust-analyzer-check-on-save t

        lsp-rust-analyzer-import-enforce-granularity t
        lsp-rust-analyzer-import-group nil
        lsp-rust-analyzer-import-granularity "item"
        lsp-rust-analyzer-import-prefix "by_crate"

        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-clippy-preference "on"
        ))
