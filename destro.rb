# destro.rb: this file kills CI Joes

class Destro
  def hunt
    `ps ax | grep cijoe`.each_line do |pid|
      next if filter(pid)
      system("kill -9 #{extract(pid)}")
    end
  end
  def filter(pid)
    pid !~ /ruby/
  end
  def extract(string)
    match = string.match(/^(\d+)/)
    match ? match[1].to_i : nil
  end
end

Destro.new.hunt if __FILE__ == $0

