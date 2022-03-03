class Api::Robot::OrdersController < ApplicationController
    def command
      unless params[:commands].nil?
        @all_commands = params[:commands]
        @initial_command = @all_commands.shift.strip  
        if @initial_command =~ /PLACE/i
          set_order
          if @order.save!
            unless @all_commands.nil?
              set_move_commands 
              unless @order.x > 5 or @order.y > 5
                result_output
              else
                falling_robot!   
              end
            else
                result_output
            end
          else
            
          end
        else 
          render json: {message: "Please place valid PLACE Commands"}
        end
      else
        render json: {message: "Please place valid commands"}
      end
    end

    def set_order
      @places = @initial_command.split(/\,/)
      @x = @places[0].strip.split(/\s/)[1].strip.to_i
      @y = @places[1].strip.to_i
      @face = @places[2].strip.upcase
      @order = Order.new(x: @x, y: @y, face: @face)
    end

    def set_move_commands
      @all_commands.each do |cmd|
        cmd = cmd.strip.upcase
        case cmd
        when "MOVE"
            move_robot
        when "LEFT"
            left_move
        when "RIGHT"
            right_move
        when "REPORT"
        end
      end
    end

    def move_robot
      case @order.face
      when "EAST"
        @order.x = @order.x + 1 
      when "WEST"
        @order.x = @order.x - 1
      when "SOUTH"
        @order.y = @order.y - 1
      when "NORTH"
        @order.y = @order.y + 1
      end
    end

    def left_move
        case @order.face
        when "EAST"
          @order.face = "NORTH" 
        when "WEST"
          @order.face = "SOUTH"
        when "SOUTH"
          @order.face = "EAST"
        when "NORTH"
          @order.face = "WEST"
        end
    end

    def right_move
        case @order.face
        when "EAST"
          @order.face = "SOUTH" 
        when "WEST"
          @order.face = "NORTH"
        when "SOUTH"
          @order.face = "WEST"
        when "NORTH"
          @order.face = "EAST"
        end
    end

    def result_output
      render json: {location: [@order.x, @order.y, @order.face]}
    end

    def falling_robot!
      render json: {message: "please change commands! robot is about to falling!"}
    end
end



