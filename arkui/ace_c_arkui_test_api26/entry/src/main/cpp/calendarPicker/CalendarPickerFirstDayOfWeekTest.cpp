/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "../common/common.h"
#include "../manager/PluginManagerTest.h"

#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

// ARKUI_NODE_CALENDAR_PICKER and NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK (value 16008) are
// introduced in API 26.2.0. They may not be defined in earlier SDK headers; define local
// aliases for compatibility.
#ifndef ARKUI_NODE_CALENDAR_PICKER
#define ARKUI_NODE_CALENDAR_PICKER static_cast<ArkUI_NodeType>(16)
#endif

#ifndef NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK
#define NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK static_cast<ArkUI_NodeAttributeType>(16008)
#endif

// CalendarFirstDayOfWeek enum values (0-7).
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_LOCAL = 0; // Follow system locale
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_MON = 1;   // Monday
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_TUE = 2;   // Tuesday
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_WED = 3;   // Wednesday
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_THU = 4;   // Thursday
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_FRI = 5;   // Friday
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_SAT = 6;   // Saturday
static const int32_t CALENDAR_FIRST_DAY_OF_WEEK_SUN = 7;   // Sunday

static napi_value TestCalendarPickerFirstDayOfWeek001(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_LOCAL;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

static napi_value TestCalendarPickerFirstDayOfWeek002(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_MON;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

static napi_value TestCalendarPickerFirstDayOfWeek003(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_TUE;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

static napi_value TestCalendarPickerFirstDayOfWeek004(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_WED;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

static napi_value TestCalendarPickerFirstDayOfWeek005(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_THU;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

static napi_value TestCalendarPickerFirstDayOfWeek006(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_FRI;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

static napi_value TestCalendarPickerFirstDayOfWeek007(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_SAT;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

static napi_value TestCalendarPickerFirstDayOfWeek008(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    int32_t firstDayOfWeek = CALENDAR_FIRST_DAY_OF_WEEK_SUN;
    ArkUI_NumberValue value[] = {{.i32 = firstDayOfWeek}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK);
    ASSERT_EQ(result->value[PARAM_0].i32, firstDayOfWeek);
    NAPI_END;
}

} // namespace ArkUICapiTest
