function love.conf(t)
  t.window = nil
end

-- Global configuration
config = {}

-- The config automatically refreshes when this file is saved.
config.update = function()
  local mtime = love.filesystem.getLastModified('config.lua')
  if not config.lastModified or mtime > config.lastModified then
    package.loaded.conf = nil
    require 'conf'
    config.lastModified = mtime
  end
end

-- The input mapping. Maps virtual controls to keys that trigger the control.
config.input = {
  up = { 'up', 'w' },
  down = { 'down', 's' },
  left = { 'left', 'a' },
  right = { 'right', 'd' },
  a = { 'z' },
  b = { 'x' }
}

-- List of animations. Each animation needs to specify the width and height of
-- each frame, as well as the number of frames (length). The spritesheet should
-- have the same name as the key.
config.animations = {
  player = {
    width = 30,
    height = 24,
    length = 4
  }
}

config.player = {
  swimSpeed = 8, --burst
  sinkRate = .5
}

config.shark = {
  swimSpeed = 8, --constant
  swimAnimationDelay = .25
}

config.jellyfish = {
  swimSpeed = 4, --burst
  swimAnimationDelay = {.25, .25, .25}
}

config.squid = {
  swimSpeed = 16, --burst
  sinkAnimationDelay = .75,
  swimAnimationDelay = .12
}

config.smallFish = {
  swimSpeed = 10, --constant
  swimAnimationDelay = .25
}
