# Code generation
.PHONY: generate-code
generate-code:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: watch-and-generate-code
watch-and-generate-code:
	dart run build_runner watch --delete-conflicting-outputs