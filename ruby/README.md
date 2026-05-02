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
$ rake
Run options: --seed 1828

# Running:

..

Finished in 0.002832s, 706.2429 runs/s, 706.2429 assertions/s.

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
