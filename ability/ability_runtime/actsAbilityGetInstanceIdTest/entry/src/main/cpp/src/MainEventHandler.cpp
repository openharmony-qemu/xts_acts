//
// Created on 2026/3/31.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#include "MainEventHandler.h"

#include <chrono>

#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // Global domain macro, identifying the business domain
#define LOG_TAG "testTag"  // Global tag macro, identifying module log tags

using namespace std::chrono_literals;

void MainEventHandler::Run()
{
    OH_LOG_INFO(LOG_APP, "Main start");
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
    
    OH_LOG_INFO(LOG_APP, "Main exit");
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