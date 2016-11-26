SCRIPT_PATH=$(dirname $(realpath $0))
cd $SCRIPT_PATH/../mlss_slides/
echo "Now in $(pwd)"
# Doubly nested PDFs first
# to avoid processing the HTML folders generated
# by processing the singly nested folders
# (which will be done in next for loop, below)
for slides_dir in ./*/*/; do
	cd $slides_dir
	echo "Moved into $(pwd)"
	for pdffile in *.pdf; do
		# ensure a PDF file is globbed
		ls ./*.pdf 1> /dev/null 2>&1
		if [[ $? -eq 2 ]]; then break; fi
		if [[ -d ./html ]]; then
			echo "‣ Previous HTML conversion found, \
			cancelling"
			break
		fi
		echo "• Converting $pdffile"
		mkdir html
		cp $pdffile ./html/
		cd html
		pdftohtml ./*.pdf
		rm ./*.pdf
		cd $SCRIPT_PATH/../mlss_slides/
	done
	cd $SCRIPT_PATH/../mlss_slides/
done

cd $SCRIPT_PATH/../mlss_slides/
echo "Now in $(pwd)"
for slides_dir in ./*/; do
	cd $slides_dir
	echo "Moved into $(pwd)"
	for pdffile in *.pdf; do
		# ensure a PDF file is globbed
		ls ./*.pdf 1> /dev/null 2>&1
		if [[ $? -eq 2 ]]; then break; fi
		if [[ -d ./html ]]; then
			echo "‣ Previous HTML conversion found, \
			cancelling"
			break
		fi
		echo "• Converting $pdffile"
		mkdir html
		cp $pdffile ./html/
		cd html
		pdftohtml ./*.pdf
		rm ./*.pdf
		cd $SCRIPT_PATH/../mlss_slides/
	done
	cd $SCRIPT_PATH/../mlss_slides/
done
