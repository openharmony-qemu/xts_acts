//
// Created on 2026/3/31.
//

#include "MainEventHandler.h"

#include <chrono>
#include <iostream>
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3201 // Global domain macro, identifying the business domain
#define LOG_TAG "testTag"  // Global tag macro, identifying module log tags

using namespace std::chrono_literals;

void MainEventHandler::Run()
{
    OH_LOG_INFO(LOG_APP, "testTag : Main start");
    while (!quit) {
        std::unique_lock lock(eventMutex);
        while (eventList.empty() && !quit) {
            eventCon.wait_for(lock, 10s);
        }
        if (quit) {
            break;
        }
        while (!eventList.empty()) {
            auto event = eventList.front();
            eventList.pop_front();
            if (event) {
                event();
            }
        }
    }

    OH_LOG_INFO(LOG_APP, "testTag : Main exit");
}

void MainEventHandler::Quit()
{
    quit = true;
    eventCon.notify_one();
}

void MainEventHandler::AddEvent(EventType &&event)
{
    std::lock_guard lock(eventMutex);
    eventList.emplace_back(std::move(event));
    eventCon.notify_one();
}