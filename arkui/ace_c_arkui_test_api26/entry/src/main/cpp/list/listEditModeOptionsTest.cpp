#include "../common/common.h"
#include "../manager/PluginManagerTest.h"
 
#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>
 
#define PARAM_1003022 1003022
#define PARAM_1003004 1003004
#define PARAM_1004000 1004000
 
namespace ArkUICapiTest {
 
static napi_value ListEditModeOptionsTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ListEditModeOptionsTest_001 result=%{public}d", NODE_LIST_EDIT_MODE_OPTIONS);
    ASSERT_EQ(NODE_LIST_EDIT_MODE_OPTIONS, PARAM_1003022);
    NAPI_END;
}
 
static napi_value ListEditModeOptionsTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_EDIT_MODE_OPTIONS, &value_item);
    auto ret1 = nodeAPI->getAttribute(list, NODE_LIST_EDIT_MODE_OPTIONS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_1);
    NAPI_END;
}
 
static napi_value ListEditModeOptionsTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
 
    ArkUI_NumberValue value[] = {{.i32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_EDIT_MODE_OPTIONS, &value_item);
    auto ret1 = nodeAPI->getAttribute(list, NODE_LIST_EDIT_MODE_OPTIONS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_0);
    NAPI_END;
}
 
static napi_value ListEditModeOptionsTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret1 = nodeAPI->resetAttribute(list, NODE_LIST_EDIT_MODE_OPTIONS);
    ASSERT_EQ(ret1, SUCCESS);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_EDIT_MODE_OPTIONS);
    ASSERT_EQ(result->value[PARAM_0].i32, PARAM_1);
    NAPI_END;
}
 
static napi_value ListEditModeChangeTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ListEditModeChangeTest_001 result=%{public}d", NODE_LIST_ON_EDIT_MODE_CHANGE);
    ASSERT_EQ(NODE_LIST_ON_EDIT_MODE_CHANGE, PARAM_1003004);
    NAPI_END;
}
 
static napi_value ListItemSelectTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ListItemSelectTest_001 result=%{public}d", NODE_LIST_ITEM_ON_SELECT);
    ASSERT_EQ(NODE_LIST_ITEM_ON_SELECT, PARAM_1004000);
    NAPI_END;
}
}