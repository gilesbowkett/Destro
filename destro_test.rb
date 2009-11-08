require 'test/unit'
require 'destro'

# this is a shell script, but I'm testing the regex, because regexes are a PITA otherwise

class DestroTest < Test::Unit::TestCase
  def setup
    @destro = Destro.new
  end
  def test_filter
    assert @destro.filter("24871 pts/3    S+     0:00 grep cijoe")
    assert !(@destro.filter("24835 pts/0    Sl+    0:00 ruby /home/gilesbowkett/.rip/active/bin/cijoe vidli/"))
  end
  def test_regex
    @localhost = "31949 s002  S+     0:11.72 ruby /Users/gilesbowkett/.rip/active/bin/cijoe towelie/"
    @ubuntu_vm = "24835 pts/0    Sl+    0:00 ruby /home/gilesbowkett/.rip/active/bin/cijoe vidli/"
    assert_equal 31949, @destro.extract(@localhost)
    assert_equal 24835, @destro.extract(@ubuntu_vm)
    assert_nothing_raised { @destro.extract("argle bargle") }
  end
end

