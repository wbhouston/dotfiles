return {
        "OXY2DEV/markview.nvim",
        config = function()
                require("markview").setup({
                    markdown = {
                        headings = {
                            heading_1 = { icon_hl = "@markup.link", icon = "[%d] " },
                            heading_2 = { icon_hl = "@markup.link", icon = "[%d.%d] " },
                            heading_3 = { icon_hl = "@markup.link", icon = "[%d.%d.%d] " }
                        }
                    }
                });
        end,
}
