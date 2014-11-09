getcitoken
==========

Retrieves Gitlab-CI Token for Automated Runner Authentication

```
user ~/getcitoken % ruby getcitoken.rb
ba46f9b37eadd14a77ad
```

Output is logged to getcitoken.log

## Requirements

- mechanize & logger gems
- ruby 1.9 or newer

## Usage

1) Copy config.yml.example to config.yml edit un/pw and gitlab-ci URL

2) Run ```ruby getcitoken.rb```

3) Receive token and be forever happy!
