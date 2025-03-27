--- @file doxygen.lua
--- @brief This module provides functions to generate and manage Doxygen comments in Neovim buffers.
--- @version 1.0
---
--- This file contains functions to automate the insertion and verification of Doxygen comments
--- in Lua code, ensuring compliance with Doxygen standards.
---
--- @defgroup DoxygenModule Doxygen Management Module
--- @{
---
--- @brief Functions for managing Doxygen comments in Neovim.
--- @version 1.0

local M = {}

--- @brief Generates or updates Doxygen comments for the current buffer.
---
--- This function constructs a prompt to ensure precise AI behavior in generating
--- or updating Doxygen comments for the code in the current buffer.
function M.document()
  local buf = vim.api.nvim_get_current_buf()
  local buffer_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local buffer_content = table.concat(buffer_lines, "\n")

  -- Construct a stricter prompt to ensure precise AI behavior
  local doxy_prompt = [[
ONLY OUTPUT NEW DOXYGEN COMMENTS FOR THE PROVIDED CODE BELOW.

STRICT RULES:
1. DO NOT include or repeat any code from the provided input.
2. DO NOT output existing Doxygen comments if they are already correct and complete.
3. VERIFY existing Doxygen comments for accuracy and completeness; output ONLY if updates are necessary.
4. GENERATE missing Doxygen comments for:
   - File-level documentation (@file).
   - Group definitions (@defgroup).
   - Functions and members.
5. FOLLOW Doxygen standards strictly for formatting and content.

INPUT CODE:
]] .. buffer_content .. [[

OUTPUT ONLY THE NECESSARY NEW DOXYGEN COMMENTS BELOW:
]]

  -- Pass prompt safely escaped to your AI command
  vim.cmd(":AvanteAsk '" .. doxy_prompt:gsub("'", "\\'") .. "'")
end

function M.update()
  local buf = vim.api.nvim_get_current_buf()
  local buffer_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local buffer_content = table.concat(buffer_lines, "\n")

  -- Construct a stricter prompt to ensure precise AI behavior
  local doxy_prompt = [[
ONLY OUTPUT UPDATED DOXYGEN COMMENTS FOR THE PROVIDED CODE BELOW.

STRICT RULES:
1. DO NOT include or repeat any code from the provided input.
2. DO NOT output existing Doxygen comments if they are already correct and complete.
3. VERIFY existing Doxygen comments for accuracy and completeness; output ONLY if updates are necessary.
4. GENERATE missing Doxygen comments for:
   - File-level documentation (@file).
   - Group definitions (@defgroup).
   - Functions and members.
5. FOLLOW Doxygen standards strictly for formatting and content.

INPUT CODE:
]] .. buffer_content .. [[

OUTPUT ONLY THE NECESSARY UPDATED DOXYGEN COMMENTS BELOW:
]]

  -- Pass prompt safely escaped to your AI command
  vim.cmd(":AvanteAsk '" .. doxy_prompt:gsub("'", "\\'") .. "'")
end

--- @brief Ensures the presence of a @defgroup comment in the current buffer.
---
--- This function checks if a @defgroup comment exists in the current buffer and
--- inserts a new one if it is missing, providing a template for group documentation.
function M.doxygen_defgrouper()
  local buf = vim.api.nvim_get_current_buf()
  local buffer_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local buffer_content = table.concat(buffer_lines, "\n")

  -- Check if @defgroup exists
  local defgroup_exists = buffer_content:find("/%*%*%s*@defgroup")

  -- Insert @defgroup if missing
  if not defgroup_exists then
    local defgroup_comment_start = [[
/**
 * @defgroup GroupName Brief description of this module or group.
 * @{
 *
 * Detailed description clearly explaining purpose and usage.
 *
 * @version 1.0
 */
]]

    local defgroup_comment_end = [[
/** @} */
]]

    vim.api.nvim_buf_set_lines(buf, 0, 0, false, vim.split(defgroup_comment_start, "\n"))
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, vim.split(defgroup_comment_end, "\n"))

    vim.notify("Inserted new @defgroup definition comments.", vim.log.levels.INFO)
  end
end

return M

