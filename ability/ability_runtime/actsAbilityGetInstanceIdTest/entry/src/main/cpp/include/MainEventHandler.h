//
// Created on 2026/3/31.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef NATIVETHREAD_MAINEVENTHANDLER_H
#define NATIVETHREAD_MAINEVENTHANDLER_H

#include <condition_variable>
#include <list>
#include <mutex>

using EventType = std::function<void(void)>;

class MainEventHandler {
public:
    void Run();
    void Quit();
    
    void AddEvent(EventType &&event);
private:
    std::condition_variable eventCon;
    std::mutex eventMutex;
    std::list<EventType> eventList;
    
    std::atomic_bool quit = false;
};

#endif //NATIVETHREAD_MAINEVENTHANDLER_H
