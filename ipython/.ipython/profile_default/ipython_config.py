"""My ipython config."""

# pylint:disable=W0212


import IPython
import prompt_toolkit
from IPython.core.ultratb import VerboseTB
from prompt_toolkit.styles.pygments import pygments_token_to_classname
from prompt_toolkit.styles.style import Style
from pygments.token import Token

c = get_config()  # type: ignore # noqa # pylint:disable=E0602


# Fix completion highlighting as per https://github.com/ipython/ipython/issues/11526
def my_style_from_pygments_dict(pygments_dict):
    """Monkey patch prompt toolkit style function to fix completion colors."""
    pygments_style = []
    for token, style in pygments_dict.items():
        if isinstance(token, str):
            pygments_style.append((token, style))
        else:
            pygments_style.append((pygments_token_to_classname(token), style))
    return Style(pygments_style)


prompt_toolkit.styles.pygments.style_from_pygments_dict = my_style_from_pygments_dict
IPython.terminal.interactiveshell.style_from_pygments_dict = my_style_from_pygments_dict


# High-Contrast Colors
white = "#FFFFFF"
black = "#000000"
yellow = "#FFFF00"
magenta = "#FF00FF"
blue = "#0000FF"
cyan = "#00FFFF"
red = "#FF0000"
light_blue = "#61afef"
dark_gray = "#333841"
#mustard = "#FFCE1B"
#blush_pink = "#FF7782"
teal_blue = "#008080"


# See:
# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/src/prompt_toolkit/styles/defaults.py # noqa
c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.Comment: "bold yellow",
    Token.Keyword: "bold magenta",
    Token.Literal.String: "bold blue",
    Token.Name.Function: "bold cyan",
    Token.Operator: "bold red",
    Token.Error: "bg:#FF0000 fg:#FFFFFF bold",  # White text on red background
    Token.Generic.Error: "bg:#FF0000 fg:#FFFFFF bold",  # White text on red background
    # Yellow text on dark gray background
    Token.Generic.Traceback: "bg:#333333 fg:#FFFF00 bold",
    # Completion
    "completion-menu": f"bg:{dark_gray} fg:{white}",
    "completion-menu.completion.current": f"bg:{yellow} fg:{light_blue} bold",
    "completion-menu.completion": f"bg:{dark_gray} fg:{white}",
    "completion-menu.meta.completion.current": f"bg:{light_blue} fg:{black}",
    "completion-menu.meta.completion": f"bg:{dark_gray} fg:{white}",
    "completion-menu.multi-column-meta": f"bg:{dark_gray} fg:{white}",
}


VerboseTB._tb_highlight = f"bg:{teal_blue} bold"
VerboseTB.tb_highlight = f"bg:{teal_blue} bold"
