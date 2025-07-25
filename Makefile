serve-drafts:
	JEKYLL_ENV=development bundle exec jekyll server --drafts

serve-live:
	JEKYLL_ENV=production bundle exec jekyll server

clean:
	rm -rf \
		_site \
		.jekyll-cache \
		.sass-cache

update: clean
	mkdir _site && cd _site \
		&& git clone https://github.com/stefaniuk-pages/stefaniuk.co.uk.git . \
		&& git checkout gh-pages \
		&& cd .. \
		&& JEKYLL_ENV=production bundle exec jekyll build

save: update
	cd _site \
		&& touch .nojekyll \
		&& git add -A \
		&& git commit -m "Publish"

publish: save # Publish the site to GitHub
	cd _site \
		&& git push

.SILENT:
