## 1. Environment

- Ruby 4.0.6
- Gemfile 4.0.16
- Bundler 4.0.16

## 2. Installation

```command
$ gem install spreen-pr
```

For development, install the dependencies via Gemfile and Bundler:

```command
$ bundle install
$ bundle lock --add-checksums
```

## 3. Execution

```command
$ pr-title hayat01sh1da/issue-89/service/improve-onboarding-flow
[service] Improve Onboarding Flow
```

With no argument, the current git branch is used:

```command
$ git switch hayat01sh1da/issue-90/hotfix/service/fix_login_crash
$ pr-title
[Hotfix][service] Fix Login Crash
```

`--format json` exposes the labels separately for scripting and CI:

```command
$ pr-title hayat01sh1da/issue-90/hotfix/service/fix_login_crash --format json
{"title":"[Hotfix][service] Fix Login Crash","labels":["Hotfix","service"]}
```

As a library:

```ruby
require 'spreen_pr' # or require 'spreen-pr'

SpreenPr::Application.run(branch_name: 'hayat01sh1da/issue-89/service/improve-onboarding-flow')
# => "[service] Improve Onboarding Flow"

application = SpreenPr::Application.new(branch_name: 'hayat01sh1da/issue-90/hotfix/service/fix_login_crash')
application.title  # => "[Hotfix][service] Fix Login Crash"
application.labels # => ["Hotfix", "service"]
```

## 4. Unit Test

```command
$ rake
Run options: --seed 30407

# Running:

...............

Finished in 0.002625s, 5715.1305 runs/s, 9906.2261 assertions/s.

15 runs, 26 assertions, 0 failures, 0 errors, 0 skips
```

## 5. Static Code Analysis

```command
$ bundle exec rubocop
Inspecting 12 files
............

12 files inspected, no offenses detected
```

## 6. Type Checks

```command
$ bundle exec rbs-inline --output sig/generated/ .
🎉 Generated 7 RBS files under sig/generated
$ bundle exec steep check
# Type checking files:

..............

No type error detected. 🫖
```

## 7. Build

```command
$ gem build spreen-pr.gemspec
$ gem install ./spreen-pr-0.1.1.gem
```
