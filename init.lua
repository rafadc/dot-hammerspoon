hs.window.animationDuration = 0.01

columns = 9
rows = 2

local ctrl_alt = {"alt", "ctrl"}

function columnWidth(numberOfColumns)
   numberOfColumns = numberOfColumns or columns
   local window = hs.window.focusedWindow():screen():frame()
   return (window.w - window.x) / columns
end

function columnHeight(numberOfRows)
   numberOfRows = numberOfRows or rows
   local window = hs.window.focusedWindow():screen():frame()
   return (window.h - window.y) / rows
end

function resizeCurrentWindowInBlocks(x, y, w, h)
   local win = hs.window.focusedWindow()
   local f = win:frame()

   f.x = x * columnWidth()
   f.y = y * columnHeight()
   f.w = w * columnWidth()
   f.h = h * columnHeight()
   win:setFrame(f)
end

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
                  local deltas = { -columnWidth(), 0, columnWidth() }

                  resizeCurrentWindow(max.x, max.y, (max.w/2) + deltas[nextStep()], max.h)
end)

hs.hotkey.bind(ctrl_alt, "q", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local deltas = { -columnWidth(), 0, columnWidth() }

                  resizeCurrentWindow(max.x, max.y, (max.w/2) + deltas[nextStep()], max.h / 2)
end)

hs.hotkey.bind(ctrl_alt, "z", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local deltas = { -columnWidth(), 0, columnWidth() }

                  resizeCurrentWindow(max.x, max.y + max.h / 2, (max.w/2) + deltas[nextStep()], max.h / 2)
end)


hs.hotkey.bind(ctrl_alt, "s", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local next_step = nextStep()

                  resizeCurrentWindowInBlocks(3 - next_step,0,3 + next_step * 2,2)
end)

hs.hotkey.bind(ctrl_alt, "d", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local deltas = { -columnWidth(), 0, columnWidth() }
                  local next_step = nextStep()

                  resizeCurrentWindow(max.x + (max.w / 2) + deltas[next_step], max.y, max.w/2 - deltas[next_step], max.h)
end)

hs.hotkey.bind(ctrl_alt, "e", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local deltas = { -columnWidth(), 0, columnWidth() }
                  local next_step = nextStep()

                  resizeCurrentWindow(max.x + (max.w / 2) + deltas[next_step], max.y, max.w/2 - deltas[next_step], max.h / 2)
end)

hs.hotkey.bind(ctrl_alt, "c", function()
                  local max = hs.window.focusedWindow():screen():frame()
                  local deltas = { -columnWidth(), 0, columnWidth() }
                  local next_step = nextStep()

                  resizeCurrentWindow(max.x + (max.w / 2) + deltas[next_step], max.y + max.h / 2, max.w/2 - deltas[next_step], max.h / 2)
end)
