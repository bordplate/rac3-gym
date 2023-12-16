//
// Created by Vetle Hjelle on 20/12/2022.
//

#include "Game.h"

#include <rc3/rc3.h>

#include <lib/vector.h>
#include <lib/logger.h>
#include <lib/memory.h>

#include <sys/random_number.h>
#include <sysutil/sysutil_msgdialog.h>

#include "PersistentStorage.h"

// For whatever dumb reason I can't get the compiler to include
//  .cpp files under /lib/, so it's defined here.
// Maybe better to just have it here anyway. Idk.
LogLevel Logger::log_level_ = Debug;

void Game::start() {

}

void Game::on_tick() {

}

void Game::before_player_spawn() {

}

void Game::on_render() {

}

void Game::transition_to(View *view) {
    Logger::trace("Starting transition to a new view");

    if (current_view) {
        current_view->on_unload();
        delete current_view;
    }

    current_view = view;
    current_view->on_load();

    Logger::trace("Done transitioning");
}

void Game::alert(String& message) {
    cellMsgDialogOpen2(CELL_MSGDIALOG_TYPE_SE_TYPE_NORMAL, message.c_str(), nullptr, nullptr, nullptr);
}

extern "C" void _c_game_tick() {
    Game::shared().on_tick();
}

extern "C" void _c_game_render() {
    Game::shared().on_render();
}

extern "C" void _c_game_start() {
    Game::shared().start();
}

extern "C" void _c_game_quit() {

}

extern "C" void _c_on_respawn() {
    Game::shared().before_player_spawn();
}