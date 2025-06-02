package tabler

render(rows) := rendered if {
	str_rows := _stringify(rows)
	col_cwid := _column_content_widths(str_rows)
	col_maxs := [max(widths) | some widths in col_cwid]

	top := concat("", ["┌", concat("┬", [_repeat("─", m) | some m in col_maxs]), "┐\n"])
	use := {
		false: concat("", ["├", concat("┼", [_repeat("─", m) | some m in col_maxs]), "┤\n"]),
		true: concat("", ["└", concat("┴", [_repeat("─", m) | some m in col_maxs]), "┘"]),
	}

	con := concat("", [lines |
		some i, row in str_rows

		next := use[i == (count(rows) - 1)]
		lines := _render_row(row, col_maxs, next)
	])

	rendered := concat("", [top, con])
}

_render_row(row, col_maxs, sep) := rendered if {
	con := sprintf("│%s│", [concat("│", [_pad_right(col, col_maxs[i]) | some i, col in row])])

	rendered := concat("\n", [con, sep])
}

_pad_right(s, width) := sprintf("%-*s", [width, s])

_column_content_widths(rows) := {col: widths |
	some col in numbers.range(0, count(rows[0]) - 1)

	widths := [count(sprintf("%v", [row[col]])) | some row in rows]
}

_stringify(rows) := [srow |
	some row in rows

	srow := [sprintf("%v", [col]) | some col in row]
]

_repeat(s, n) := replace(sprintf("%-*s", [n, " "]), " ", s) # regal ignore:sprintf-arguments-mismatch
