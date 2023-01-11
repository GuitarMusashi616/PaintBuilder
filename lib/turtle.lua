local turtle = {}

turtle.forward = function() 
    print("turtle.forward()")
    return true
end

turtle.back = function()
    print("turtle.back()")
    return true
end

turtle.turnRight = function() 
    print("turtle.turnRight()")
    return true
end

turtle.turnLeft = function() 
    print("turtle.turnLeft()")
    return true
end

turtle.up = function() 
    print("turtle.up()")
    return true
end

turtle.down = function() 
    print("turtle.down()")
    return true
end

turtle.dig = function() 
    print("turtle.dig()")
    return true
end

turtle.digUp = function() 
    print("turtle.digUp()")
    return true
end

turtle.digDown = function() 
    print("turtle.digDown()")
    return true
end

turtle.place = function() 
    print("turtle.place()")
    return true
end

turtle.placeUp = function() 
    print("turtle.placeUp()")
    return true
end

turtle.placeDown = function() 
    print("turtle.placeDown()")
    return true
end

turtle.select = function(i)
    print(("turtle.select(%s)"):format(i))
    return true
end

turtle.getSelectedSlot = function()
    print("turtle.getSelectedSlot()")
    return 1
end

turtle.getItemCount = function(i)
    print(("turtle.getItemCount(%s)"):format(i))
    return 1
end

turtle.getItemDetail = function(i)
    print(("turtle.getItemDetail(%s)"):format(i))
    return {name="minecraft:cobblestone", count=32}
end

return turtle