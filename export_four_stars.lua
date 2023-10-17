--[[
--This script solves a problem that I have of shooting both raw and jpg images in my workflow.
]]

local dt = require "darktable"
local df = require "lib/dtutils.file"

local function destroy()
   -- nothing to destroy
end

-- debug function
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function filter_images_by_rating(collection, target_rating)
   local selected_images = {}

   for k, v in pairs(collection) do
      -- nothing for now... TODO
   end -- iterating over selection
end

function get_file_name(fname) -- from something like DSCF0001.RAF
   for substr in string.gmatch(fname, "([^.]+)") do
      return substr
   end
end

local script_data = {}
script_data.destroy = destroy

dt.print_log('.................. script call STARTS .................. ')
local selected_images = dt.gui.selection()
dt.print_log("Table: " .. dump(selected_images))

dt.print_log("DEBUG: Filenames of the selected images...")
for k, image in pairs(selected_images) do
   dt.print_log(k .. ": " .. get_file_name(image.filename))
end

dt.print_log("DEBUG: Creating export directory....")
local this_dir = selected_images[1].path
df.mkdir(this_dir .. "\\four_star_jpgs")

dt.print_log("DEBUG: Copying")

dt.print_log('.................. script call ENDS .................. ')
return script_data