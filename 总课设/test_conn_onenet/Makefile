
# 存放中间文件的路径
BUD_DIR = ./build
# 存放源文件的文件夹
SRC_DIR = ./sources
# 存放头文件的文件夹
INC_DIR = ./includes

# 定义变量
TARGET = $(BUD_DIR)/test
# 源文件集合
SRCS 	:= $(wildcard *.c $(SRC_DIR)/*.c)
# 目标文件集合（*.o）使用替换函数patsubst获取	
OBJS 	:= $(patsubst %.c, $(BUD_DIR)/%.o, $(notdir $(SRCS)))
# 头文件集合
INCS 	:= $(wildcard $(INC_DIR)/*.h)

#交叉编译工具链
CC	= arm-linux-gnueabihf-gcc
# CC		= gcc
# 指定头文件的路径
CFLAGS 	= $(patsubst %, -I%, $(INC_DIR))

# link
all:$(TARGET)
$(TARGET):$(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

# compile
$(BUD_DIR)/%.o:$(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(BUD_DIR)
	$(CC) -c -o $@ $< $(CFLAGS)

# clean
.PHONY:clean all
clean:
	rm -rf $(BUD_DIR)
