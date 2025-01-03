set(CMAKE_SYSTEM_NAME Generic)  # 系统载体，嵌入式没有OS，Generic
set(CMAKE_SYSTEM_PROCESSOR arm) # 处理器类型

set(TARGET_TRIPLET "arm-none-eabi-")# 编译器版本前缀

# WIN系统下，添加".exe"扩展名后缀
if(WIN32)
    set(TOOLCHAIN_EXT ".exe")
else()
    set(TOOLCHAIN_EXT "")
endif(WIN32)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)# 使用静态库执行编译器测试

if("${ARM_TOOLCHAIN_PATH}" STREQUAL "")
    message("ARM_TOOLCHAIN_PATH is empty, use default system path")
else()
    set(ARM_TOOLCHAIN_PATH "${ARM_TOOLCHAIN_PATH}/")
    message("ARM_TOOLCHAIN_PATH is ${ARM_TOOLCHAIN_PATH}")
endif()

# 指定编译器
set(CMAKE_C_COMPILER    ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}gcc${TOOLCHAIN_EXT})
set(CMAKE_CXX_COMPILER  ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}g++${TOOLCHAIN_EXT})
set(CMAKE_ASM_COMPILER  ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}gcc${TOOLCHAIN_EXT})
set(CMAKE_LINKER        ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}gcc${TOOLCHAIN_EXT})
set(CMAKE_SIZE_UTIL     ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}size${TOOLCHAIN_EXT})
set(CMAKE_OBJCOPY       ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}objcopy${TOOLCHAIN_EXT})
set(CMAKE_OBJDUMP       ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}objdump${TOOLCHAIN_EXT})
set(CMAKE_NM_UTIL       ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}gcc-nm${TOOLCHAIN_EXT})
set(CMAKE_AR            ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}gcc-ar${TOOLCHAIN_EXT})
set(CMAKE_RANLIB        ${ARM_TOOLCHAIN_PATH}${TARGET_TRIPLET}gcc-ranlib${TOOLCHAIN_EXT})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)# 不查找
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_EXECUTABLE_SUFFIX_ASM     ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C       ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX     ".elf")

# 编译器选项
set(CMAKE_COMMON_FLAGS "-Wall -Wextra -Wshadow -Wpedantic -Wdouble-promotion")
set(CMAKE_COMMON_FLAGS "${CMAKE_COMMON_FLAGS} -ffunction-sections -fdata-sections")
set(CMAKE_COMMON_FLAGS "${CMAKE_COMMON_FLAGS} -Wno-unused-parameter -Wno-unused-function")

set(CMAKE_C_FLAGS 	"${MCPU_FLAGS} ${VFP_FLAGS} ${CMAKE_COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS "${MCPU_FLAGS} ${VFP_FLAGS} ${CMAKE_COMMON_FLAGS} -lstdc++ -lsupc++")
set(CMAKE_ASM_FLAGS "${MCPU_FLAGS} ${VFP_FLAGS} ${CMAKE_COMMON_FLAGS} -x assembler-with-cpp -MMD -MP")

set(CMAKE_EXE_LINKER_FLAGS "${LD_FLAGS} --specs=nano.specs --specs=nosys.specs")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections,-print-memory-usage")

set(CMAKE_C_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_CXX_ASM_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_ASM_FLAGS_DEBUG "")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "")

set(CMAKE_C_FLAGS_RELEASE "-O2 -g0")
set(CMAKE_CXX_FLAGS_RELEASE "-O2 -g0")
set(CMAKE_ASM_FLAGS_RELEASE "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "")
