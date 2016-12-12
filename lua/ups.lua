require 'cairo'

function fRGBtoARGB (nColor, nAlpha)
    return ((nColor / 0x10000) % 0x100) / 255., ((nColor / 0x100) % 0x100) / 255.,(nColor % 0x100) / 255., nAlpha
end

function drawing()
    local cs = cairo_xlib_surface_create(conky_window.display,conky_window.drawable, conky_window.visual, conky_window.width,conky_window.height)
    cr = cairo_create(cs)
--    cairo_select_font_face (cr, 'Terminus', 0, 0)
--    cairo_set_font_size (cr, 20)
--    cairo_show_text(cr, 'Hello, World!')
    cairo_set_source_rgba (cr, fRGBtoARGB(0x000000,0.3))
    cairo_set_line_width (cr, 2)
--    cairo_move_to (cr, 10, 10)
--    cairo_line_to (cr, 200, 10)
--    cairo_move_to (cr, 200, 10)
--    cairo_line_to (cr, 200, 100)
--    cairo_move_to (cr, 10, 10)
--    cairo_line_to (cr, 10, 100)
--    cairo_line_to (cr, 10, 10)
    cairo_rectangle(cr, 1075, 794, 200, 200)
--    cairo_rectangle(cr, 950, 862, 200, 70)
--    cairo_rectangle(cr, 950, 935, 200, 70)
    cairo_fill(cr)
    cairo_stroke(cr)
    cairo_destroy(cr)
end 

function conky_start_lua()
    if conky_window == nil then
        return -1
    else
        drawing()
    end
end
