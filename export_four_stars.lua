--[[
--This script solves a problem that I have of shooting both raw and jpg images in my workflow.
]]

local dt = require "darktable"
local du = require "lib/dtutils"

local function destroy()
   -- nothing to destroy
end

function filter_images_by_rating(collection, target_rating)
   local selected_images = {}

   for k, v in pairs(collection) do
      -- nothing for now... TODO
   end -- iterating over selection
end

local script_data = {}
script_data.destroy = destroy



local selected_images = dt.gui.selection()

if selected_images then
   dt.print_log("Here are the filenames of the selected images:")
   for k, image in pairs(selected_images) do
      dt.print_log(k .. ": " .. image.filename)
   end
else
   print_error("no images selected")
end

return script_data

-- dt.print("this prints to control log")
-- dt.print_error("print error")
-- dt.print_log("plog it")