
require('Comment').setup()
local calculate_comment_string = require('Comment.ft').calculate
local utils = require('Comment.utils')

--- Get the comment string {beg,end} table
---@param ctype integer 1 for `line`-comment and 2 for `block`-comment
---@return table comment_strings {begcstring, endcstring}
local get_cstring = function(ctype)
  -- use the `Comments.nvim` API to fetch the comment string for the region (eq. '--%s' or '--[[%s]]' for `lua`)
  local cstring = calculate_comment_string { ctype = ctype, range = utils.get_region() } or vim.bo.commentstring
  -- as we want only the strings themselves and not strings ready for using `format` we want to split the left and right side
  local left, right = utils.unwrap_cstr(cstring)
  -- create a `{left, right}` table for it
  return { left, right }
end

local function create_box(opts)
  local pl = opts.padding_length or 4
  local function pick_comment_start_and_end()
    -- because lua block comment is unlike other language's,
    --  so handle lua ctype
    local ctype =  2
    if vim.opt.ft:get() == 'lua' then
      ctype = 1
    end
    local cs = get_cstring(ctype)[1]
    local ce = get_cstring(ctype)[2]
    if ce == '' or ce == nil then
      ce = cs
    end
    return cs, ce
  end
  return {
    -- top line
    f(function (args)
      local cs, ce = pick_comment_start_and_end()
      return cs .. string.rep(string.sub(cs, #cs, #cs), string.len(args[1][1]) + 2 * pl ) .. ce
    end, { 1 }),
    t{"", ""},
    f(function()
      local cs = pick_comment_start_and_end()
      return cs .. string.rep(' ',  pl)
    end),
    i(1, 'box'),
    f(function()
      local cs, ce = pick_comment_start_and_end()
      return string.rep(' ',  pl) .. ce
    end),
    t{"", ""},
    -- bottom line
    f(function (args)
      local cs, ce = pick_comment_start_and_end()
      return cs .. string.rep(string.sub(ce, 1, 1), string.len(args[1][1]) + 2 * pl ) .. ce
    end, { 1 }),
  }
end

return {
    s({ trig = "box" }, create_box({ box_width = 24 })),
    s({ trig = "bbox" }, create_box({})),
	s("trig", t("load\ned!!")),
}
