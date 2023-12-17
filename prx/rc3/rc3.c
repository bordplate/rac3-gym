#include "rc3.h"
#include "common.h"

#include "bridging.h"

#include <sysutil/sysutil_gamecontent.h>

#include <cell/cell_fs.h>

extern "C" {

SHK_HOOK(int, cellGameBootCheck, unsigned int*, unsigned int*, CellGameContentSize*, char*);
int cellGameBootCheckHook(unsigned int* type, unsigned int* attributes, CellGameContentSize* size, char* dirName) {
    MULTI_LOG("Type: %p, attr: %p, size: %p, dirName: %p\n", type, attributes, size, dirName);

    *type = 2;
    *attributes = 0;
    size->hddFreeSizeKB = 100000;
    size->sizeKB = -1;
    size->sysSizeKB = 4;

    int fd;
    const char* src;
    // Manually copying the string
    // Check if digital version exists and use that. Otherwise fall back to disc. If no disc then we just crash
    CellFsErrno ebootStat = cellFsOpendir("/dev_hdd0/game/NPEA00387/", &fd);
    if (ebootStat == CELL_FS_ENOENT) {
        src = "BCES01503";
    } else {
        src = "NPEA00387";
    }
    while (*src) {
        *dirName = *src;
        dirName++;
        src++;
    }
    *dirName = '\0';  // Null terminate the string

    MULTI_LOG("Done the thing\n");

    return 0;
}

SHK_HOOK(int, cellGameContentPermit, char*, char*);
int cellGameContentPermitHook(char* contentInfoPath, char* usrdirPath) {
    MULTI_LOG("contentInfoPath: %p, usrdirPath: %p\n", contentInfoPath, usrdirPath);

    int fd;
    const char *src;

    // Check if digital version exists and use that. Otherwise fall back to disc. If no disc then we just crash
    CellFsErrno ebootStat = cellFsOpendir("/dev_hdd0/game/NPEA00387/", &fd);
    if (ebootStat == CELL_FS_ENOENT) {
        src = "/dev_bdvd/PS3_GAME";
    } else {
        src = "/dev_hdd0/game/NPEA00387";
    }
    while (*src) {
        *contentInfoPath = *src;
        contentInfoPath++;
        src++;
    }
    *contentInfoPath = '\0';  // Null terminate the string

    if (ebootStat == CELL_FS_ENOENT) {
        src = "/dev_bdvd/PS3_GAME/USRDIR";
    } else {
        src = "/dev_hdd0/game/NPEA00387/USRDIR";
    }
    while (*src) {
        *usrdirPath = *src;
        usrdirPath++;
        src++;
    }
    *usrdirPath = '\0';  // Null terminate the string

    MULTI_LOG("Done the thing\n");

    return 0;
}

SHK_HOOK(void, pre_game_loop, void);
void pre_game_loop_hook() {
    _c_game_tick();
}


void rc3_init() {
    MULTI_LOG("Multiplayer initializing.\n");

    init_memory_allocator(memory_area, sizeof(memory_area));

    SHK_BIND_HOOK(cellGameBootCheck, cellGameBootCheckHook);
    SHK_BIND_HOOK(cellGameContentPermit, cellGameContentPermitHook);

    SHK_BIND_HOOK(pre_game_loop, pre_game_loop_hook);

    MULTI_LOG("Initialized memory allocator. Binding hooks\n");

    MULTI_LOG("Bound hooks\n");
}

void rc3_shutdown() {

}

};