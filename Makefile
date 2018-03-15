NAME = OpenApplication
TARGET_NAME = open

BUILD_PATH = build

XCODE_PROJECT_PATH = $(NAME).xcodeproj
XCODE_SCHEME = $(NAME)
XCODE_ARCHIVE_PATH = $(BUILD_PATH)/$(NAME).xcarchive
XCODE_ARCHIVE_PRODUCT_PATH = $(XCODE_ARCHIVE_PATH)/Products/usr/local/bin/$(NAME)

TARGET_PATH = $(BUILD_PATH)/$(TARGET_NAME)

.PHONY: all
all: $(TARGET_PATH)

.PHONY: claen
clean:
	git clean -dfX

$(XCODE_ARCHIVE_PRODUCT_PATH):
	xcodebuild \
		-project "$(XCODE_PROJECT_PATH)" \
		-scheme "$(XCODE_SCHEME)" \
		-derivedDataPath "$(BUILD_PATH)" \
		-archivePath "$(XCODE_ARCHIVE_PATH)" \
		archive

$(TARGET_PATH): $(XCODE_ARCHIVE_PRODUCT_PATH)
	ditto $< $@
