use Mix.Config
alias Dogma.Rule

config :dogma,
  rule_set: Dogma.RuleSet.All,
  override: [
    %Rule.LineLength{ max_length: 120 },
    %Rule.FunctionParentheses{ enabled: false },
    %Rule.PipelineStart{ enabled: false },
  ]
