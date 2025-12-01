/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "plugin_switch_acts.h"

using namespace std;

namespace OHOS {
namespace ResourceScheduleActs {
namespace {
static const char* XML_TAG_PLUGIN_LIST = "pluginlist";
static const char* XML_TAG_PLUGIN = "plugin";
static const char* XML_ATTR_LIB_PATH = "libpath";
static const char* XML_ATTR_LIB_PATH_EXE = "libpathexe";
static const char* XML_ATTR_SWITCH = "switch";
static const char* SWITCH_ON = "1";
}

bool PluginSwitchActs::IsInvalidNode(const xmlNode& currNode)
{
    if (!currNode.name || currNode.type == XML_COMMENT_NODE) {
        return true;
    }
    return false;
}

bool PluginSwitchActs::FillinPluginInfo(const xmlNode* currNode, PluginInfo& info, bool isRssExe)
{
    xmlChar *attrValue = nullptr;
    if (!isRssExe) {
        attrValue = xmlGetProp(currNode, reinterpret_cast<const xmlChar*>(XML_ATTR_LIB_PATH));
    } else {
        attrValue = xmlGetProp(currNode, reinterpret_cast<const xmlChar*>(XML_ATTR_LIB_PATH_EXE));
    }
    if (!attrValue) {
        return false;
    }
    std::string libPath = reinterpret_cast<const char*>(attrValue);
    xmlFree(attrValue);
    if (libPath.empty()) {
        return false;
    }
    info.libPath = libPath;
 
    attrValue = xmlGetProp(currNode, reinterpret_cast<const xmlChar*>(XML_ATTR_SWITCH));
    if (attrValue) {
        std::string value = reinterpret_cast<const char*>(attrValue);
        if (value == SWITCH_ON) {
            info.switchOn = true;
        }
        xmlFree(attrValue);
    }
    return true;
}

bool PluginSwitchActs::LoadFromConfigContent(const string& content, bool isRssExe)
{
    // skip the empty string, else you will get empty node
    xmlDocPtr xmlDocPtr = xmlReadMemory(content.c_str(), content.length(), nullptr, nullptr,
        XML_PARSE_NOBLANKS | XML_PARSE_NOERROR | XML_PARSE_NOWARNING | XML_PARSE_NOENT);
    if (!xmlDocPtr) {
        return false;
    }
    xmlNodePtr rootNodePtr = xmlDocGetRootElement(xmlDocPtr);
    if (!rootNodePtr || !rootNodePtr->name ||
        xmlStrcmp(rootNodePtr->name, reinterpret_cast<const xmlChar*>(XML_TAG_PLUGIN_LIST)) != 0) {
        xmlFreeDoc(xmlDocPtr);
        return false;
    }

    xmlNodePtr currNodePtr = rootNodePtr->xmlChildrenNode;
    for (; currNodePtr; currNodePtr = currNodePtr->next) {
        if (IsInvalidNode(*currNodePtr)) {
            continue;
        }

        if (xmlStrcmp(currNodePtr->name, reinterpret_cast<const xmlChar*>(XML_TAG_PLUGIN)) != 0) {
            xmlFreeDoc(xmlDocPtr);
            return false;
        }

        PluginInfo info;
        if (!FillinPluginInfo(currNodePtr, info, isRssExe)) {
            continue;
        }
        pluginSwitchMap_[info.libPath] = info;
    }
    xmlFreeDoc(xmlDocPtr);
    return true;
}
} // namespace ResourceScheduleActs
} // namespace OHOS
