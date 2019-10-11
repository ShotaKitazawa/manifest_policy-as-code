# About

マニフェストファイルのテストを行うツールの検証用リポジトリ

# conftest
* https://github.com/instrumenta/conftest

実行コマンド
```
cat sample.yaml | conftest test -p conftest/policy.rego -
```

# copper
* https://github.com/cloud66-oss/copper

実行コマンド
```
cat sample.yaml | copper validate --validator copper/policy.js --in -
```

