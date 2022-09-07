require "menu"

function love.load()
	menu:load()
	deltaX = (screenWidth - 120) / 2 
end

function love.update(dt)
	if menu.current_state == "menu" then
		menu:update(dt)
	else
		deltaX = deltaX + 100 * dt
		if deltaX > screenWidth then
			deltaX = 0
		end
	end
end

function love.draw()  
	if menu.current_state == "menu" then
		menu:draw()
	else
		love.graphics.print("Thanks for watching\n :D", deltaX, (screenHeight - 30) / 2)
	end
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == "m" then
		menu.current_state = menu.states.menu
	end
end

function love.mousepressed(x, y, b, istouch)
	if menu.current_state == "menu" then
		menu:mousepressed(x, y, b, istouch)
	end
end