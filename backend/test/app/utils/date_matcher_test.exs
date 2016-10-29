defmodule WhatTheDay.Utils.DateMatchersHelperTest do
  use(ExUnit.Case, async: true)
  use(WhatTheDay.DateTools, async: true)

  alias(WhatTheDay.Utils.DateMatchersHelper)
  alias(WhatTheDay.DateMatchers)

  test "#matches? with DateMatchers.Simple: today" do
    date_matcher = %DateMatchers.Simple{day: 10, month: 1}
    assert(DateMatchersHelper.matches?(parse_date!("2016-01-10"), date_matcher))
  end

  test "#matches? with DateMatchers.Simple: yesterday" do
    date_matcher = %DateMatchers.Simple{day: 10, month: 1}
    refute(DateMatchersHelper.matches?(parse_date!("2016-01-09"), date_matcher))
  end

  test "#matches? with DateMatchers.Countdown: 0 days left" do
    date_matcher = %DateMatchers.Countdown{countdown_func: fn(%Date{}) -> 0 end}
    assert(DateMatchersHelper.matches?(parse_date!("2016-01-09"), date_matcher))
  end

  test "#matches? with DateMatchers.Countdown: more than 0 days left" do
    date_matcher = %DateMatchers.Countdown{countdown_func: fn(%Date{}) -> 42 end}
    refute(DateMatchersHelper.matches?(parse_date!("2016-01-09"), date_matcher))
  end

  test "#matches? with DateMatchers.Falsy" do
    date_matcher = %DateMatchers.Falsy{}
    refute(DateMatchersHelper.matches?(parse_date!("2016-01-09"), date_matcher))
  end

  test "#days_left with DateMatchers.Simple: current year" do
    date_matcher = %DateMatchers.Simple{day: 10, month: 1}
    assert(DateMatchersHelper.days_left(parse_date!("2016-01-01"), date_matcher) == 9)
  end

  test "#days_left with DateMatchers.Simple: next year" do
    date_matcher = %DateMatchers.Simple{day: 10, month: 1}
    assert(DateMatchersHelper.days_left(parse_date!("2016-01-11"), date_matcher) == 365)
  end

  test "#days_left with DateMatchers.Simple: today" do
    date_matcher = %DateMatchers.Simple{day: 10, month: 1}
    assert(DateMatchersHelper.days_left(parse_date!("2016-01-10"), date_matcher) == 0)
  end

  test "#days_left with DateMatchers.Countdown" do
    date_matcher = %DateMatchers.Countdown{countdown_func: fn(%Date{}) -> 42 end}
    assert(DateMatchersHelper.days_left(parse_date!("2016-01-10"), date_matcher) == 42)
  end
end
