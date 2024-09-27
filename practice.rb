# create a new Class, User, that has the following attributes:
# - name
# - email
# - password

class User
    attr_accessor :name, :email, :password
    
    def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
    end
    
    def enter_room(room)
        room.add_user(self)
    puts "#{@name} entered to #{room.name} "
    end

    def send_message(room, content)
        message = Message.new(self, room, content)
        room.broadcast(message)
      end

    def acknowledge_message(room, message)
        puts "#{@name} acknowledged message in #{room.name}: #{message.content}"
    end
end

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users

class Room
    attr_accessor :name, :description, :users

    def initialize(name, description)
        @name = name
        @description = description
        @users = []
    end

    def add_user(user)
        @users << user
    end

    def broadcast(message)
        @users.each do |user|
          puts "#{user.name} broadcast message: #{message.content} in #{self.name}"
        end
    end
end

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content

class Message
    attr_accessor :user, :room, :content

    def initialize(user, room, content)
        @user = user
        @room = room
        @content = content
    end
end

user_A = User.new('Krasirit', 'krasirit@gmail.com', 'pass_lnwza')
user_B = User.new('Ruby', 'ruby_101@ruby.com', 'pass_rubyeiei')
room1 = Room.new('RuByRuBy Chat', 'This room for learn Ruby')
message = Message.new(user_A, room1, "Ready for learn?")

# add a method to user so, user can enter to a room
user_A.enter_room(room1)

# add a method to user so, user can send a message to a roomm
user_A.send_message(room1, message)
user_B.acknowledge_message(room1, Message.new(user_A, room1, "Hello!"))

# add a method to a room, so it can broadcast a message to all users
room1.broadcast(message)
