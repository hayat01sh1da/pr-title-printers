## 1. Environment

- Ruby 4.0.3

## 2. Install Gems via Gemfile and Bundler

```command
$ bundle install
$ bundle lock --add-checksums
```

## 3. Execution

```command
$ cd ./ruby
$ ruby main.rb hayat01sh1da/issue-num/category/pr-title
[category] Pr Title
```

## 4. Unit Test

```command
$ ruby test/application_test.rb 
Run options: --seed 64793

# Running:

..

Finished in 0.003486s, 573.7272 runs/s, 573.7272 assertions/s.

2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

## 5. Static Code Analysis

```command
$ rubocop
Inspecting 5 files.....


5 files inspected, no offenses detected
```

## 6. Type Checks

```command
$ rbs-inline --output sig/generated/ .
🎉 Generated 3 RBS files under sig/generated
$ steep check
# Type checking files:

......

No type error detected. 🫖
```
