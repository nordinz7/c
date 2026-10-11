CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic -std=c17 -g
CPPFLAGS = -Iinclude

TARGET= app
BUILD_DIR= build

SOURCES = $(wildcard src/*.c)

OBJECTS= $(patsubst src/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

all: $(TARGET)

#link all object files into an executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

$(BUILD_DIR)/%.o: src/%.c | $(BUILD_DIR)
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

#include auto generated header dependencies
-include %$(OBJECTS:.o=.d)

app: src/main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(SOURCES) -o $(TARGET)

clean:
	rm -rf $(TARGET) $(BUILD_DIR)

.PHONY: all clean
