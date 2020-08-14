from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class ColorScheme(ColorScheme):

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg = black
            if context.empty or context.error:
                fg = black
            if context.border:
                fg = black
            if context.image:
                fg = blue
            if context.video:
                fg = blue
            if context.audio:
                fg = blue
            if context.document:
                fg = blue
            if context.container:
                fg = blue
            if context.directory:
                fg = black
            elif context.executable and not \
                    any((context.media, context.container,
                       context.fifo, context.socket)):
                attr |= bold
                fg = blue
            if context.socket:
                fg = blue
                attr |= bold
            if context.fifo or context.device:
                fg = red
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and red or red
            if context.bad:
                fg = 0
                bg = green
            if context.tag_marker and not context.selected:
                attr |= bold
                fg = 88
            if not context.selected and (context.cut or context.copied):
                attr = reverse
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 8
            if context.badinfo:
                if attr & reverse:
                    bg = 1
                else:
                    fg = red
            if context.selected:
                attr = bold
                if fg == black:
                    fg = white
                bg = black
            else:
                attr = normal
           
        elif context.in_titlebar:
            attr |= normal
            if context.hostname:
                fg = context.bad and black or black
            elif context.directory:
                fg = black
            elif context.tab:
                if context.good:
                    bg = 2

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = black
                elif context.bad:
                    fg = red
            if context.marked:
                attr |= bold | reverse
                fg = 88
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 9
            if context.loaded:
                bg = 1


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 4

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = 1
                else:
                    bg = 1

        return fg, bg, attr