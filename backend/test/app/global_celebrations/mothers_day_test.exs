defmodule WhatTheDay.GlobalCelebrations.MothersDayTest do
  use ExUnit.Case, async: true
  use WhatTheDay.DateTools
  use WhatTheDay.CelebrationTools

  @subject WhatTheDay.GlobalCelebrations.MothersDay

  test "#days_left: Belarus" do
    assert_celebrated_on(@subject, parse_date!("2016-10-14"), WhatTheDay.Countries.Belarus)
  end
end
