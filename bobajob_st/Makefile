#  Makefile for bobajob street disc image

all: stock_messages.6502 bobajob_st_data.6502
	beebasm -i bobajob_street.6502 -do bobajob_street.ssd -opt 3 -title "BOBAJOB ST"

bobajob_st.sqlite3:
	#[ -e bobajob_st.sqlite3 ] && rm bobajob_st.sqlite3
	sqlite3 bobajob_st.sqlite3 < bobajob_st.s3t
	../scripts/make_huffman_tree6 -q bobajob_st -w

stock_messages.6502: bobajob_st.sqlite3
	../scripts/mksm bobajob_st > stock_messages.6502

bobajob_st_data.6502: bobajob_st.sqlite3
	../scripts/pack_database5 -q bobajob_st -o bobajob_st_data.6502

clean:
	rm -f stock_messages.6502 bobajob_st.sqlite3 bobajob_st_data.6502
