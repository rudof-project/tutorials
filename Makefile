.PHONY: help build clean serve install

help:
	@echo "Available targets:"
	@echo "  install  - Install dependencies"
	@echo "  build    - Build the Jupyter Book"
	@echo "  clean    - Remove built book files"
	@echo "  serve    - Serve the book locally (after building)"

install:
	pip install -r requirements.txt

build:
	jupyter-book build .

clean:
	jupyter-book clean .

serve:
	@echo "Opening book in browser..."
	@if [ -d "_build/html" ]; then \
		python -m http.server --directory _build/html 8000; \
	else \
		echo "Error: Book not built yet. Run 'make build' first."; \
	fi
