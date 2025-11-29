/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

static int NUMBER_106404 = 106404;

namespace ArkUICapiTest {

static napi_value TestRenderNode001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRenderNode);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    auto rsNodeFirstChild = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto rsNodeSecondChild = OH_ArkUI_RenderNodeUtils_CreateNode();

    // 节点结构初始化
    auto result2 = OH_ArkUI_RenderNodeUtils_AddChild(rootRenderNode, rsNodeFirstChild);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result = OH_ArkUI_RenderNodeUtils_InsertChildAfter(rootRenderNode, rsNodeSecondChild, rsNodeSecondChild);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // 节点结构验证
    int count = 0;
    ArkUI_RenderNodeHandle nodeTemp;
    auto result3 = OH_ArkUI_RenderNodeUtils_GetChild(rootRenderNode, 1, &nodeTemp);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    auto result4 = OH_ArkUI_RenderNodeUtils_GetFirstChild(rootRenderNode, &nodeTemp);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    auto result5 = OH_ArkUI_RenderNodeUtils_GetNextSibling(rsNodeFirstChild, &nodeTemp);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_NO_ERROR);
    auto result6 = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(rsNodeSecondChild, &nodeTemp);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_RenderNodeHandle* nodeList;
    auto ret = OH_ArkUI_RenderNodeUtils_GetChildren(rootRenderNode, &nodeList, &count);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(count, 2); // expect 2 children

    auto result7 = OH_ArkUI_RenderNodeUtils_GetChildrenCount(rootRenderNode, &count);
    ASSERT_EQ(count, 2); // expect 2 children
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_NO_ERROR);

    auto result8 = OH_ArkUI_RenderNodeUtils_RemoveChild(rootRenderNode, rsNodeSecondChild);
    ASSERT_EQ(result8, ARKUI_ERROR_CODE_NO_ERROR);
    auto result9 = OH_ArkUI_RenderNodeUtils_ClearChildren(rootRenderNode);
    ASSERT_EQ(result9, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetChildrenCount(rootRenderNode, &count);
    ASSERT_EQ(count, 0);
    auto result10 = OH_ArkUI_RenderNodeUtils_DisposeNode(rootRenderNode);
    ASSERT_EQ(result10, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode001 result10=%{public}d", result10);
    auto result11 = OH_ArkUI_RenderNodeUtils_ClearChildren(nullptr);
    ASSERT_EQ(result11, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode001 result11=%{public}d", result11);
    auto result12 = OH_ArkUI_RenderNodeUtils_RemoveChild(nullptr, rsNodeSecondChild);
    ASSERT_EQ(result12, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode001 result12=%{public}d", result12);
    NAPI_END;
}

static napi_value TestRenderNode009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto rootRender = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRender);
    // 节点结构验证
    int count = 0;
    ArkUI_RenderNodeHandle nodeTemp;
    ArkUI_RenderNodeHandle* nodeList;
    auto result11 = OH_ArkUI_RenderNodeUtils_GetChildrenCount(nullptr, &count);
    ASSERT_EQ(result11, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result11=%{public}d", result11);
    auto result12 = OH_ArkUI_RenderNodeUtils_GetChildren(nullptr, &nodeList, &count);
    ASSERT_EQ(result12, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result12=%{public}d", result12);
    auto result13 = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(nullptr, &nodeTemp);
    ASSERT_EQ(result13, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result13=%{public}d", result13);
    auto result14 = OH_ArkUI_RenderNodeUtils_GetNextSibling(nullptr, &nodeTemp);
    ASSERT_EQ(result14, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result14=%{public}d", result14);
    auto result15 = OH_ArkUI_RenderNodeUtils_GetFirstChild(nullptr, &nodeTemp);
    ASSERT_EQ(result15, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result15=%{public}d", result15);
    auto result16 = OH_ArkUI_RenderNodeUtils_GetChild(nullptr, 1, &nodeTemp);
    ASSERT_EQ(result16, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result16=%{public}d", result16);
    
    auto result17 = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(rootRender, nullptr);
    ASSERT_EQ(result17, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result17=%{public}d", result17);
    auto result18 = OH_ArkUI_RenderNodeUtils_GetNextSibling(rootRender, nullptr);
    ASSERT_EQ(result18, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result18=%{public}d", result18);
    auto result19 = OH_ArkUI_RenderNodeUtils_GetFirstChild(rootRender, nullptr);
    ASSERT_EQ(result19, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result19=%{public}d", result19);
    auto result20 = OH_ArkUI_RenderNodeUtils_GetChild(rootRender, 1, nullptr);
    ASSERT_EQ(result20, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result20=%{public}d", result20);
    ASSERT_EQ(ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST, NUMBER_106404);
    auto result21 = OH_ArkUI_RenderNodeUtils_InsertChildAfter(nullptr, rsNodeSecondChild, rsNodeSecondChild);
    ASSERT_EQ(result21, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager" "TestRenderNode009 result21=%{public}d", result21);
    auto result22 = OH_ArkUI_RenderNodeUtils_AddChild(nullptr, rsNodeFirstChild);
    ASSERT_EQ(result22, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result22=%{public}d", result22);
    auto result23 = OH_ArkUI_RenderNodeUtils_DisposeNode(nullptr);
    ASSERT_EQ(result23, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result23=%{public}d", result23);
    NAPI_END;
}

static napi_value TestRenderNode002(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRenderNode);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    auto result2 = OH_ArkUI_RenderNodeUtils_AttachContentModifier(rootRenderNode, modifier);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    // 测试 float property
    ArkUI_FloatPropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(0.5f);  // set value=0.5f
    float value = 0.0f;
    auto result3 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 0.5f);  // expect value equals to 0.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(property, 1.5f);  // set value=1.5f
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    auto result5 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 1.5f);  // expect value equals to 1.5f
    auto result6 = OH_ArkUI_RenderNodeUtils_AttachFloatProperty(modifier, property);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_NO_ERROR);

    auto result7 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(nullptr, &value);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result7=%{public}d", result7);
    auto result8 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(nullptr, 1.5f);
    ASSERT_EQ(result8, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result8=%{public}d", result8);
    auto result9 = OH_ArkUI_RenderNodeUtils_AttachFloatProperty(modifier, nullptr);
    ASSERT_EQ(result9, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result9=%{public}d", result9);
    auto result10 = OH_ArkUI_RenderNodeUtils_AttachContentModifier(nullptr, modifier);
    ASSERT_EQ(result10, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result10=%{public}d", result10);
    
    // float property 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeFloatProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    auto result11 = OH_ArkUI_RenderNodeUtils_DisposeNode(rootRenderNode);
    ASSERT_EQ(result11, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result11=%{public}d", result11);
    NAPI_END;
}

static napi_value TestRenderNode003(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_Vector2PropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateVector2Property(0.5f, 0.5f);

    // 测试 Vector2Property
    float x = 0.0f;
    float y = 0.0f;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(property, &x, &y);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result1=%{public}d", result1);
    ASSERT_EQ(x, 0.5f);  // expect x equals to 0.5f
    ASSERT_EQ(y, 0.5f);  // expect y equals to 0.5f
    auto result2 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(property, 1.5f, 1.5f);  // set x, y=1.5f
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result2=%{public}d", result2);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(property, &x, &y);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result3=%{public}d", result3);
    ASSERT_EQ(x, 1.5f);  // expect x equals to 1.5f
    ASSERT_EQ(y, 1.5f);  // expect y equals to 1.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachVector2Property(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result4=%{public}d", result4);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(nullptr, &x, &y);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(nullptr, 1.5f, 1.5f);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachVector2Property(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result7=%{public}d", result7);
    // float property 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeVector2Property(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode004(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_FloatAnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(0.5f);  // set value=0.5f

    // 测试 FloatAnimatableProperty
    float value = 0.0f;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 0.5f);  // expect value equals to 0.5f
    auto result2 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(property, 1.5f);  // set value=1.5f
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 1.5f);  // expect value equals to 1.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachFloatAnimatableProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(nullptr, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode004 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(nullptr, 1.5f);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode004 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachFloatAnimatableProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode004 result7=%{public}d", result7);
    // FloatAnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeFloatAnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode005(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_ColorPropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateColorProperty(0xFF0000FF);  // set value=0xFF0000FF
    
    // 测试 ColorProperty
    uint32_t value = 0;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(property, &value);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(property, 0xFF00FF00);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachColorProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(nullptr, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode005 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(nullptr, 0xFF00FF00);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode005 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachColorProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode005 result7=%{public}d", result7);
    
    // ColorProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeColorProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode006(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_Vector2AnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(0.5f, 0.5f);  // set x, y=0.5f

    // 测试 Vector2AnimatableProperty
    float x = 0.0f;
    float y = 0.0f;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property, &x, &y);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 0.5f);  // expect x equals to 0.5f
    ASSERT_EQ(y, 0.5f);  // expect y equals to 0.5f
    auto result2 = OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(property, 1.5f, 1.5f);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property, &x, &y);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 1.5f);  // expect x equals to 1.5f
    ASSERT_EQ(y, 1.5f);  // expect y equals to 1.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachVector2AnimatableProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(nullptr, &x, &y);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode006 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(nullptr, 1.5f, 1.5f);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode006 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachVector2AnimatableProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode006 result7=%{public}d", result7);
    
    // Vector2AnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeVector2AnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode007(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_ColorAnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateColorAnimatableProperty(0xFF0000FF);  // set value=0xFF0000FF

    // 测试 ColorAnimatableProperty
    uint32_t value = 0;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(property, 0xFF00FF00);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachColorAnimatableProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);

    auto result5 = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(nullptr, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode007 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(nullptr, 0xFF00FF00);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode007 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachColorAnimatableProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode007 result7=%{public}d", result7);
    
    // ColorAnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeColorAnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode008(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto contentModifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    static bool drawCallbackCalled = false;
    auto drawCallback = [](ArkUI_DrawContext* context, void* userData) {
        drawCallbackCalled = true;
    };

    // 设置 ContentModifier 的 onDraw 回调
    int userData = 123;
    auto result = OH_ArkUI_RenderNodeUtils_SetContentModifierOnDraw(contentModifier, &userData, drawCallback);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // 销毁 ContentModifier
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(contentModifier);
    NAPI_END;
}
} // namespace ArkUICapiTest