
about:
	ng version

help:
	ng help

project:
	ng new $(name)

tools:
	brew update
	brew install watchman
	brew install tree

run:
	 ng serve

open:
	open http://localhost:4200

component:
	ng generate component $(name)

