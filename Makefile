DEPS_DIR=./deps
DIST_DIR=./dist
APP_DIR=app
APP_MAIN=main:main
DEPS_FILE=$(APP_DIR)/requirements.txt
TARGET=app.pyz

default: $(TARGET)

deps:
	@echo Installing dependencies to $(DEPS_DIR)
	@mkdir -p $(DEPS_DIR)
	@python -m pip install -r $(DEPS_FILE) --target $(DEPS_DIR)/

clean:
	@echo Cleaning up..
	@rm -rf $(DEPS_DIR)
	@rm -rf $(DIST_DIR)

$(TARGET): deps
	@echo Copying dependencies to $(DIST_DIR)
	@cp -R $(DEPS_DIR) $(DIST_DIR)
	@echo Copying application to $(DIST_DIR)
	@cp -R $(APP_DIR) $(DIST_DIR)
	@echo Packaging dist folder to $(TARGET)
	@python -m zipapp $(DIST_DIR) -o $(TARGET) --main=$(APP_MAIN)
	@echo Cleaning up..
	@rm -rf $(DIST_DIR)
