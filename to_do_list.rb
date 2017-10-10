# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (model)
# 4. Manipulating the in-memory objects that model a real-life Todo list (domain-specific model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
require 'csv'

class List
  attr_accessor :tasks

  def initialize
    todo = Array.new
    CSV.read('todo.csv', 'r').each{|task| todo << task}
    @tasks = todo
  end

  def add(task)
    CSV.open('todo.csv', 'a+') do |w|
      w << [task.status, task.name]
    end
    puts "Appended #{task.name} to our TODO list"
  end

  def delete(task_name)
    new_tasks = Array.new
    CSV.read('todo.csv', 'r').each_with_index do |task, index|
      if task_name.class == String
        new_tasks << task unless task[1] == task_name
      else
        new_tasks << task unless index+1 == task_name.to_i
      end
    end
    CSV.open('todo.csv', 'w+') do |w|
      new_tasks.each{|task| w << task}
    end
    puts "Deleted #{task_name} from your TODO list"
  end

  def list
    list = List.new
    list.tasks.each_with_index do |task, index|
      puts "#{index+1}. #{task[1]}"
    end
  end

end


class Task
  attr_reader :name, :status

  def initialize(name, status="N")
    @name = name
    @status = status
  end
end



case ARGV.length
  when 0
    puts "Please provide an argument"
  when 1
    List.new.send(ARGV[0])
  else
  task_name = ARGV[1..-1].join(" ")
  task = ARGV[0].to_sym ==  :add ? Task.new(task_name) : task_name
  List.new.send(ARGV[0],task)
end
