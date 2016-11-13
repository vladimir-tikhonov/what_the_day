defmodule WhatTheDay.GlobalCelebrations.ProgrammersDayTest do
  use ExUnit.Case, async: true
  use WhatTheDay.DateTools
  use WhatTheDay.CelebrationTools

  @subject WhatTheDay.GlobalCelebrations.ProgrammersDay

  test "#days_left: international (non-leap year)" do
    assert_celebrated_on(@subject, parse_date!("2015-09-13"))
  end

  test "#days_left: international (leap year)" do
    assert_celebrated_on(@subject, parse_date!("2016-09-12"))
  end
end
