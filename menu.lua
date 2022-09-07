menu = {}

function menu:load()
	self.font = love.graphics.newFont(30)
	love.graphics.setFont(self.font)

	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()

	self.buttons = {
					"Start",
					"Highscore",
					"Quit"
				   }

				   -- yOU CAN ADD BUTTONS SIMPLY BY INSERTING IT HERE

	self.mousebox = {x = 0, y = 0, width = 10, height = 10}

	self.states = {menu = "menu", action = "action"}
	self.current_state = self.states.menu

	_mousebox = self.mousebox
end

function menu:update(dt)
	_mousebox.x = love.mouse.getX()
	_mousebox.y = love.mouse.getY()
end

function menu:draw()
	love.graphics.rectangle("line", (screenWidth - 350) / 2, 50, 350, 100)
	love.graphics.print("GAME THING", ((screenWidth - 350) / 2) + 100, 100)

	for i = 1, #self.buttons do 
		local btn = {}
		btn.width = 100
		btn.height = 50
		btn.x = (screenWidth - btn.width) / 2
		btn.y = (i * 100) + (screenHeight - btn.height) / 3
		btn.text = self.buttons[i]
		
		if CheckCollision(_mousebox, btn) then
			btn.mode = "fill"
		else
			btn.mode = "line"
		end

		love.graphics.rectangle(btn.mode, btn.x, btn.y, btn.width, btn.height)
		love.graphics.print(btn.text, btn.x, btn.y)
	end
end

function menu:mousepressed(x, y, b, istouch)
	for i = 1, #self.buttons do 
		local btn = {}
		btn.width = 100
		btn.height = 50
		btn.x = (screenWidth - btn.width) / 2
		btn.y = (i * 100) + (screenHeight - btn.height) / 3
		btn.id = i
		
		if b == "l" then
			if CheckCollision(_mousebox, btn) then
				if btn.id == 1 then
					self.current_state = self.states.action
				end

				if btn.id == 3 then
					love.event.quit()
				end
			end
		end	
	end
end	

function CheckCollision(a, b)
	return a.x < b.x + b.width and
		   b.x < a.x + a.width and
		   a.y < b.y + b.height and
		   b.y < a.y + a.height 
end