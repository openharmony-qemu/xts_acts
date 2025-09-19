/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_MODEL_H
#define APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_MODEL_H
#include <stdint.h>
#include <string>

namespace OHOS {
namespace GameController {

/**
 * Device Type
 */
enum DeviceTypeEnum {
    UNKNOWN = 0,
    GAME_PAD = 1,
    HOVER_TOUCH_PAD = 2
};

struct BasicDeviceInfo {
    std::string uniq;
    std::string name;
    int32_t product;
    int32_t vendor;
    int32_t version;
    std::string phys;
    DeviceTypeEnum deviceType = UNKNOWN;
};

struct AllDeviceInfos {
    /**
     * List of all devices
     */
    std::vector<BasicDeviceInfo> allDeviceInfos;

    int32_t count;
};

/**
 * Game Device change event
 */
struct GameDeviceEvent {
    /**
     * Event type, which can be online or offline.
     */
    int32_t changeType;

    /**
     * Device Information
     */
    BasicDeviceInfo deviceInfo;
};

/**
 * Axis classification of game pad
 */
enum GamePadAxisSourceTypeEnum {
    /*
     * directional pad
     */
    Dpad = 0,

    /**
     * Left and right thumbstick
     */
    LeftThumbstick = 1,
    RightThumbstick = 2,

    /*
     * Left and right trigger
     */
    LeftTriggerAxis = 3,
    RightTriggerAxis = 4
};
/**
 * Axis Event
 */
struct AxisEvent {
    int32_t id;
    std::string uniq;
    GamePadAxisSourceTypeEnum axisSourceType;
    int64_t actionTime;
};

struct GamePadAxisEvent : AxisEvent {
    double xValue;
    double yValue;
    double zValue;
    double rzValue;
    double brakeValue;
    double gasValue;
    double hatxValue;
    double hatyValue;
};

/**
 * Key Information
 */
struct KeyInfo {
    int32_t keyCode;
    std::string keyCodeName;
    bool pressed;
    int64_t downTime;
};

struct ButtonEvent {
    int32_t id;
    std::string uniq;

    /*
     * down：0
     * up：1
     */
    int32_t keyAction;
    int32_t keyCode;
    std::string keyCodeName;
    std::vector<KeyInfo> keys;
    int64_t actionTime;
};

struct GamePadButtonEvent : ButtonEvent {
};
}// namespace GameController
}// namespace OHOS

#endif //APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_MODEL_H