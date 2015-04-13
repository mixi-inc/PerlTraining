all:
	carton exec ./markdown2impress/bin/markdown2impress.pl README.md
	open 'http://localhost:5000/'
install:
	carton install
	git clone git@github.com:yoshiki/markdown2impress.git
clean:
	git clean -fdx
startserver:
	carton exec plackup -R index.html

