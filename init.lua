hs.window.animationDuration = 0.1

columns = 9
rows = 2

local ctrl_alt = {"alt", "ctrl"}

local window = hs.window.focusedWindow():screen():frame()
local column_width = (window.w - window.x) / columns

function resizeCurrentWindow(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = x
  f.y = y
  f.w = w
  f.h = h
  win:setFrame(f)
end

step = 0
function nextStep()
   if (step == 3)
   then
      step = 1
   else
      step = step + 1
   end
   return step
end

hs.hotkey.bind(ctrl_alt, "0", function()
                  local max = hs.window.focusedWindow():screen():frame()

                  resizeCurrentWindow(max.x, max.y, max.w, max.h)
end)

hs.hotkey.bind(ctrl_alt, "a", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local deltas = { -column_width, 0, column_width }

                  resizeCurrentWindow(max.x, max.y, (max.w/2) + deltas[nextStep()], max.h)
end)

hs.hotkey.bind(ctrl_alt, "d", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local deltas = { -column_width, 0, column_width }
                  local next_step = nextStep()

                  resizeCurrentWindow(max.x + (max.w / 2) + deltas[next_step], max.y, max.w/2 + 2 * column_width - deltas[next_step], max.h)
end)
